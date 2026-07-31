#!/usr/bin/env python3
"""Reflow the two list-shaped chapters (phrases, daily word lists) from the
column-wrapped extraction back into clean Markdown. Mechanical only — no
wording is changed."""
import re, os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
S = os.path.join(ROOT, 'sections')
C = os.path.join(ROOT, 'book', 'chapters')

def clean(s):
    s = re.sub(r'[ \t]{2,}', ' ', s)
    s = re.sub(r'\s+([,.;:!?])', r'\1', s)
    return s.strip()

# ---------------------------------------------------------------- phrases
def phrases():
    raw = open(os.path.join(S, '09-phrases-sayings.txt')).read()
    lines = [l.rstrip() for l in raw.split('\n')]

    out = ['# Phrases & Sayings', '']
    items, cur, banner = [], None, None
    sections = []

    def flush_item():
        nonlocal cur
        if cur:
            items.append(clean(cur))
            cur = None

    def flush_section():
        nonlocal items, banner
        if items:
            sections.append((banner, items))
        items, banner_local = [], None
        return

    for ln in lines:
        t = ln.strip()
        if not t:
            continue
        # his all-caps banners between the lists
        if re.match(r'^\*{2,}.*\*{2,}$', t) or (t.isupper() and len(t) > 12 and '-' not in t):
            flush_item()
            if items:
                sections.append((banner, items)); items = []
            banner = t.strip('*').strip()
            continue
        m = re.match(r'^(\d{1,3})\.\s*(.*)$', t)
        if m:
            flush_item()
            cur = m.group(2)
        elif cur is not None:
            cur += ' ' + t
        else:
            # stray header line
            flush_item()
            banner = t
    flush_item()
    if items:
        sections.append((banner, items))

    for banner, its in sections:
        if banner:
            out.append(f'## {banner.title() if banner.isupper() else banner}')
            out.append('')
        for i, it in enumerate(its, 1):
            out.append(f'{i}. {it}')
        out.append('')

    open(os.path.join(C, 'phrases-and-sayings.md'), 'w').write('\n'.join(out) + '\n')
    n = sum(len(x[1]) for x in sections)
    print(f'  phrases-and-sayings.md : {len(sections)} lists, {n} items')

# ------------------------------------------------------------ daily lists
def daily():
    raw = open(os.path.join(S, '10-daily-word-list.txt')).read()
    lines = [l.rstrip() for l in raw.split('\n')]

    out = ['# Daily Word Lists', '',
           '*These are the lists I kept while I was studying — in the order I '
           'actually picked the words up. I left the order alone.*', '']

    groups, cur_group, cur = [], [], None

    def flush():
        nonlocal cur
        if cur:
            cur_group.append(clean(cur))
            cur = None

    for ln in lines:
        t = ln.strip()
        if not t:
            continue
        if re.fullmatch(r'[●•·▪]{3,}', t):        # his list separators
            flush()
            if cur_group:
                groups.append(cur_group[:]); cur_group.clear()
            continue
        if t in ('Дневни Речи', 'Дневне Речи'):
            flush()
            continue
        # a new pair starts when the line contains " - " and the previous
        # entry looks finished
        if ' - ' in t or ' -' in t or '- ' in t:
            flush()
            cur = t
        elif cur is not None:
            cur += ' ' + t
        else:
            cur = t
    flush()
    if cur_group:
        groups.append(cur_group)

    total = 0
    for i, g in enumerate(groups, 1):
        out.append(f'## List {i}')
        out.append('')
        for item in g:
            # His own prose notes get swept into the list; keep them as prose.
            if len(item) > 140 and item.count(' - ') == 0:
                out.append('')
                out.append(f'*{item}*')
                out.append('')
                continue
            item = re.sub(r'\s*-\s*', ' — ', item, count=1)
            out.append(f'- {item}')
            total += 1
        out.append('')

    open(os.path.join(C, 'daily-word-lists.md'), 'w').write('\n'.join(out) + '\n')
    print(f'  daily-word-lists.md    : {len(groups)} lists, {total} words')

if __name__ == '__main__':
    phrases()
    daily()
