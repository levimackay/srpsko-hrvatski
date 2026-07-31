# How to Read an Entry

Here's a typical entry from the dictionary:

```
akumulator |akumu*LA*tor| battery (rel: baterija)
```

Broken apart, piece by piece:

| Piece | What it is |
|---|---|
| `akumulator` | The headword — the word itself, in Hrvatski/Bosanski/Srpski (Croatian/Bosnian/Serbian → English, per his own key). |
| `\|akumu*LA*tor\|` | The pronunciation, wrapped in pipes. The syllable in `*CAPS*` is the one you stress. |
| `battery` | The English definition. |
| `(rel: baterija)` | A word relationship tag — see below. |

That's the whole system. Everything else in this chapter is just what the markers after a word mean, restored from his own key.

---

## Stress and Pronunciation

Stress is wrapped in pipes, with the stressed syllable in caps between asterisks:

```
abeceda |abe*CE*da| alphabet
akumulator |akumu*LA*tor| battery
zaponijet |za*PÒ*njet| to go (take-out food) (Bos)
```

This only marks **which syllable** you land on — not the full pitch-accent system Serbo-Croatian actually has under the hood (four accents, plus post-accentual vowel length). If you see an accent mark like `PÒ` or `LÁJ`, that's him marking something extra he picked up on for that specific word — most entries just use plain caps.

A blank pronunciation field means he wasn't confident enough to commit to one. That's on purpose. Per his own rule: a wrong stress mark on a word is worse than no stress mark at all.

---

## Words' Types and Markers

This is his own key, restored as he organized it:

> Hrvatski/Bosanski/Srpski -> Engleski
>
> Words' Types and Markers:
> - Different dialects/County
> - Gender/Common Phrase/Part of Speech
> - Things that help me remember the word
> - Irregular casing/rules/Constant Softening
>
> Words are placed from left to right based on the most common definition/meaning.

### Dialect and Country

| Marker | Meaning |
|---|---|
| `[E]` | Ekavian |
| `[J]` | Ijekavian |
| `[I]` | Ikavian |
| `[B]` / `(Bos)` | Bosnian |
| `[C]` / `(Hrv)` | Croatian |
| `[S]` / `(Srp)` | Serbian |

### Gender / Part of Speech

| Marker | Meaning |
|---|---|
| `(f)` | Ženski / feminine |
| `(m)` | Muški / masculine |
| `(Noun)` | Neuter |
| `(adj)` | Adjective |
| `(Adv)` | Adverb |
| `(Verb)` | Verb |
| `(Conj)` | Conjunction |
| `(Pre)` | Prefix |
| `(Intj)` / `(excl)` | Interjection / exclamation |
| `(Pro)` | Pronoun |
| `(Prep)` | Preposition |

### Verb Aspect

| Marker | Meaning |
|---|---|
| `(Imp)` | Imperfective |
| `(Perf)` | Perfective |

If a verb doesn't have either marker, both aspects are assumed.

### Animacy and Loan Words

| Marker | Meaning |
|---|---|
| `(Anim)` / `(Inan)` | Animate / inanimate |
| `(LW)` | Loan word |
| `(Count)` / `(Unc)` | Countable / uncountable |

### Case and Declension Markers

| Marker | Meaning |
|---|---|
| `(a)` | Keeps "a" in the Genitive Plural form |
| `(+a)` | Gains an "a" it doesn't otherwise have |
| `(e)` / `(o)` | Instrumental case ending |
| `(CF)` | Citation form |
| `(na/s(a))` / `(u/iz)` | Marks that this preposition is the more common (or only) one used with that word for location |

His own explanation of the `(a)` marker:

> Masculine nouns with an "(a)" marker will keep their "A" in the Genitive Plural Form i.e. "Metra" (CF) -> "Metara" (Gen Pl) (Like an "(+a)" marker.) (Some Masculine nouns have the "(+a)" marker by mistake.)

His rule of thumb for `(e)` vs. `(o)`:

> Words ending in c, č, ć, dž, đ, j, š, ž most likely have (e), words ending in anything else are assumed to have (o).

And a rule he left almost as a joke, tucked in the middle of his notes:

> Fleeting a reappearing a rule: when a word has fleeting a and is a noun, it is more likely to have reappearing a.

### Consonant Changes

| Marker | Change |
|---|---|
| `(k->c)` | K to C |
| `(g->z)` | G to Z |
| `(h->s)` | H to S |
| `(z->ž)` | Z to Ž |
| `(k->č)` | K to Č |
| `(h->š)` | H to Š |
| `(o->l)` | O to L |
| `(d->t)` | D to T (voiced/voiceless) |
| `(z->s)` | Z to S (voiced/voiceless) |
| `(ž->š)` | Ž to Š (voiced/voiceless) |

### The `(ije)` Marker

His own explanation, restored in full:

> All words are printed in ijekavian or ekavian form, words with this marker have the "ije" character which can be traded for "e" or "i" depending on locality (ije). The letters "ije" should be viewed as a single character, instead of three letters bunched together — in some words it appears as "ije" while in other words as "je," but it is all the same character whether shortened or lengthened.
>
> Just because a word has the "ije" marker doesn't mean it would be used in certain forms — "zapovijed" will never read "zapoved," instead one would use "zapovest."

