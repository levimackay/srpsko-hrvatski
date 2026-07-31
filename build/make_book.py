#!/usr/bin/env python3
"""Generate book/main.typ from whichever chapters exist, then compile."""
import os, subprocess, sys, re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CH = os.path.join(ROOT, 'book', 'chapters')

# Reading order of the finished book.
ORDER = [
    'front-matter',
    'how-to-use',
    'reference-tables',
    'dictionary',
    'grammar-reference',
    'common-questions',
    'random-notes',
    'accent-and-tips',
    'croatian-serbian',
    'phrases-and-sayings',
    'flirting',
    'psovke',
    'daily-word-lists',
    'resources',
    'english-index',
    'final-thoughts',
]

TITLE_PAGE = r'''
#set page(header: none, footer: none)
#v(1fr)
#align(center)[
  #text(size: 34pt, weight: "bold")[Srpsko-Hrvatski]
  #v(0.15em)
  #text(size: 17pt, fill: luma(90))[Serbo-Croatian]
  #v(1.4em)
  #line(length: 42%, stroke: 0.7pt)
  #v(1.4em)
  #text(size: 11.5pt)[A dictionary, and everything else I picked up]
  #v(0.35em)
  #text(size: 11.5pt)[along the way]
  #v(2.6em)
  #text(size: 13pt, weight: "bold")[Starešina Levi Mackay]
  #v(0.5em)
  #text(size: 10pt, fill: luma(90))[July 2022 --- July 2024]
]
#v(1fr)
#align(center)[#text(size: 9pt, fill: luma(120))[Hrvatska · Bosna i Hercegovina · Srbija]]
#v(1fr)
#pagebreak()

#set page(header: none, footer: none)
#v(1fr)
#align(center)[
  #block(width: 76%)[
    #set text(size: 9.6pt, style: "italic")
    #set par(justify: false)
    "Sometimes we admire things like the stars or a sunset. We love them, but deep
    down we know they won't last forever, and we can never quite reach them."
    Learning a language isn't like that. It's not some distant dream. With
    persistence and a bit of grit, you'll get there. I have no doubt.
  ]
]
#v(1fr)
#pagebreak()
'''

TOC = r'''
#set page(header: none)
#block(above: 0.6em, below: 1.1em)[#text(size: 20pt, weight: "bold")[Table of Contents]]
#line(length: 100%, stroke: 0.9pt)
#v(0.8em)
#outline(title: none, depth: 1, indent: 1em)
#pagebreak(to: "odd")
'''


def main():
    present = [c for c in ORDER if os.path.exists(os.path.join(CH, c + '.typ'))]
    missing = [c for c in ORDER if c not in present]

    body = ['#import "lib.typ": *',
            '#show: book.with(title: "Srpsko-Hrvatski / Serbo-Croatian", '
            'author: "Levi Mackay")',
            '',
            TITLE_PAGE,
            '#counter(page).update(1)',
            TOC,
            '']
    for c in present:
        body.append(f'#include "chapters/{c}.typ"')

    out = os.path.join(ROOT, 'book', 'main.typ')
    open(out, 'w').write('\n'.join(body) + '\n')

    print(f'chapters included: {len(present)}')
    if missing:
        print(f'still missing     : {", ".join(missing)}')

    pdf = os.path.join(ROOT, 'build', 'Srpsko-Hrvatski.pdf')
    r = subprocess.run(['typst', 'compile', '--root', ROOT, out, pdf],
                       capture_output=True, text=True)
    errs = [l for l in r.stderr.splitlines() if l.startswith('error')]
    if errs:
        print('\n'.join(r.stderr.splitlines()[:40]))
        return 1
    warns = len([l for l in r.stderr.splitlines() if l.startswith('warning')])
    data = open(pdf, 'rb').read()
    pages = len(re.findall(rb'/Type\s*/Page[^s]', data))
    print(f'warnings          : {warns}')
    print(f'PAGES             : {pages}')
    print(f'output            : {pdf}  ({len(data)/1e6:.1f} MB)')
    return 0

if __name__ == '__main__':
    sys.exit(main())
