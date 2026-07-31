#!/usr/bin/env python3
"""Collect every agent 'note' into a single verification list for Levi."""
import json, glob, os, re, collections

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
entries = {e['id']: e for e in json.load(open(os.path.join(ROOT, 'data', 'entries.json')))}

notes = []
stats = collections.Counter()
for f in sorted(glob.glob(os.path.join(ROOT, 'data', 'enriched', '*.json'))):
    for o in json.load(open(f)):
        i = o.get('id')
        for k in ('stress', 'pos', 'gender', 'aspect', 'declension', 'example', 'resolves'):
            if o.get(k):
                stats[k] += 1
        if o.get('note') and i in entries:
            notes.append((i, entries[i], o))
        if i in entries:
            stats['entries_touched'] += 1

notes.sort(key=lambda t: t[0])

# Notes that read like a flagged problem rather than a neutral remark.
PROBLEM = re.compile(r"""\b(
    wrong|incorrect|error|typo|mistake|should\s+be|actually|not\s+a\s+word|
    misspell|swapped|reversed|missing|garbl|bleed|glued|duplicate|
    contradict|doesn'?t\s+(?:appear|seem|exist)|likely|suspect|looks?\s+off|
    self|points?\s+at\s+itself|mis-?fil|mislabel
)\b""", re.I | re.X)

out = []
out.append('# For Levi — things to check yourself\n')
out.append('Generated from the enrichment pass. **Nothing in this list was changed '
           'in the book.** Your text is untouched; these are flags only.\n')
out.append(f'Entries in the dictionary: **{len(entries):,}**  ')
out.append(f'Entries the pass added something to: **{stats["entries_touched"]:,}**\n')

out.append('## What got filled in\n')
out.append('| Field | Entries filled | Coverage |')
out.append('|---|---:|---:|')
for k in ('stress', 'pos', 'gender', 'aspect', 'declension', 'example', 'resolves'):
    out.append(f'| {k} | {stats[k]:,} | {100*stats[k]/len(entries):.1f}% |')
out.append('')
out.append('Everything above is marked with ° in the book. Unmarked text is yours.\n')

flagged = [(i, e, o) for i, e, o in notes if PROBLEM.search(o['note'])]
other = [(i, e, o) for i, e, o in notes if not PROBLEM.search(o['note'])]

out.append(f'## Probable problems in the original ({len(flagged)})\n')
out.append('These look like real mistakes — bad glosses, swapped aspects, typos, or '
           'places where the PDF extraction glued two entries together. Worth a pass.\n')
for i, e, o in flagged:
    out.append(f'- **{e["headword"]}** (p.{e["page"]}) — {o["note"].strip()}')
out.append('')

out.append(f'## Other notes ({len(other)})\n')
for i, e, o in other:
    out.append(f'- **{e["headword"]}** (p.{e["page"]}) — {o["note"].strip()}')
out.append('')

p = os.path.join(ROOT, 'FOR-LEVI.md')
open(p, 'w').write('\n'.join(out))
print(f'notes collected : {len(notes)}  ({len(flagged)} look like real problems)')
print(f'wrote           : {p}')
