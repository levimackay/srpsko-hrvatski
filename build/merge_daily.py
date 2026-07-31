#!/usr/bin/env python3
"""Fold the Daily Word Sheets into the main dictionary.

His daily sheets are ~2,700 word pairs he never had time to file. They belong
in the dictionary proper. Two wrinkles:

  * The sheets mix Cyrillic and Latin. Serbian Cyrillic -> Latin is an exact
    1:1 mapping, so transliterating is lossless and lets them alphabetize.
  * Many lines are bare words with no gloss. The earlier reflow glued those
    onto the previous entry. Real wraps are detected here by measuring whether
    the previous line actually reached the column edge.
"""
import json, re, os, sys, unicodedata
from pdfminer.high_level import extract_pages
from pdfminer.layout import LTTextContainer, LTChar, LAParams

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PDF = '/Users/levimackay/Downloads/Српско-хрватски.pdf'
DAILY_PAGES = range(172, 205)

# ---------------------------------------------------------------- extraction
def daily_lines():
    lp = LAParams(line_margin=0.35, char_margin=1.5, word_margin=0.15, boxes_flow=None)
    rows = []
    for pno, pl in enumerate(extract_pages(PDF, laparams=lp), start=1):
        if pno not in DAILY_PAGES:
            continue
        page = []
        for el in pl:
            if not isinstance(el, LTTextContainer):
                continue
            for line in el:
                t = line.get_text().rstrip('\n').rstrip()
                if not t.strip():
                    continue
                page.append({'x0': round(line.x0, 1), 'x1': round(line.x1, 1),
                             'y': round(line.y0, 1), 'text': t})
        left = sorted([r for r in page if r['x0'] < 310], key=lambda r: -r['y'])
        right = sorted([r for r in page if r['x0'] >= 310], key=lambda r: -r['y'])
        rows.extend(left + right)
    return rows

CYR = 'абвгдђежзијклљмнњопрстћуфхцчџшАБВГДЂЕЖЗИЈКЛЉМНЊОПРСТЋУФХЦЧЏШ'
LAT = ['a','b','v','g','d','đ','e','ž','z','i','j','k','l','lj','m','n','nj',
       'o','p','r','s','t','ć','u','f','h','c','č','dž','š',
       'A','B','V','G','D','Đ','E','Ž','Z','I','J','K','L','Lj','M','N','Nj',
       'O','P','R','S','T','Ć','U','F','H','C','Č','Dž','Š']
CYRMAP = dict(zip(CYR, LAT))

def translit(s):
    if not any(c in CYRMAP for c in s):
        return s, False
    return ''.join(CYRMAP.get(c, c) for c in s), True


def parse_items(rows):
    """Split into (serbian, english) pairs, treating a line as a continuation
    only when the previous line actually ran to the column edge."""
    items = []
    prev = None
    for r in rows:
        t = r['text'].strip()
        if re.fullmatch(r'\d{1,3}', t):
            continue
        if re.fullmatch(r'[●•·▪]{3,}', t):
            prev = None
            continue
        if t in ('Дневни Речи', 'Дневне Речи'):
            prev = None
            continue
        width = r['x1'] - r['x0']
        wrapped = prev is not None and prev['width'] > 200   # column is ~228pt
        # A line opening with "(" is always a continuation of the entry above
        # — that's how he writes conjugations: "dozvòliti - to allow (P);
        # I allow" / "(dozvolim)".
        if prev is not None and t.startswith('('):
            items[-1] = items[-1] + ' ' + t
            prev = {'width': width}
            continue
        if wrapped and not re.search(r'\s[-–—]\s', t):
            items[-1] = items[-1] + ' ' + t
            prev = {'width': width}
            continue
        items.append(t)
        prev = {'width': width}
    return items


SPLIT = re.compile(r'\s*[-–—]\s+|\s+[-–—]\s*')

def to_pair(item):
    item = re.sub(r'\s{2,}', ' ', item).strip()
    m = SPLIT.split(item, maxsplit=1)
    if len(m) == 2 and m[0].strip() and m[1].strip():
        return m[0].strip(), m[1].strip()
    return item, ''          # bare word, no gloss


# ---------------------------------------------------- Serbo-Croatian collation
ALPHA = ['a','b','c','č','ć','d','dž','đ','e','f','g','h','i','j','k','l','lj',
         'm','n','nj','o','p','q','r','s','š','t','u','v','w','x','y','z','ž']
RANK = {c: i for i, c in enumerate(ALPHA)}
DIGRAPHS = ('dž', 'lj', 'nj')

def defold(w):
    """Strip stress diacritics (dozvòliti -> dozvoliti) but keep č ć đ š ž."""
    keep = {'č', 'ć', 'đ', 'š', 'ž'}
    out = []
    for ch in w:
        if ch in keep:
            out.append(ch); continue
        d = unicodedata.normalize('NFD', ch)
        base = ''.join(c for c in d if not unicodedata.combining(c))
        b = unicodedata.normalize('NFC', base)
        out.append(b if b else ch)
    return ''.join(out)

