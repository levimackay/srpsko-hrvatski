# Srpsko-Hrvatski

Typesetting a real book out of a personal Serbo-Croatian dictionary compiled in the field from July 2022 to July 2024, in Croatia, Serbia, and Bosnia. The source was a 208 page PDF of dictionary entries plus roughly 39,000 words of prose chapters. This repo takes that, folds in the daily word sheets, fills gaps, and builds a finished 301 page book with Typst.

Status: finished. The book builds end to end at 301 pages, 15 chapters, 0 warnings.

## The rule the whole project is built around

The material was earned in the field, and generated additions must never quietly pass as part of it.

Every element added during the build carries a `°` immediately after it, and the mark attaches to the specific added element, not the whole entry.

```
akuratan |aku*RA*tan|° exact, regular (adj)(m)°
         ^^^^^^^^^^^^^                  ^^^^
         added                          added
```

Nothing in the original was edited. Where something looked wrong it was flagged rather than fixed, including one stress mark that contradicts the book's own rule about final syllables. A blank field is honest; a confident wrong answer is not. The notation itself, every marker and what it means, is documented inside the book, in the How to Read an Entry chapter (`book/chapters/how-to-use.md`).

## What is in the dictionary

| | count |
|---|---:|
| Total entries | 5,709 |
| From the original dictionary | 4,047 |
| Folded in from the daily word sheets | 1,608 |
| Added to fill outright gaps (all marked °) | 54 |
| Marked blue, "might need more love" | 2,350 |
| Entries the enrichment pass added data to | 3,492 |
| English index headwords | 5,148 |

Chapters, in reading order: Front Matter, How to Read an Entry, Reference Tables, The Dictionary, Grammar Reference, Common Questions, Random Notes, Accent and Tongue Placement, Croatian vs. Serbian, Phrases and Sayings, Flirting, Psovke, Resources, English Index, Final Thoughts.

## Layout

```
book/main.typ         generated, do not hand edit
book/lib.typ          shared Typst styles and entry rendering
book/chapters/        each chapter as .md source and its compiled .typ
build/                the Python pipeline
data/entries.json     the 5,709 entries, one object each
data/pages.json       the 208 source pages
data/batches/         the six letter batches (A-Č, Ć-Đ, E-H, I-O, P-Š, T-Ž)
data/enriched/        the same batches after the enrichment pass
sections/             raw extracted prose
```

An entry looks like this:

```json
{"page": 9, "letter": "A(X)", "level": 0, "bullet": null,
 "lines": ["a | and/but (Conj)"], "colors": {"k": 9, "mark": 6},
 "raw": "a | and/but (Conj)", "headword": "a",
 "body": "and/but (Conj)", "tag": null, "id": 0}
```

Colors carry meaning from the original and are preserved: blue for incomplete, gold for a word with branches that is not its own root, pink for a loan word natives actually use, green for city and question words, dark red for grammar markers.

## Building

```bash
python3 build/make_book.py
```

That generates `book/main.typ` from whichever chapters exist, in the fixed reading order, and compiles it to `build/Srpsko-Hrvatski.pdf`. Typst has to be on PATH.

The other scripts in `build/` each do one stage:

| script | what it does |
|---|---|
| `md2typ.py` | chapter markdown to Typst |
| `render_dict.py` | entries.json to the typeset dictionary chapter |
| `merge_daily.py` | folds the daily word sheets into the dictionary, alphabetized in place |
| `make_index.py` | builds the English index |
| `make_errata.py` | produces the flag list |
| `restore_lists.py` | list restoration pass |

## Reading the output

`make_errata.py` produces a flag list: 873 notes, of which 86 look like real errors in the original. Bad glosses, swapped aspects, missing diacritics, duplicate headwords, and places where PDF extraction glued two entries together. Nothing on that list is changed in the book. It is a checklist, not a changelog.

Every field filled in by the enrichment pass is marked with `°` in the book. Unmarked text is mine.

## License

The dictionary and the prose chapters are my own work, compiled in the field between July 2022 and July 2024. Copyright is retained and no license to reuse the content is granted. If you want to cite it or use part of it, open an issue and ask.

**Last updated:** 2026-08-29 11:47 PDT
