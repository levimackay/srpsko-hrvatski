#!/usr/bin/env python3
"""Build an English -> Serbian/Croatian reverse index from the entries.

The original book only goes one way. This lets you look up the English word
when you can't remember which Serbian one you wanted.
"""
import json, re, os, collections

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
entries = json.load(open(os.path.join(ROOT, 'data', 'entries.json')))

# Strip anything that isn't the gloss itself.
PAREN = re.compile(r'\([^)]*\)|\[[^\]]*\]|\|[^|]*\|')
NOISE = re.compile(r'^(see|rel:|rt:|br:|npr\.?|\*)', re.I)
DROP = {
    'a','an','the','to','of','in','on','at','for','and','or','but','is','are',
    'be','it','its','this','that','with','from','as','by','not','no','some',
    'something','someone','somebody','one','oneself','sth','sb','etc','so',
    'up','down','out','off','over','into','about','who','whom','which',
    'more','most','very','also','than','then','when','where','how','what',
}

index = collections.defaultdict(set)

for e in entries:
    hw = e['headword'].strip()
    if not hw or len(hw) > 40:
        continue
    body = e['body']
    # cut off usage examples and notes
    body = body.split(' - ')[0]
    body = PAREN.sub(' ', body)
    body = re.sub(r'\s+', ' ', body).strip(' ;,.')
    if not body or NOISE.match(body):
        continue
    for sense in re.split(r'[;,]| / ', body):
        s = sense.strip().strip('.;,: ')
        s = re.sub(r'^\d+\.?\s*', '', s)
        s = re.sub(r'^to\s+', '', s)          # normalize verbs
        s = s.strip()
        if not s or len(s) > 34:
            continue
        if not re.match(r"^[A-Za-z][A-Za-z '\-]*$", s):
            continue
        w = s.lower()
        if w in DROP or len(w) < 2:
            continue
        if len(w.split()) > 3:
            continue
        index[w].add(hw)

# Drop hyper-generic buckets that would just be noise.
index = {k: v for k, v in index.items() if len(v) <= 25}

letters = collections.defaultdict(list)
for eng in sorted(index, key=lambda s: (s[0].lower(), s)):
    letters[eng[0].upper()].append(eng)

def esc(s):
    return ''.join('\\' + c if c in '\\#$*_@<>`[]()~/\'"' else c for c in s)

out = ['#import "../lib.typ": *', '',
       '#chapter[English Index]',
       '#runhead("English Index")', '',
       '#note[The original only ran one direction — Croatian/Bosnian/Serbian to '
       'English. This runs the other way, so if you know the English word but '
       'not which one of ours you wanted, start here and then look the word up '
       'properly in the dictionary. Built from the entries themselves.#degmark]',
       '',
       '#columns(2, gutter: 0.62em)[']

total = 0
for L in sorted(letters):
    out.append(f'#letterhead[{L}]')
    for eng in letters[L]:
        words = sorted(index[eng], key=str.lower)
        total += 1
        out.append('#block(spacing: 0.22em, width: 100%)[#par(justify: false, '
                   'leading: 0.4em, hanging-indent: 0.9em, spacing: 0.22em)['
                   f'#strong[{esc(eng)}] #text(fill: luma(140))[|] '
                   + ', '.join(esc(w) for w in words) + ']]')
out.append(']')

p = os.path.join(ROOT, 'book', 'chapters', 'english-index.typ')
open(p, 'w').write('\n'.join(out) + '\n')
print(f'index headwords : {total:,}')
print(f'wrote           : {p}')
