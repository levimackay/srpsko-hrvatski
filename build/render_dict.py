#!/usr/bin/env python3
"""Render entries.json (+ agent enrichment) into book/chapters/dictionary.typ"""
import json, re, os, glob, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
D = os.path.join(ROOT, 'data')

# ---------- load ----------
entries = json.load(open(os.path.join(D, 'entries.json')))
enrich = {}
for f in sorted(glob.glob(os.path.join(D, 'enriched', '*.json'))):
    try:
        for o in json.load(open(f)):
            if 'id' in o:
                enrich.setdefault(o['id'], {}).update(
                    {k: v for k, v in o.items() if k != 'id' and v})
    except Exception as e:
        print(f'  !! skipped {os.path.basename(f)}: {e}', file=sys.stderr)

# ---------- typst escaping ----------
ESC = {'\\': '\\\\', '#': '\\#', '$': '\\$', '*': '\\*', '_': '\\_',
       '@': '\\@', '<': '\\<', '>': '\\>', '`': '\\`', '"': '\\"',
       '[': '\\[', ']': '\\]', '(': '\\(', ')': '\\)'}
def esc(s):
    s = ''.join(ESC.get(c, c) for c in s)
    # "1. obese; 2. thick" would otherwise become a Typst enum (a block), which
    # is illegal inside a paragraph and gets silently dropped. Same for a
    # leading "-" or "+", which start list items.
    s = re.sub(r'(?<=\d)\.(?=\s)', r'\\.', s)
    s = re.sub(r'(^|(?<=\s))([-+])(?=\s)', r'\1\\\2', s)
    return s

# ---------- his markers get the dark-red treatment ----------
MARKER_RE = re.compile(r"""(
    \((?:Noun|noun|adj|Adj|adv|Adv|Conj|conj|Verb|verb|excl|Excl|excl\.|
        Prep|prep|Pron|pron|Num|num|interj|case|Imp|Perf|Imperf|
        [mfn]|LW|CF|GenPl|FE|ME|Anim|Inan|Unc|
        \+?a|\+ov|\+ev|e|o|No\s*"a"|
        [a-zšđčćž]->[a-zšđčćž]|
        Bos|Hrv|Srp|Bos\?|Hrv\?|Srp\?
      )\)
  | \[(?:[BCSEJI](?:\s*,\s*[BCSEJI])*)\]
)""", re.X)

STRESS_RE = re.compile(r'\|([^|]*\*[^|]+\*[^|]*)\|')
# Splitting on the first "|" eats the opening pipe of a leading stress mark,
# leaving "abe*CE*da| alphabet". Put it back before anything else runs.
LEAD_STRESS_RE = re.compile(r'^\s*([^|]*\*[^|]+\*[^|]*)\|')

def restore_lead_stress(body):
    m = LEAD_STRESS_RE.match(body)
    return '|' + body.lstrip() if m else body

def render_body(text):
    """Colorize his markers, typeset his |stress| notation."""
    out, pos = [], 0
    # stress first
    for m in STRESS_RE.finditer(text):
        out.append(('t', text[pos:m.start()]))
        out.append(('s', m.group(1)))
        pos = m.end()
    out.append(('t', text[pos:]))

    parts = []
    for kind, chunk in out:
        if kind == 's':
            parts.append(f'#stress("{chunk}")')
            continue
        p, last = [], 0
        for m in MARKER_RE.finditer(chunk):
            p.append(esc(chunk[last:m.start()]))
            p.append('#marker[' + esc(m.group(0)) + ']')
            last = m.end()
        p.append(esc(chunk[last:]))
        parts.append(''.join(p))
    return ' '.join(x for x in parts if x.strip()) or ''

# ---------- assemble ----------
LETTER_ORDER = ['A','B','C','Č','Ć','D','Dž','Đ','E','F','G','H','I','J','K',
                'L','Lj','M','N','Nj','O','P','R','S','Š','T','U','V','Z','Ž']

lines = ['#import "../lib.typ": *', '', '#chapter[The Dictionary]',
         '#runhead("Dictionary")', '']
lines.append('#note[Entries in #text(fill: BLUE)[blue] are ones I marked as needing more '
             'love. #text(fill: GOLD)[Gold] means the word has a lot of branches but isn\'t '
             'its own root word. #text(fill: PINK)[Pink] is a loan word natives actually use. '
             '#text(fill: GREEN)[Green] is a city name or a question word. Anything with a '
             '#degmark after it was filled in later and I haven\'t personally checked it — '
             'trust the unmarked stuff first.]')
lines.append('')
lines.append('#columns(2, gutter: 0.62em)[')

cur_letter = None
n_filled = 0
for e in entries:
    L = e.get('letter') or ''
    base = L[:2] if L[:2] in ('Dž','Lj','Nj') else L[:1]
    base = base.upper() if len(base) == 1 else base
    if base and base != cur_letter and base in LETTER_ORDER:
        cur_letter = base
        lines.append(f'#letterhead[{base}]')

    body_src = restore_lead_stress(e['body'])
    body = render_body(body_src)

    ex = enrich.get(e['id'], {})
    add = []
    if ex.get('stress') and not STRESS_RE.search(e['raw']):
        add.append(f'#g(stress("{ex["stress"]}"))')
    for k in ('pos', 'gender', 'aspect', 'declension'):
        v = ex.get(k)
        if v and str(v).strip() and str(v) not in body_src:
            add.append('#g(marker[' + esc(str(v)) + '])')
    if ex:
        n_filled += 1

    pieces = []
    if add and add[0].startswith('#g(stress'):
        pieces.append(add[0]); add = add[1:]
    if body: pieces.append(body)
    pieces.extend(add)
    full = ' '.join(pieces).strip()

    if ex.get('example'):
        full += ' #linebreak() #text(size: 8.4pt, style: "italic")[' \
                + esc(str(ex['example'])) + '] ' + '#degmark'

    # Headwords are passed as Typst *strings*, not markup, so the markup
    # escapes above would show up literally ("argumen\(a\)t").
    hw = e['headword'].replace('\\', '\\\\').replace('"', '\\"')
    args = []
    if e.get('tag'): args.append(f'tag: "{e["tag"]}"')
    if e.get('level'): args.append(f'level: {e["level"]}')
    if e.get('bullet'): args.append(f'bullet: [{esc(e["bullet"])}]')
    argstr = (', ' + ', '.join(args)) if args else ''

    if full:
        lines.append(f'#entry("{hw}", [{full}]{argstr})')
    else:
        lines.append(f'#entry("{hw}", none{argstr})')

lines.append(']')

out = os.path.join(ROOT, 'book', 'chapters', 'dictionary.typ')
os.makedirs(os.path.dirname(out), exist_ok=True)
open(out, 'w').write('\n'.join(lines))
print(f'entries rendered : {len(entries)}')
print(f'enrichment merged: {n_filled} entries from {len(enrich)} records')
print(f'wrote            : {out}')
