// Srpsko-Hrvatski — book template
// Reproduces Elder Levi Mackay's original notation and color system.

#let BLUE  = rgb("#0000ff")   // "might need more love"
#let GOLD  = rgb("#b8860b")   // branch parent, not its own root word
#let PINK  = rgb("#c2185b")   // loan word (LW)
#let GREEN = rgb("#1b7f3b")   // city name or question word
#let MARK  = rgb("#990000")   // grammar markers (his dark red)
#let GEN   = rgb("#6b6b6b")   // ° provenance — filled in, unverified

#let bookfont = "Charter"
#let uifont = "Helvetica Neue"

// ---- page setup ----------------------------------------------------------
#let book(title: none, subtitle: none, author: none, body) = {
  set document(title: title, author: author)
  set page(
    width: 6in, height: 9in,
    margin: (inside: 0.72in, outside: 0.55in, top: 0.7in, bottom: 0.62in),
    binding: left,
  )
  set text(font: bookfont, size: 9.6pt, lang: "en", hyphenate: true)
  set par(justify: true, leading: 0.52em, spacing: 0.62em)
  show heading: set text(font: bookfont)
  // Chapter openers. Defined inline because Typst resolves identifiers at
  // definition order within a module.
  show heading.where(level: 1): it => {
    pagebreak(weak: true, to: "odd")
    v(1.0in)
    block(below: 0.3em)[#text(size: 20pt, weight: "bold")[#it.body]]
    line(length: 100%, stroke: 0.9pt)
    v(0.85em)
  }
  body
}

// ---- running heads -------------------------------------------------------
#let runhead(chapter) = {
  set page(header: context {
    let p = counter(page).get().first()
    if p > 2 {
      set text(size: 7.6pt, font: uifont, fill: luma(90))
      if calc.even(p) [#p #h(1fr) #upper(chapter)]
      else [#upper(chapter) #h(1fr) #p]
      v(-0.45em)
      line(length: 100%, stroke: 0.4pt + luma(180))
    }
  }, footer: none)
}

// ---- chapter opener ------------------------------------------------------
// Emits a real level-1 heading so #outline() can find it; the visual
// treatment lives in the show rule below.
#let chapter(title, sub: none) = {
  heading(level: 1, outlined: true, bookmarked: true, numbering: none)[#title]
  if sub != none {
    v(-0.5em)
    block[#text(size: 10pt, style: "italic", fill: luma(90))[#sub]]
  }
}

// ---- the ° provenance marker --------------------------------------------
// Anything filled in after the mission and not personally verified by Levi.
// Rendered with a fixed-size box so it never grows the line height.
#let degmark = box(height: 0pt, baseline: 0pt)[
  #place(top + left, dy: -0.42em)[#text(fill: GEN, size: 7pt)[°]]
]
#let g(it) = [#text(fill: GEN)[#it]#degmark#h(0.28em)]

// ---- dictionary entry ----------------------------------------------------
// stress: "abe*CE*da"  ->  |abe\u{200b}CE\u{200b}da| with caps emphasized
#let stress(s) = {
  let parts = s.split("*")
  set text(font: bookfont, size: 8.8pt)
  [|]
  for (i, p) in parts.enumerate() {
    if calc.odd(i) { text(weight: "bold", tracking: 0.03em)[#upper(p)] }
    else { p }
  }
  [|]
}

#let marker(m) = text(fill: MARK, size: 8.6pt)[#m]

#let headword(w, tag: none) = {
  let c = if tag == "BLUE" { BLUE }
    else if tag == "GOLD" { GOLD }
    else if tag == "PINK" { PINK }
    else if tag == "GREEN" { GREEN }
    else { black }
  text(weight: "bold", fill: c)[#w]
}

#let entry(word, body, tag: none, level: 0, bullet: none) = {
  let ind = level * 0.7em
  let empty = body == none or body == [] or body == ""
  block(
    inset: (left: ind),
    spacing: 0.24em,
    breakable: true,
    width: 100%,
  )[
    #par(justify: false, leading: 0.42em, hanging-indent: 0.9em, spacing: 0.24em)[
      #if bullet != none [#text(size: 7pt, baseline: -0.1em)[#bullet]#h(0.25em)]
      #headword(word, tag: tag)#if not empty [#text(fill: luma(140))[#h(0.2em)|#h(0.2em)]#body]
    ]
  ]
}

// ---- letter divider in the dictionary ------------------------------------
#let letterhead(L) = {
  block(width: 100%, above: 1.0em, below: 0.7em)[
    #set align(center)
    #block(fill: luma(232), width: 100%, inset: (y: 0.32em), radius: 2pt)[
      #text(size: 15pt, weight: "bold", tracking: 0.1em)[#L]
    ]
  ]
}

// ---- misc ----------------------------------------------------------------
#let legendrow(sym, meaning) = grid(
  columns: (1.3cm, 1fr), gutter: 0.4em,
  text(weight: "bold")[#sym], meaning,
)

#let note(body) = block(
  fill: luma(245), inset: 0.6em, radius: 3pt, width: 100%,
  stroke: (left: 2pt + luma(170)),
)[#set text(size: 8.8pt, style: "italic"); #body]