def sortkey(word):
    w = defold(word.casefold().strip())
    w = re.sub(r'^[^a-zA-Zčćđšž]+', '', w)
    out, i = [], 0
    while i < len(w):
        two = w[i:i+2]
        if two in DIGRAPHS:
            out.append(RANK[two]); i += 2
        elif w[i] in RANK:
            out.append(RANK[w[i]]); i += 1
        else:
            i += 1
    return out

def letter_of(word):
    w = re.sub(r'^[^a-zA-ZčćđšžA-ZČĆĐŠŽ]+', '', word.strip())
    if not w:
        return None
    two = w[:2].casefold()
    if two in DIGRAPHS:
        return two.capitalize()
    return w[0].upper()


# ---------------------------------------------------------------- generated
def generated_items():
    """The thematic lists that were appended to the chapter (not his)."""
    p = os.path.join(ROOT, 'book', 'chapters', 'daily-word-lists.md')
    if not os.path.exists(p):
        return []
    md = open(p).read()
    i = md.find('## Where To Go Next')
    if i < 0:
        return []
    out = []
    for ln in md[i:].split('\n'):
        m = re.match(r'^-\s+(.*)$', ln.strip())
        if not m:
            continue
        s, e = to_pair(m.group(1).replace('—', ' - '))
        if s:
            out.append((s, e))
    return out


def main():
    rows = daily_lines()
    items = parse_items(rows)
    pairs = [to_pair(x) for x in items]
    pairs = [(s, e) for s, e in pairs if s and len(s) < 80]
    print(f'daily sheet items parsed : {len(pairs)}')

    gen = generated_items()
    print(f'thematic (added) items   : {len(gen)}')

    entries = json.load(open(os.path.join(ROOT, 'data', 'entries.json')))
    existing = {e['headword'].casefold().strip() for e in entries}

    maxid = max(e['id'] for e in entries)
    newid = max(maxid, 10100) + 1

    def build(pairs, is_generated):
        nonlocal newid
        made, skipped = [], 0
        seen = set()
        for s, e in pairs:
            hw, was_cyr = translit(s)
            hw = hw.strip().strip('.,;:')
            key = defold(hw.casefold())
            # Fragments left over from wrapping, and things that aren't words.
            body_ok = bool(e.strip())
            clean_hw = bool(re.fullmatch(
                r"[A-Za-zČĆĐŠŽčćđšžÀ-ÿ][A-Za-zČĆĐŠŽčćđšžÀ-ÿ \-'’,()]*", hw))
            balanced = hw.count('(') == hw.count(')')
            bad = (not hw
                   or len(hw) < 2
                   or not body_ok                      # no gloss = not usable
                   or not clean_hw or not balanced     # wrap fragments
                   or '"' in hw or ';' in hw
                   # Q/W/X/Y aren't in the alphabet; these are reversed or stray
                   or (letter_of(hw) or '') in ('Q', 'W', 'X', 'Y')
                   or not re.match(r'^[A-Za-zČĆĐŠŽčćđšž]', defold(hw)))
            if bad or key in existing or key in seen:
                skipped += 1
                continue
            seen.add(key)
            body = e.strip()
            if was_cyr:
                body = (body + ' ' if body else '') + f'(Cyr: {s.strip()})'
            ent = {
                'id': newid, 'page': None, 'letter': letter_of(hw),
                'level': 0, 'bullet': None, 'lines': [hw], 'colors': {},
                'raw': (hw + ' | ' + body).strip(' |'),
                'headword': hw, 'body': body,
                # His own sheet words carry no markers yet, so they are exactly
                # what his own legend calls blue: "might need more love".
                'tag': None if is_generated else 'BLUE',
                'from_daily': True,
                'generated': is_generated,
            }
            made.append(ent)
            newid += 1
        return made, skipped

    his, skip_his = build(pairs, False)
    add, skip_add = build(gen, True)
    print(f'his words merged         : {len(his)}   (skipped {skip_his} dupes/blanks)')
    print(f'thematic words merged    : {len(add)}   (skipped {skip_add} dupes/blanks)')

    # --- insert alphabetically, keeping each parent's children attached ------
    groups, cur = [], None
    for e in entries:
        if e.get('level', 0) == 0:
            cur = {'key': sortkey(e['headword']), 'letter': e.get('letter'),
                   'items': [e]}
            groups.append(cur)
        elif cur is not None:
            cur['items'].append(e)
        else:
            groups.append({'key': sortkey(e['headword']),
                           'letter': e.get('letter'), 'items': [e]})

    for e in his + add:
        groups.append({'key': sortkey(e['headword']), 'letter': e['letter'],
                       'items': [e], 'new': True})

    def gkey(g):
        L = g.get('letter') or ''
        base = L[:2].capitalize() if L[:2].lower() in DIGRAPHS else (L[:1].upper() if L else '')
        li = RANK.get(base.casefold(), 99)
        return (li, g['key'])

    groups.sort(key=gkey)

    merged = [it for g in groups for it in g['items']]
    for e in merged:
        if not e.get('letter'):
            e['letter'] = letter_of(e['headword'])

    json.dump(merged, open(os.path.join(ROOT, 'data', 'entries.json'), 'w'),
              ensure_ascii=False, indent=0)
    print(f'dictionary entries now   : {len(merged)}  (was {len(entries)})')

if __name__ == '__main__':
    main()