### Cases

Nominative, Accusative `(Acc)`, Genitive `(G)`, Dative `(D)`, Locative `(L)`, Instrumental `(Ins)`, Vocative `(Voc)`.

---

## The Two-Word Definition Rule

When a definition lists two words, the order means something:

> If a definition has two words, Npr: aktualan, aktuelan; then the first word is more Croatian and the second one is more Serbian.

---

## Color System

| Color | Meaning |
|---|---|
| **Blue** | Might need more love — an incomplete entry (788 of them, by his count) |
| **Gold** | Has many branches, but isn't its own root word — not counted in the word count |
| **Pink** | A loan word used by natives, marked `(LW)` — not counted in the word count |
| **Green** | A city name or a question word — city names aren't counted in the word count |
| **Dark red** | Grammar markers |

## The ° Marker

Anything marked with a **°** was filled in after his mission, and hasn't been personally verified by him. It attaches to the specific piece that was added — not the whole entry. If a word has no ° anywhere on it, that means he wrote and verified every part of it himself, in the field. Trust the unmarked entries first.

---

## Word Relationships

His own explanation, restored in full:

> Words can have only one root but many branches. For simplicity's sake, branches, roots, and related words are mainly only tracked inside word groups — a verb will not lead to a noun counterpart.
>
> Roots are the directly previously related word. **(rt:)** Roots are only mentioned if they might not be obvious — words rarely have more than one root.
>
> Branches are the next step in a word's extension. **(br:)** A branch consists of an addition to a suffix or prefix, or a change in a suffix.
>
> Related words include counterpart words such as Perfective and Imperfective verbs, if the counterpart is not a branch. **(rel:)**

| Tag | Meaning |
|---|---|
| `rt:` | Root — the directly previous related word |
| `br:` | Branch — the next step in a word's extension (suffix/prefix addition or change) |
| `rel:` | Related — a counterpart word (e.g. Perfective ↔ Imperfective) that isn't a branch |

---

## Bulleting Conventions

Two structural rules govern the bullets under a headword:

**Reflexive `se` verbs.** His own words:

> A verb with "se" is bulleted underneath the unreflexive version. If there is no version that is non-reflexive, it is its own word. This is to reduce redundancy and also show the relationship between the reflexive and non-reflexive versions.

**Diminutives.** His own words:

> Words that have a minimized extension like "brod -> brodić" have the minimized extension bulleted underneath, with the minimized extension not counted in the word count. However words that do have a separate meaning are not bulleted underneath and are counted to the word count. (Not every word will have a minimization bulleted underneath, even if it might have one — just words that make sense to have a bullet.) Words in this category will not have the "(e)" marker because it is assumed.

In practice, in the dictionary body:
- `-` (a plain bullet) marks a branch, indented under its parent headword.
- `●` / `○` mark sub-entries and phrases hanging off a headword.

---

## Key to Dictionary Markings — the full list

*This is the fuller key from the back of the original, restored here where it's actually useful. Every word below is his.*

| Marker | Meaning |
|---|---|
| `(Noun)` | Noun |
| `(Ir)` | Irregular — words with this marker have special attributes |
| `(Bos)` | Used primarily in Bosnia and Herzegovina |
| `(Hrv)` | Used primarily in Croatia |
| `(Crn)` | Used primarily in Montenegro. If a word does not have a Montenegrin marker, the Serbian one represents it |
| `(Srp)` | Used primarily in Serbia |
| `(M)` | Male. Words ending with a consonant are male unless otherwise stated; the marker is only there for clarification where there might be confusion |
| `(F)` | Female. Words ending with an "a" are female unless otherwise stated; the marker means a similar word is a different gender, and is only there for clarification |
| `(Neu)` | Neuter. Words ending in "e" or "o" are neuter unless otherwise stated; the marker means a similar word is a different gender — for example "veće" and "većer" |
| `(FE)` | Feminine Extra — Feminine, and takes special case endings (Fem 4th) |
| `(ME)` | Male Extra — Feminine with Masculine Adjectives (Masc 5th) |
| `(Anim)` `(Inan)` | Male animate / inanimate. If a word lacks this marker, Inanimate is assumed |
| `(+ov)` `(+ev)` | Male, takes -ov/-ev in the plural. The respective `(o)` or `(e)` marker is assumed but not written |
| `(o)` `(e)` | Male, -em ending for the Instrumental. If there is no marker, `(o)` is assumed |
| `(a)` / `(No "a")` | Disappearing "A" — `(a)` has one, `(No "a")` does not |
| `(+a)` | Appearing "A" |
| `(i)` | "I" ending for the Genitive Plural |
| `(-(x))` | Loss of "(x)" — the word loses the specified letter, whether it be a "T", an "N" or something else |

### Consonant Changes

| Marker | Change |
|---|---|
| `(c->č)` | C to Č |
| `(g->z)` | G to Z |
| `(h->s)` | H to S |
| `(k->c)` | K to C |
| `(o->l)` | O to L |
| `(z->ž)` | Z to Ž |
| `(ž->š)` | Ž to Š |
