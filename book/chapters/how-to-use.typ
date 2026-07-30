#import "../lib.typ": *

#runhead("How to Read an Entry")

#chapter[How to Read an Entry]
Here\'s a typical entry from the dictionary:

#block(fill: luma(244), inset: 0.55em, radius: 3pt, width: 100%, breakable: true)[#text(font: "Menlo", size: 8pt, raw("akumulator |akumu*LA*tor| battery (rel: baterija)"))]
Broken apart, piece by piece:

#table(columns: 2, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Piece]], [#strong[What it is]],
  [#raw("akumulator")], [The headword — the word itself, in Hrvatski\/Bosanski\/Srpski \(Croatian\/Bosnian\/Serbian → English, per his own key\).],
  [#raw("\\|akumu*LA*tor\\|")], [The pronunciation, wrapped in pipes. The syllable in #raw("*CAPS*") is the one you stress.],
  [#raw("battery")], [The English definition.],
  [#raw("(rel: baterija)")], [A word relationship tag — see below.],
)
That\'s the whole system. Everything else in this chapter is just what the markers after a word mean, restored from his own key.

#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[Stress and Pronunciation]]
Stress is wrapped in pipes, with the stressed syllable in caps between asterisks:

#block(fill: luma(244), inset: 0.55em, radius: 3pt, width: 100%, breakable: true)[#text(font: "Menlo", size: 8pt, raw("abeceda |abe*CE*da| alphabet
akumulator |akumu*LA*tor| battery
zaponijet |za*PÒ*njet| to go (take-out food) (Bos)"))]
This only marks #strong[which syllable] you land on — not the full pitch-accent system Serbo-Croatian actually has under the hood \(four accents, plus post-accentual vowel length\). If you see an accent mark like #raw("PÒ") or #raw("LÁJ"), that\'s him marking something extra he picked up on for that specific word — most entries just use plain caps.

A blank pronunciation field means he wasn\'t confident enough to commit to one. That\'s on purpose. Per his own rule: a wrong stress mark on a word is worse than no stress mark at all.

#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[Words\' Types and Markers]]
This is his own key, restored as he organized it:

#note[Hrvatski\/Bosanski\/Srpski -\> Engleski

Words\' Types and Markers:

#block(above: 0.42em, below: 0.5em)[
- Different dialects\/County
- Gender\/Common Phrase\/Part of Speech
- Things that help me remember the word
- Irregular casing\/rules\/Constant Softening
]
Words are placed from left to right based on the most common definition\/meaning.
]
#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[Dialect and Country]]
#table(columns: 2, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Marker]], [#strong[Meaning]],
  [#raw("[E]")], [Ekavian],
  [#raw("[J]")], [Ijekavian],
  [#raw("[I]")], [Ikavian],
  [#raw("[B]") \/ #raw("(Bos)")], [Bosnian],
  [#raw("[C]") \/ #raw("(Hrv)")], [Croatian],
  [#raw("[S]") \/ #raw("(Srp)")], [Serbian],
)
#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[Gender \/ Part of Speech]]
#table(columns: 2, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Marker]], [#strong[Meaning]],
  [#raw("(f)")], [Ženski \/ feminine],
  [#raw("(m)")], [Muški \/ masculine],
  [#raw("(Noun)")], [Neuter],
  [#raw("(adj)")], [Adjective],
  [#raw("(Adv)")], [Adverb],
  [#raw("(Verb)")], [Verb],
  [#raw("(Conj)")], [Conjunction],
  [#raw("(Pre)")], [Prefix],
  [#raw("(Intj)") \/ #raw("(excl)")], [Interjection \/ exclamation],
  [#raw("(Pro)")], [Pronoun],
  [#raw("(Prep)")], [Preposition],
)
#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[Verb Aspect]]
#table(columns: 2, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Marker]], [#strong[Meaning]],
  [#raw("(Imp)")], [Imperfective],
  [#raw("(Perf)")], [Perfective],
)
If a verb doesn\'t have either marker, both aspects are assumed.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[Animacy and Loan Words]]
#table(columns: 2, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Marker]], [#strong[Meaning]],
  [#raw("(Anim)") \/ #raw("(Inan)")], [Animate \/ inanimate],
  [#raw("(LW)")], [Loan word],
  [#raw("(Count)") \/ #raw("(Unc)")], [Countable \/ uncountable],
)
#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[Case and Declension Markers]]
#table(columns: 2, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Marker]], [#strong[Meaning]],
  [#raw("(a)")], [Keeps \"a\" in the Genitive Plural form],
  [#raw("(+a)")], [Gains an \"a\" it doesn\'t otherwise have],
  [#raw("(e)") \/ #raw("(o)")], [Instrumental case ending],
  [#raw("(CF)")], [Citation form],
  [#raw("(na/s(a))") \/ #raw("(u/iz)")], [Marks that this preposition is the more common \(or only\) one used with that word for location],
)
His own explanation of the #raw("(a)") marker:

#note[Masculine nouns with an \"\(a\)\" marker will keep their \"A\" in the Genitive Plural Form i.e. \"Metra\" \(CF\) -\> \"Metara\" \(Gen Pl\) \(Like an \"\(+a\)\" marker.\) \(Some Masculine nouns have the \"\(+a\)\" marker by mistake.\)
]
His rule of thumb for #raw("(e)") vs. #raw("(o)"):

#note[Words ending in c, č, ć, dž, đ, j, š, ž most likely have \(e\), words ending in anything else are assumed to have \(o\).
]
And a rule he left almost as a joke, tucked in the middle of his notes:

#note[Fleeting a reappearing a rule: when a word has fleeting a and is a noun, it is more likely to have reappearing a.
]
#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[Consonant Changes]]
#table(columns: 2, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Marker]], [#strong[Change]],
  [#raw("(k->c)")], [K to C],
  [#raw("(g->z)")], [G to Z],
  [#raw("(h->s)")], [H to S],
  [#raw("(z->ž)")], [Z to Ž],
  [#raw("(k->č)")], [K to Č],
  [#raw("(h->š)")], [H to Š],
  [#raw("(o->l)")], [O to L],
  [#raw("(d->t)")], [D to T \(voiced\/voiceless\)],
  [#raw("(z->s)")], [Z to S \(voiced\/voiceless\)],
  [#raw("(ž->š)")], [Ž to Š \(voiced\/voiceless\)],
)
#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[The #raw("(ije)") Marker]]
His own explanation, restored in full:

#note[All words are printed in ijekavian or ekavian form, words with this marker have the \"ije\" character which can be traded for \"e\" or \"i\" depending on locality \(ije\). The letters \"ije\" should be viewed as a single character, instead of three letters bunched together — in some words it appears as \"ije\" while in other words as \"je,\" but it is all the same character whether shortened or lengthened.

Just because a word has the \"ije\" marker doesn\'t mean it would be used in certain forms — \"zapovijed\" will never read \"zapoved,\" instead one would use \"zapovest.\"
]
#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[Cases]]
Nominative, Accusative #raw("(Acc)"), Genitive #raw("(G)"), Dative #raw("(D)"), Locative #raw("(L)"), Instrumental #raw("(Ins)"), Vocative #raw("(Voc)").

#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[The Two-Word Definition Rule]]
When a definition lists two words, the order means something:

#note[If a definition has two words, Npr: aktualan, aktuelan; then the first word is more Croatian and the second one is more Serbian.
]
#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[Color System]]
#table(columns: 2, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Color]], [#strong[Meaning]],
  [#strong[Blue]], [Might need more love — an incomplete entry \(788 of them, by his count\)],
  [#strong[Gold]], [Has many branches, but isn\'t its own root word — not counted in the word count],
  [#strong[Pink]], [A loan word used by natives, marked #raw("(LW)") — not counted in the word count],
  [#strong[Green]], [A city name or a question word — city names aren\'t counted in the word count],
  [#strong[Dark red]], [Grammar markers],
)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[The #degmark  Marker]]
Anything marked with a #strong[#degmark ] was filled in after his mission, and hasn\'t been personally verified by him. It attaches to the specific piece that was added — not the whole entry. If a word has no #degmark  anywhere on it, that means he wrote and verified every part of it himself, in the field. Trust the unmarked entries first.

#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[Word Relationships]]
His own explanation, restored in full:

#note[Words can have only one root but many branches. For simplicity\'s sake, branches, roots, and related words are mainly only tracked inside word groups — a verb will not lead to a noun counterpart.

Roots are the directly previously related word. #strong[\(rt:\)] Roots are only mentioned if they might not be obvious — words rarely have more than one root.

Branches are the next step in a word\'s extension. #strong[\(br:\)] A branch consists of an addition to a suffix or prefix, or a change in a suffix.

Related words include counterpart words such as Perfective and Imperfective verbs, if the counterpart is not a branch. #strong[\(rel:\)]
]
#table(columns: 2, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Tag]], [#strong[Meaning]],
  [#raw("rt:")], [Root — the directly previous related word],
  [#raw("br:")], [Branch — the next step in a word\'s extension \(suffix\/prefix addition or change\)],
  [#raw("rel:")], [Related — a counterpart word \(e.g. Perfective ↔ Imperfective\) that isn\'t a branch],
)
#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[Bulleting Conventions]]
Two structural rules govern the bullets under a headword:

#strong[Reflexive #raw("se") verbs.] His own words:

#note[A verb with \"se\" is bulleted underneath the unreflexive version. If there is no version that is non-reflexive, it is its own word. This is to reduce redundancy and also show the relationship between the reflexive and non-reflexive versions.
]
#strong[Diminutives.] His own words:

#note[Words that have a minimized extension like \"brod -\> brodić\" have the minimized extension bulleted underneath, with the minimized extension not counted in the word count. However words that do have a separate meaning are not bulleted underneath and are counted to the word count. \(Not every word will have a minimization bulleted underneath, even if it might have one — just words that make sense to have a bullet.\) Words in this category will not have the \"\(e\)\" marker because it is assumed.
]
In practice, in the dictionary body:

#block(above: 0.42em, below: 0.5em)[
- #raw("-") \(a plain bullet\) marks a branch, indented under its parent headword.
- #raw("●") \/ #raw("○") mark sub-entries and phrases hanging off a headword.
]
