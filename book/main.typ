#import "lib.typ": *
#show: book.with(title: "Srpsko-Hrvatski / Serbo-Croatian", author: "Levi Mackay")


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

#counter(page).update(1)

#set page(header: none)
#block(above: 0.6em, below: 1.1em)[#text(size: 20pt, weight: "bold")[Table of Contents]]
#line(length: 100%, stroke: 0.9pt)
#v(0.8em)
#outline(title: none, depth: 1, indent: 1em)
#pagebreak(to: "odd")


#include "chapters/front-matter.typ"
#include "chapters/how-to-use.typ"
#include "chapters/reference-tables.typ"
#include "chapters/dictionary.typ"
#include "chapters/grammar-reference.typ"
#include "chapters/common-questions.typ"
#include "chapters/random-notes.typ"
#include "chapters/accent-and-tips.typ"
#include "chapters/croatian-serbian.typ"
#include "chapters/phrases-and-sayings.typ"
#include "chapters/flirting.typ"
#include "chapters/psovke.typ"
#include "chapters/resources.typ"
#include "chapters/final-thoughts.typ"
