#import "../lib.typ": *

#runhead("Grammar Reference")

#chapter[Grammar Reference]
#emph[Okay so real talk — this chapter didn\'t exist in my original dictionary. I never sat down and wrote out \"here\'s the whole case system in one place\" because when you\'re living it every day you don\'t really think about it that way, you just kind of absorb it. But going back through everything, I realized I use markers like \(a\), \(+a\), \(k-\>c\), \(Anim\), \(Imp\)\/\(Perf\) probably a thousand times across this dictionary and I never once explain the actual system behind them in one spot. That\'s on me. So this chapter is that spot. It\'s assembled after the fact to fill that gap, pulling together stuff I already knew but scattered all over the place, plus some stuff I\'m filling in because a missionary flipping through this needs the whole paradigm, not just vibes. Where I\'m less than 100% sure on something \(some of the finer edge cases especially\), I\'m marking it with a #degmark  so you know to double check with a native rather than just trusting me blind. Use this as your flip-to chapter. Uživajte.]

#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[1. The Seven Cases]]
Serbo-Croatian has seven cases \(padeži\). English basically only has this for pronouns \(I\/me\/my\/mine\) so this is going to feel like a lot at first, but once it clicks it clicks. Every noun, pronoun, and adjective changes its ending depending on the job it\'s doing in the sentence. Here\'s what each case actually #emph[does], not just its name.

#table(columns: 4, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Case]], [#strong[Question it answers]], [#strong[What it does]], [#strong[Example]],
  [#strong[Nominative] \(Nominativ\)], [Ko? Šta? \(Who? What?\)], [The subject. The \"doer.\" This is also the dictionary\/citation form — the one you look up.], [#strong[Pas] trči. \(The #strong[dog] runs.\)],
  [#strong[Genitive] \(Genitiv\)], [Koga? Čega? \/ Čiji? \(Of whom? Of what? \/ Whose?\)], [Possession, \"of\" relationships, quantities\/amounts, and — big one — negation \(a negated verb usually pulls its object into genitive instead of accusative\). Also shows up after a ton of prepositions \(od, do, iz, kod, blizu, ispred...\).], [Nemam #strong[vremena]. \(I don\'t have time — lit. \"I don\'t have #strong[of time].\"\)],
  [#strong[Dative] \(Dativ\)], [Kome? Čemu? \(To\/for whom? To\/for what?\)], [The indirect object — who something is given #emph[to], done #emph[for], or directed #emph[toward]. Also used for location with \"at someone\'s place\" type meanings and a bunch of set phrases.], [Dajem knjigu #strong[prijatelju]. \(I give the book #strong[to a friend].\)],
  [#strong[Accusative] \(Akuzativ\)], [Koga? Šta? \(Whom? What?\)], [The direct object — the thing the verb is being done #emph[to]. Also used with prepositions of motion \"into\" \(u, na when there\'s movement\).], [Vidim #strong[psa]. \(I see #strong[the dog].\)],
  [#strong[Vocative] \(Vokativ\)], [— \(no question word, it\'s direct address\)], [You use this when you\'re calling out to someone or something directly. It\'s not \"used in a sentence\" so much as it replaces the name when you\'re talking #emph[at] someone.], [#strong[Marko], dođi ovamo! \(#strong[Marko], come here!\)],
  [#strong[Instrumental] \(Instrumental\)], [\(S\) kim? \(S\) čim? \(With whom? With what?\)], [Means, tool, or accompaniment — what you\'re using to do something, or who you\'re doing it with.], [Pišem #strong[olovkom]. \(I write #strong[with a pen].\)],
  [#strong[Locative] \(Lokativ\)], [O kome? O čemu? \/ Gde? \(About whom? About what? \/ Where?\)], [Location or \"aboutness.\" This one is the odd duck because it basically never appears without a preposition \(u, na, o, po, pri\) — there\'s no bare locative sentence like there is with the other cases.], [Pričamo #strong[o filmu]. \(We\'re talking #strong[about the movie].\)],
)
A couple things worth flagging up front:

#block(above: 0.42em, below: 0.5em)[
- Genitive, dative, and locative singular are identical for a huge chunk of nouns \(especially feminine -a nouns\), so a lot of what feels like \"seven different endings\" is really more like four or five once you\'ve drilled it.
- The vocative is dying out a little in casual speech for some noun classes \(people will just use nominative\), but for names and direct address you\'ll hear it constantly, especially in Bosnia and Serbia.
- If a word in the dictionary has a #raw("(Case Trigger)") marker on a preposition, that\'s telling you the case doesn\'t come from the noun, it comes from #emph[which preposition] is sitting in front of it — same preposition, different case, different meaning. \(See Section 8 of the Common Questions chapter for \"za\" doing this across accusative, genitive, and instrumental.\)
]
#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[2. Noun Declension Tables]]
This is the actual core of this chapter. Six noun classes below, singular and plural, all seven cases. I picked common, regular example words for each so you have a clean model to pattern-match against. Where Ijekavian and Ekavian actually diverge I\'ve put both — where a word doesn\'t alternate \(like #raw("zapovijed")\/#raw("zapovest"), which never mechanically swaps #raw("ije") for #raw("e")\), I\'m not going to fake an alternation that doesn\'t exist.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[2.1 Masculine Animate — #raw("student") \(student\)]]
Masculine animate nouns \(people, animals\) get a genitive-shaped accusative singular — that\'s the \(Anim\) marker in the dictionary. Compare this to inanimate masculine below, where the accusative singular matches the nominative instead.

#table(columns: 3, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Case]], [#strong[Singular]], [#strong[Plural]],
  [Nominative], [student], [studenti],
  [Genitive], [studenta], [studenata],
  [Dative], [studentu], [studentima],
  [Accusative], [studenta #emph[\(= Genitive, because Anim\)]], [studente],
  [Vocative], [studente], [studenti],
  [Instrumental], [studentom], [studentima],
  [Locative], [studentu], [studentima],
)
Notice genitive plural #raw("studenata") — that inserted #raw("-a-") before the ending is the #strong[reappearing a], covered properly in Section 3. Also notice dative, instrumental, and locative plural are all identical \(#raw("studentima")\) — that\'s true across nearly every noun class and it cuts your memorization load a lot once you notice it.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[2.2 Masculine Inanimate — #raw("grad") \(city\)]]
#table(columns: 3, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Case]], [#strong[Singular]], [#strong[Plural]],
  [Nominative], [grad], [gradovi],
  [Genitive], [grada], [gradova],
  [Dative], [gradu], [gradovima],
  [Accusative], [grad #emph[\(= Nominative, because Inan\)]], [gradove],
  [Vocative], [grade], [gradovi],
  [Instrumental], [gradom], [gradovima],
  [Locative], [gradu], [gradovima],
)
The #raw("-ov-") that shows up in the plural \(#raw("gradovi"), not #raw("gradi")\) is the #raw("(+ov/+ev)") marker — most one-syllable masculine nouns need it to make the plural pronounceable and to keep the word from sounding clipped. Whether it\'s #raw("-ov-") or #raw("-ev-") depends on the last consonant of the stem: soft consonants \(c, č, ć, dž, đ, j, lj, nj, š, ž\) pull #raw("-ev-"), everything else pulls #raw("-ov-"). Same split rule as the #raw("(e)")\/#raw("(o)") instrumental marker below — it\'s not a coincidence, it\'s the same underlying \"soft consonant vs. hard consonant\" logic running through the whole language.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[2.3 Feminine -a — #raw("žena") \(woman\)]]
The huge majority of feminine nouns end in #raw("-a") in the nominative, and this is far and away the most common, most \"default\" declension pattern in the whole language.

#table(columns: 3, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Case]], [#strong[Singular]], [#strong[Plural]],
  [Nominative], [žena], [žene],
  [Genitive], [žene], [žena],
  [Dative], [ženi], [ženama],
  [Accusative], [ženu], [žene],
  [Vocative], [ženo], [žene],
  [Instrumental], [ženom], [ženama],
  [Locative], [ženi], [ženama],
)
Yeah — genitive plural #raw("žena") looks #emph[identical] to the nominative singular. That trips people up constantly. Context \(and the verb agreement\) is doing the disambiguating work there, not the noun form.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[2.4 Feminine Consonant-Final — #raw("reč") \[E\] \/ #raw("riječ") \[J\] \(word\)]]
This is the \"third declension\" — feminine nouns that don\'t end in #raw("-a") \(they end in a consonant instead: #raw("noć"), #raw("stvar"), #raw("ljubav"), #raw("krv")...\). These decline like an i-stem.

#table(columns: 3, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Case]], [#strong[Singular]], [#strong[Plural]],
  [Nominative], [reč \/ riječ], [reči \/ riječi],
  [Genitive], [reči \/ riječi], [reči \/ riječi],
  [Dative], [reči \/ riječi], [rečima \/ riječima],
  [Accusative], [reč \/ riječ], [reči \/ riječi],
  [Vocative], [reči \/ riječi], [reči \/ riječi],
  [Instrumental], [rečju \/ riječju #emph[\(also reči\/riječi, colloquial\)]], [rečima \/ riječima],
  [Locative], [reči \/ riječi], [rečima \/ riječima],
)
This is the exact declension his \"I vs U in the Instrumental Feminine Fourth\" note in the Common Questions chapter is talking about — the #raw("-ju")\/#raw("-i") split on the instrumental singular. #raw("-ju") is the \"proper\" ending \(rečju\), but you\'ll hear the plain #raw("-i") form used colloquially too, especially before a word starting with a vowel \(hence his \"use i for smooth transitions with vowels\" tip\).

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[2.5 Neuter -o — #raw("selo") \(village\)]]
#table(columns: 3, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Case]], [#strong[Singular]], [#strong[Plural]],
  [Nominative], [selo], [sela],
  [Genitive], [sela], [sela],
  [Dative], [selu], [selima],
  [Accusative], [selo], [sela],
  [Vocative], [selo], [sela],
  [Instrumental], [selom], [selima],
  [Locative], [selu], [selima],
)
Neuter nouns don\'t really have a distinct vocative — it just matches the nominative. Also notice genitive singular and nominative\/accusative plural all land on #raw("sela") — another one of those \"looks like more forms than it actually is\" situations.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[2.6 Neuter -e — #raw("polje") \(field\)]]
#table(columns: 3, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Case]], [#strong[Singular]], [#strong[Plural]],
  [Nominative], [polje], [polja],
  [Genitive], [polja], [polja],
  [Dative], [polju], [poljima],
  [Accusative], [polje], [polja],
  [Vocative], [polje], [polja],
  [Instrumental], [poljem], [poljima],
  [Locative], [polju], [poljima],
)
Same pattern as -o neuters, just softened across the board because the stem ends in a soft consonant \(#raw("lj")\).

#strong[Watch out for the \"n-stem\" neuters.] Words like #raw("ime") \(name\), #raw("vreme")\/#raw("vrijeme") \(time\), #raw("seme")\/#raw("sjeme") \(seed\), #raw("breme") \(burden\), #raw("prezime") \(surname\), and #raw("teme")\/ #raw("tjeme") \(crown of the head\) — his \"Group 8\" in the Random Notes chapter — look like regular -e neuters in the nominative but grow an extra #raw("-en-") in every other case: #raw("ime") → #raw("imena") \(Gen sg\), #raw("vreme") → #raw("vremena") \(Gen sg\), and so on. If you memorize the #raw("polje") pattern and then get blindsided by #raw("imena"), that\'s why. Small closed group of words, but they\'re common ones, so learn them as their own thing.

#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[3. The Fleeting \"a\" and the Reappearing \"a\"]]
This is one of those things that messed with my head for a good while before it clicked, and it\'s directly behind the #raw("(a)") and #raw("(+a)") markers you see all over the dictionary.

#strong[Fleeting a:] A lot of masculine nouns have an #raw("-a-") sitting in the last syllable of the nominative singular \(the citation form — the form you look up\) that #emph[disappears] the second you add any ending. Classic example: #raw("momak") \(young man\). Nominative is #raw("momak"), but genitive singular is #raw("momka") — the #raw("a") between #raw("m") and #raw("k") just vanishes because once there\'s a vowel ending attached, the word doesn\'t need it to stay pronounceable anymore.

#strong[Reappearing a:] Then in the genitive plural, sometimes that #raw("a") comes back — not because it \"belongs\" there again, but because without it you\'d end up with an unpronounceable pile of consonants. #raw("momak") → #raw("momaka") \(Gen. Pl.\), not #raw("momka") \(which would be a mess to say\). This is the #raw("(a)") marker: it flags a noun where the Genitive Plural form keeps\/regains that vowel.

This is also exactly what\'s going on with feminine consonant-cluster nouns and the #raw("(+a)") marker — #raw("sestra") \(sister\) has no fleeting #raw("a") in the singular \(#raw("sestre"), Gen. sg., is totally normal\), but the genitive plural would be an unpronounceable #raw("sestr") without help, so it #emph[gains] an #raw("a") that wasn\'t there in the singular oblique forms at all: #raw("sestara"). That\'s the difference between the two markers:

#block(above: 0.42em, below: 0.5em)[
- #raw("(a)") = the word already has a fleeting #raw("a") pattern, and it sticks around \/ comes back for Gen. Pl.
- #raw("(+a)") = the word didn\'t have that pattern at all, but Gen. Pl. needs an #raw("a") bolted on anyway to be pronounceable.
]
Two hard rules to bank from the Brief that make this way less random once you know them: nouns ending in #strong[-stvo\/-štvo always take #raw("(+a)")], and nouns ending in #strong[-tak take both #raw("(a)") and #raw("(+a)")] \(the citation form has the fleeting a, and the plural regains it\). Also — general trend, not a law — masculine nouns with a fleeting #raw("a") are #emph[more likely] to also carry the reappearing-a pattern into the plural than not. It\'s not guaranteed, but it\'s the way to bet if you\'re stuck guessing.

Real example, straight from my own key section: #strong[#raw("metar")] \(meter\) drops the #raw("a") in oblique forms → #raw("metra"), then gets it back in Gen. Pl. → #raw("metara"). Same shape as #raw("momak")\/#raw("momaka"), different consonant cluster.

#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[4. Consonant Softening — Sibilarization and Palatalization]]
Serbo-Croatian consonants change shape depending on what vowel is coming next. This is not random and it is not optional — it\'s baked into the grammar, and it\'s exactly what the #raw("(k->c)"), #raw("(g->z)"), #raw("(h->s)"), #raw("(z->ž)"), #raw("(k->č)"), #raw("(h->š)"), and #raw("(o->l)") markers in the dictionary are tracking. There are two different processes here and people constantly mix them up \(I did too\), so let\'s separate them clearly.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[4.1 Sibilarization — #raw("k→c"), #raw("g→z"), #raw("h→s")]]
This one happens specifically #strong[before the vowel -i.] Where you\'ll run into it:

#table(columns: 3, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Environment]], [#strong[Example]], [#strong[Change]],
  [Nominative Plural, masc. nouns \(no #raw("-ov-") extension\)], [vojnik → vojnici], [k→c],
  [Nominative Plural, masc. nouns], [oblak → oblaci], [k→c],
  [Dative\/Locative Sg., fem. -a nouns], [ruka → ruci], [k→c],
  [Dative\/Locative Sg., fem. -a nouns], [noga → nozi], [g→z],
  [Dative\/Locative Sg., fem. -a nouns ending in -ha], [\(varies — h→s in some words, h→v in others depending on dialect\)#degmark ], [h→s \/ h→v#degmark ],
)
The #raw("h→s") row is the one I\'d tell you to actually go double-check with a native for whatever specific word you\'re using — it\'s genuinely inconsistent across the region \(Croatian standard leans #raw("h→v") for some of these, colloquial Serbian leans #raw("h→s")\), and I\'m not confident enough to hand you one clean rule here.#degmark 

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[4.2 Palatalization — #raw("k→č"), #raw("g→ž"), #raw("h→š")]]
This one happens #strong[before front vowels historically \(e\/i-type sounds\) and in a specific list of grammatical environments] — it\'s a different, older process than sibilarization even though the trigger sounds similar on paper. Where you\'ll run into it:

#table(columns: 3, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Environment]], [#strong[Example]], [#strong[Change]],
  [Vocative Sg., masc. nouns ending in k\/g\/h], [junak → junače], [k→č],
  [Vocative Sg., masc. nouns ending in k\/g\/h], [bog → bože], [g→ž],
  [Vocative Sg., masc. nouns ending in k\/g\/h], [duh → duše], [h→š],
  [Present tense verb stems], [peći \(to bake\) → pečem], [k→č],
  [Present tense verb stems], [moći \(to be able\) → možeš], [g→ž],
  [Diminutives \/ affectionate forms], [dečak → dečače], [k→č],
  [Comparative adjectives \(see §5.3\)], [drag \(dear\) → draži \(dearer\)], [g→ž],
  [Comparative adjectives], [tih \(quiet\) → tiši \(quieter\)], [h→š],
)
Worth flagging: #strong[feminine -a nouns generally do #emph[not] palatalize in the vocative] — #raw("majka") \(mom\) → #raw("majko"), the #raw("k") stays put. The vocative palatalization rule above is really a masculine-noun thing. That\'s a mismatch a lot of missionaries trip over because they learn the masculine pattern first and assume it\'s universal.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[4.3 Two more you\'ll see in the marker key: #raw("z→ž") and #raw("o→l")]]
#raw("z→ž") is a form of #strong[iotation] — a softening that shows up in present-tense verb conjugation and comparatives the same way k\/g\/h do: #raw("vezati") \(to tie\) → #raw("vežem") \(I tie\); #raw("nizak") \(low\) → #raw("niži") \(lower\).

#raw("o→l") shows up in a specific group of masculine nouns where an old #raw("l") sound at the end of a syllable turned into #raw("o") over time — but the #raw("l") comes back the second a vowel ending gets attached: #raw("anđeo") \(angel\) → #raw("anđela") \(Gen. sg.\); #raw("posao") \(job\/task\) → #raw("posla") \(Gen. sg.\). If you see #raw("(o->l)") on a noun in the dictionary, that\'s what it\'s telling you — don\'t be surprised when the nominative and every other case look like they don\'t share a stem.

#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[5. Adjective Declension]]
Adjectives agree with the noun they\'re modifying in gender, number, #emph[and] case — which means every adjective is theoretically doing seven cases times two numbers times three genders. In practice a lot of those cells collapse into each other, same as with nouns, so it\'s not as brutal as the math makes it sound.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[5.1 Definite vs. Indefinite]]
Serbo-Croatian adjectives historically have two forms:

#block(above: 0.42em, below: 0.5em)[
- #strong[Indefinite \(short form\)] — used for \"a \_\_\_\" \(indefinite article meaning\), and historically this was the predicate form \(\"the man is good\"\). Example: #raw("dobar").
- #strong[Definite \(long form\)] — used for \"the \_\_\_\" \(definite article meaning\), and historically the form you\'d use directly in front of a noun. Example: #raw("dobri").
]
In modern spoken language this distinction has mostly collapsed #strong[except in the masculine nominative singular], which is really the only place you\'ll consistently hear the difference: #raw("dobar čovek") \(\"a good man\" \/ just \"good man\" generically\) vs. #raw("dobri čovek")#degmark  \(more \"the good man,\" definite\/specific — though honestly in casual speech #raw("dobar") gets used for both constantly and native speakers are pretty loose about it#degmark \). Every other case, number, and gender combo effectively uses one shared form. Because of that, the table below gives you the practical, functional paradigm rather than two full parallel tables — that\'s the form you\'ll actually hear.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[5.2 Adjective Declension — #raw("dobar/dobro/dobra") \(good\)]]
#strong[Singular]

#table(columns: 4, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Case]], [#strong[Masculine]], [#strong[Neuter]], [#strong[Feminine]],
  [Nominative], [dobar \(dobri, definite\)], [dobro], [dobra],
  [Genitive], [dobrog\(a\)], [dobrog\(a\)], [dobre],
  [Dative], [dobrom\(e\)], [dobrom\(e\)], [dobroj],
  [Accusative], [dobar\/dobrog #emph[\(Inan\/Anim, same split as nouns\)]], [dobro], [dobru],
  [Vocative], [dobri], [dobro], [dobra],
  [Instrumental], [dobrim], [dobrim], [dobrom],
  [Locative], [dobrom\(e\)], [dobrom\(e\)], [dobroj],
)
#strong[Plural]

#table(columns: 4, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Case]], [#strong[Masculine]], [#strong[Neuter]], [#strong[Feminine]],
  [Nominative], [dobri], [dobra], [dobre],
  [Genitive], [dobrih], [dobrih], [dobrih],
  [Dative], [dobrim\(a\)], [dobrim\(a\)], [dobrim\(a\)],
  [Accusative], [dobre], [dobra], [dobre],
  [Vocative], [dobri], [dobra], [dobre],
  [Instrumental], [dobrim\(a\)], [dobrim\(a\)], [dobrim\(a\)],
  [Locative], [dobrim\(a\)], [dobrim\(a\)], [dobrim\(a\)],
)
The #raw("(e)")\/#raw("(a)") bits in parentheses above \(#raw("dobrog(a)"), #raw("dobrom(e)")\) are optional endings — you\'ll hear\/see both the shorter and longer version and they mean the same thing. This is exactly the #raw("(e)/(o)") instrumental-ending logic bleeding into adjectives too: softer\/longer forms alongside clipped ones, both correct.

This is also, by the way, the mechanism behind the \"masculine 5th gender\" situation in the Common Questions chapter — words like #raw("gazda") and #raw("tata") are grammatically masculine even though they #emph[decline] like feminine -a nouns, and adjectives modifying them agree with the #strong[masculine gender], not the -a shape: #raw("dobri gazda"), not #raw("dobra gazda"). The adjective is tracking the noun\'s grammatical gender, not its ending.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[5.3 Comparative and Superlative]]
#strong[Comparative] is formed by adding #raw("-iji"), #raw("-ji"), or #raw("-ši") to the adjective stem \(which one depends on the final consonant and is honestly one of those things you mostly just learn word by word#degmark  rather than by a single clean rule\):

#table(columns: 3, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Positive]], [#strong[Comparative]], [#strong[Pattern]],
  [lep \/ lijep \(beautiful\)], [lepši \/ ljepši], [-ši, no softening],
  [pametan \(smart\)], [pametniji], [-iji],
  [brz \(fast\)], [brži], [-ži \(z→ž, see §4.3\)],
  [drag \(dear\)], [draži], [-ži \(g→ž, see §4.2\)],
  [tih \(quiet\)], [tiši], [-ši \(h→š, see §4.2\)],
  [dobar \(good\)], [bolji], [irregular — suppletive, totally different root],
  [loš \(bad\)], [gori], [irregular — suppletive],
  [velik \(big\)], [veći], [irregular#degmark ],
  [mali \(small\)], [manji], [irregular],
)
#strong[Superlative] is dead simple once you have the comparative: just add the prefix #raw("naj-") to the front. #raw("lepši") → #raw("najlepši") \(most beautiful\). #raw("bolji") → #raw("najbolji") \(best\). #raw("veći") → #raw("najveći") \(biggest\). That\'s it, no exceptions to that part — the irregularity all lives in the comparative step, the superlative step is 100% mechanical.

Comparatives and superlatives decline exactly like regular adjectives \(Section 5.2\) — #raw("najlepši") takes all the same case endings #raw("dobri") does.

#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[6. Verb Conjugation]]
#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[6.1 Present Tense — the three classes]]
Present tense verbs fall into three broad conjugation classes based on the vowel right before the personal ending. This is the #raw("(Verb Type 1-?)") marker territory in the dictionary — knowing which class a verb belongs to tells you the whole present tense paradigm from one form.

#table(columns: 4, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Person]], [#strong[-am class \(#raw("gledati"), to watch\)]], [#strong[-im class \(#raw("govoriti"), to speak\)]], [#strong[-em class \(#raw("pisati") → #raw("pišem"), to write\)]],
  [ja \(I\)], [gledam], [govorim], [pišem],
  [ti \(you sg.\)], [gledaš], [govoriš], [pišeš],
  [on\/ona\/ono \(he\/she\/it\)], [gleda], [govori], [piše],
  [mi \(we\)], [gledamo], [govorimo], [pišemo],
  [vi \(you pl.\/formal\)], [gledate], [govorite], [pišete],
  [oni\/one\/ona \(they\)], [gledaju], [govore], [pišu],
)
The #raw("-em") class is the one with the most stem changes going on under the hood \(#raw("pisati") → #raw("pišem") involves the same consonant softening from Section 4\), so if a verb\'s infinitive and present-tense stem don\'t obviously match, it\'s very likely an #raw("-em") class verb doing exactly that.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[6.2 Past Tense — Perfect \(biti + l-participle\)]]
This is by far the most common past tense in everyday speech \(the aorist and imperfect below are mostly for scripture\/literary reading, not conversation\). It\'s built from the present tense of #raw("biti") \(to be\) as an auxiliary, plus the #strong[l-participle] of the main verb, which agrees in gender and number with the subject.

#strong[Auxiliary #raw("biti") \(present tense, short\/clitic forms\):]

#table(columns: 2, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Person]], [#strong[Form]],
  [ja], [sam],
  [ti], [si],
  [on\/ona\/ono], [je],
  [mi], [smo],
  [vi], [ste],
  [oni\/one\/ona], [su],
)
#strong[L-participle of #raw("govoriti")] \(speak\): masc. #raw("govorio"), fem. #raw("govorila"), neut. #raw("govorilo") \(sg.\); masc. pl. #raw("govorili"), fem. pl. #raw("govorile"), neut. pl. #raw("govorila").

Put together: #strong[Ja sam govorio\/govorila.] \(I spoke\/have spoken — matches the speaker\'s gender.\) #strong[Mi smo govorili\/govorile.] \(We spoke.\)

One thing worth flagging that trips missionaries up in casual conversation: in relaxed\/informal speech, if the clitic \(#raw("sam"), #raw("si"), #raw("je")...\) was already established earlier in the exchange, native speakers will often just drop it and answer with the bare l-participle. \"Da li je otišao?\" — \"Otišao.\" No #raw("je") needed, it\'s implied. It\'s not \"grammatically correct\" to write it that way, but you will hear it constantly, especially in short answers.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[6.3 Future Tense — ću\/ćeš\/će + infinitive, and the Serbian \"da\" alternative]]
#strong[Croatian tends to keep the infinitive, and can even fuse it with the clitic] \(dropping the infinitive\'s final #raw("-i") and gluing it onto #raw("ću")\): #raw("Radit ću.") \(I will work.\) Both the separated and fused forms are correct.

#table(columns: 4, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Person]], [#strong[Future clitic]], [#strong[+ Infinitive \(Croatian-leaning\)]], [#strong[Serbian \"da\" alternative]],
  [ja], [ću], [radit ću \/ ja ću raditi], [ja ću da radim],
  [ti], [ćeš], [radit ćeš \/ ti ćeš raditi], [ti ćeš da radiš],
  [on\/ona\/ono], [će], [radit će \/ on će raditi], [on će da radi],
  [mi], [ćemo], [radit ćemo \/ mi ćemo raditi], [mi ćemo da radimo],
  [vi], [ćete], [radit ćete \/ vi ćete raditi], [vi ćete da radite],
  [oni\/one\/ona], [će], [radit će \/ oni će raditi], [oni će da rade],
)
The \"da\" construction \(#raw("ću da radim") instead of #raw("ću raditi")\) is the classic Serbian-leaning way to build the future — it swaps the infinitive out entirely for #raw("da") + present tense. Both constructions mean the exact same thing; which one you reach for is mostly a dialect\/regional-register call, not a meaning difference. This is the same #raw("da") you\'ll see doing work constantly after modal verbs in general — see the \"Infinitives\" note in the Random Notes chapter about Croatian using the infinitive more freely while Serbian leans on #raw("da") + present tense instead.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[6.4 Aorist and Imperfect \(briefly\)]]
I already laid out the full 16-form conjugation breakdown for these back in the Random Notes chapter \(the \"Mastering Verb Conjugations Across 16 Forms\" section\), so I won\'t repeat the whole thing here — go there for the complete paradigm. Quick recap of #emph[why] they matter even though nobody\'s going to use them on you at the pijaca:

#block(above: 0.42em, below: 0.5em)[
- #strong[Aorist] — a completed, single past action, viewed as a whole. Formal\/literary register. #raw("rekoh") \(I said\), #raw("reče") \(he\/she said\).
- #strong[Imperfect] — an ongoing or habitual past action. Same formal\/literary register. #raw("govorah") \(I was speaking\), #raw("govoraše") \(he\/she was speaking\).
]
You will basically never hear a native use these in casual conversation — if someone does, either they\'re quoting scripture\/literature or they\'re being intentionally old-fashioned\/theatrical about it. But the Book of Mormon and other scripture use both regularly, so having a passive read on them is genuinely worth the time if you\'re doing scripture study in language.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[6.5 Imperative]]
Formed off the present-tense stem. #raw("-a") stem verbs \(like #raw("gledati")\) take #raw("-aj")\/#raw("-ajte"); most everything else takes #raw("-i")\/#raw("-ite").

#table(columns: 3, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[]], [#strong[Singular \(informal\)]], [#strong[Plural \/ formal]],
  [gledati \(watch\)], [Gledaj!], [Gledajte!],
  [govoriti \(speak\)], [Govori!], [Govorite!],
  [pisati \(write\)], [Piši!], [Pišite!],
)
Negative imperative just adds #raw("ne") in front: #raw("Ne gledaj!") \(Don\'t watch!\)

One accent note worth repeating from the Lang Tips chapter: the stress can actually shift between the present tense and the imperative of the same verb — #raw("razmišljam") \(I\'m thinking, stress on #raw("miš")\) vs. #raw("razmišljaj!") \(Think!, stress shifts to #raw("-aj")\). Don\'t assume the accent is locked just because the stem looks the same.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[6.6 Conditional]]
#strong[Conditional I] \(would\) — hypotheticals, polite requests. Built from the aorist of #raw("biti") \(#raw("bih, bi, bi, bismo, biste, bi")\) + l-participle.

#table(columns: 2, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Person]], [#strong[govoriti \(to speak\)]],
  [ja], [bih govorio\/govorila],
  [ti], [bi govorio\/govorila],
  [on\/ona\/ono], [bi govorio\/govorila\/govorilo],
  [mi], [bismo govorili\/govorile],
  [vi], [biste govorili\/govorile],
  [oni\/one\/ona], [bi govorili\/govorile\/govorila],
)
#strong[Conditional II] \(would have\) — hypothetical #emph[past] actions, adds #raw("bio/bila/bilo") + #raw("biti") before the l-participle: #raw("Ja bih bio/bila govorio/govorila.") \(I would have spoken.\) This one\'s rare in daily speech — you\'re way more likely to need Conditional I, especially for the \"kako bismo mogli\" type constructions covered in the Common Questions chapter.

#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[7. Verbal Aspect]]
This is probably the single most important grammar concept in the whole language for actually sounding natural, and it\'s the backbone of the #raw("(Imp)")\/#raw("(Perf)") marker system running through the entire dictionary. If a dictionary entry has no aspect marker at all, both aspects are assumed to exist and work the same way.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[7.1 Imperfective vs. Perfective — what they actually mean]]
#strong[Imperfective] verbs describe an action as ongoing, habitual, repeated, or as a process without a defined endpoint. #strong[Perfective] verbs describe an action as a single, completed whole — it happened, it\'s done, period.

#block(above: 0.42em, below: 0.5em)[
- Imperfective: #emph[Čitao sam knjigu.] \(I was reading a book \/ I read \[as an ongoing thing\].\)
- Perfective: #emph[Pročitao sam knjigu.] \(I read the whole book — done, finished.\)
]
This maps onto the aorist\/imperfect distinction in Section 6.4 too — same underlying logic of \"completed vs. ongoing,\" just applied to a different \(more literary\) tense pair.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[7.2 How prefixes create aspect pairs]]
The most common way an imperfective verb gets a perfective partner is by slapping a prefix on the front of it. The tricky part — and this is genuinely one of those things that takes a while to get a feel for — is that the #emph[same] prefix can produce wildly different #strong[meanings], not just aspect, depending on the base verb. A prefix doesn\'t just mean \"now it\'s perfective,\" it usually also shifts or narrows what the verb means. Here\'s the common set, with the general sense each one tends to carry, and real examples straight out of my own vocabulary drills:

#table(columns: 3, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Prefix]], [#strong[General sense it tends to add]], [#strong[Example]],
  [#strong[na-]], [onto\/accumulation, \"doing enough of,\" or a new\/different specific meaning], [pisati → napisati \(to write, perfective — \"get it written\"\)],
  [#strong[za-]], [starting an action, or a \"recording\/jotting\" narrowing], [pisati → zapisati \(to jot down, to record\)],
  [#strong[po-]], [a bit of\/a while of an action, or simple perfectivization], [gledati → pogledati \(to look at, perfective\)],
  [#strong[pre-]], [across, over, or \"re-doing\"\/transcribing], [pisati → prepisati \(to copy, transcribe\)],
  [#strong[pri-]], [approach, addition, a small amount added on], [držati → pridržati \(to hold onto\/assist temporarily\)],
  [#strong[pro-]], [through, thoroughly, or \"spending\" \(time\)], [gledati → pregledati#degmark  #emph[\(careful — this one\'s actually \"pre-\" not \"pro-\", see note below\)]],
  [#strong[u-]], [into, entering a state], [živeti → uživeti se \(to immerse oneself in\)],
  [#strong[iz-]], [out of, exhaustively, to completion], [pisati → ispisati \(to write out fully\)],
  [#strong[od-]], [away from, completion, separation], [raditi → odraditi \(to finish\/complete a task\)],
  [#strong[do-]], [reaching an endpoint, adding on], [pisati → dopisati \(to add in writing\)],
  [#strong[s-\/sa-]], [together, downward, or completion], [staviti → sastaviti \(to compose, compile\)],
  [#strong[raz-]], [apart, outward, intensification], [igrati se → razigrati se \(to get lively\/worked up\)],
)
#degmark Small correction on my own table above: I originally wanted #raw("pregledati") \(to inspect\/review\) as the pro- example, but that\'s actually built on #raw("pre-") + #raw("gledati"), not #raw("pro-"). I\'m leaving the row in because the general \"thoroughness\" sense is still a good illustration of what pro-\/pre- prefixes tend to do, but wanted to flag that I mislabeled which prefix is doing the work there.

You already have a bunch of these worked out in full family groupings in the Random Notes chapter — the #raw("pisati") family, the #raw("gledati") family, the #raw("misliti") family, the #raw("raditi") family, the #raw("zvati") family, the #raw("stati") family, the #raw("držati") family, the #raw("igrati (se)") family, the #raw("živeti") family, the #raw("govoriti") family, the #raw("pustiti") family, the #raw("staviti") family, and the #raw("dirati") family. Those are the best real-world proof that the same prefix does #emph[not] always mean the same thing — go compare #raw("izmisliti") \(to invent\) against #raw("razmisliti") \(to think over\) against #raw("umisliti se") \(to fancy oneself\) sometime. Three completely different meanings, same base verb.

One more note straight from the Random Notes chapter that\'s worth repeating here because it\'s exactly the kind of thing that saves you from a bad guess: #strong[some verbs soften their consonant when going from perfective back to imperfective, but if the perfective verb ends in #raw("-ati"), there\'s no consonant softening.]

#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[8. Pronouns]]
#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[8.1 Personal Pronouns — Full and Clitic Forms]]
Serbo-Croatian personal pronouns have two sets of forms for the oblique cases: a #strong[full\/stressed form] \(used for emphasis, after prepositions, or at the start of a sentence\) and a #strong[short\/clitic form] \(used the vast majority of the time in normal speech — unstressed, and it has to sit in a specific spot in the sentence, which is the actual stumbling block, covered in 8.2 below\).

#strong[Singular — #raw("ja") \(I\)]

#table(columns: 3, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Case]], [#strong[Full form]], [#strong[Clitic]],
  [Nominative], [ja], [—],
  [Genitive], [mene], [me],
  [Dative], [meni], [mi],
  [Accusative], [mene], [me],
  [Instrumental], [mnom\(e\)], [—],
  [Locative], [meni], [—],
)
#strong[Singular — #raw("ti") \(you\)]

#table(columns: 3, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Case]], [#strong[Full form]], [#strong[Clitic]],
  [Nominative], [ti], [—],
  [Genitive], [tebe], [te],
  [Dative], [tebi], [ti],
  [Accusative], [tebe], [te],
  [Instrumental], [tobom], [—],
  [Locative], [tebi], [—],
)
#strong[Singular — #raw("on/ona/ono") \(he\/she\/it\)]

#table(columns: 5, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Case]], [#strong[Full \(m\/n\)]], [#strong[Full \(f\)]], [#strong[Clitic \(m\/n\)]], [#strong[Clitic \(f\)]],
  [Genitive], [njega], [nje], [ga], [je],
  [Dative], [njemu], [njoj], [mu], [joj],
  [Accusative], [njega\/nj], [nju], [ga], [je],
  [Instrumental], [njim\(e\)], [njom\(e\)], [—], [—],
  [Locative], [njemu], [njoj], [—], [—],
)
#strong[Plural]

#table(columns: 4, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Case]], [#strong[mi \(we\)]], [#strong[vi \(you pl.\)]], [#strong[oni\/one\/ona \(they\) — clitic]],
  [Genitive], [nas], [vas], [ih],
  [Dative], [nam\(a\)], [vam\(a\)], [im],
  [Accusative], [nas], [vas], [ih],
  [Instrumental], [nama], [vama], [njima],
  [Locative], [nama], [vama], [njima],
)
Those dative clitics \(#raw("mi, ti, mu, joj, nam, vam, im")\) are also exactly the ones used for the casual \"possession by dative\" construction from the Common Questions chapter — #raw("Tata mi je pilot") \(my dad\'s a pilot\), #raw("To mi je knjiga") \(that\'s my book\). Same forms, doing double duty as both a genuine indirect object #emph[and] a loose, informal possessive. That construction is fine between people on \"ti\" terms, but comes off a little disrespectful used upward toward someone you\'d address with \"Vi\" — worth knowing before you casually toss #raw("mu") around with an older host family.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[8.2 The Clitic Ordering Rule \(the classic stumbling block\)]]
This is the one that gets missionaries every time, because English has nothing like it. Clitics — the short unstressed forms above, plus the short forms of #raw("biti") \(sam\/si\/je\/smo\/ste\/su\) and the question particle #raw("li") — don\'t just float wherever feels natural. They stack up together, right after the first stressed word or phrase in the sentence \(this is called \"second position\" or Wackernagel\'s position#degmark \), and #strong[within that stack, they have to go in a fixed order:]

#block(above: 0.42em, below: 0.5em)[
+ #strong[li] \(the yes\/no question particle, if present\)
+ #strong[Auxiliary clitics] \(sam, si, smo, ste, bih, bi, bismo, biste — everything except #raw("je")\)
+ #strong[Dative] pronoun clitic \(mi, ti, mu, joj, nam, vam, im\)
+ #strong[Accusative\/Genitive] pronoun clitic \(me, te, ga, je, nas, vas, ih\)
+ #strong[se] \(reflexive\)
+ #strong[je] \(the 3rd person singular \"is\/has\" auxiliary — this one specifically goes dead last\)
]
So: #raw("Da li si mu ga dao?") \(Did you give it to him?\) — #raw("li"), then #raw("si") \(aux\), then #raw("mu") \(dative\), then #raw("ga") \(accusative\). You cannot rearrange that string and have it sound natural, even though every individual piece is \"correct\" grammar on its own.

The good news: you mostly just need to get a feel for the order by ear rather than consciously running the checklist every time — but when you get stuck mid-sentence and aren\'t sure where a clitic goes, \"second position, and li-aux-dative-acc\/gen-se-je in that order\" is the actual rule to fall back on.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[8.3 Possessive Pronouns]]
Decline exactly like the adjective paradigm in Section 5.2 — they agree with the thing being possessed, not with the possessor.

#table(columns: 4, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[]], [#strong[Masc.]], [#strong[Neut.]], [#strong[Fem.]],
  [my], [moj], [moje], [moja],
  [your \(sg.\)], [tvoj], [tvoje], [tvoja],
  [his], [njegov], [njegovo], [njegova],
  [her], [njen \/ njezin], [njeno \/ njezino], [njena \/ njezina],
  [our], [naš], [naše], [naša],
  [your \(pl.\)], [vaš], [vaše], [vaša],
  [their], [njihov], [njihovo], [njihova],
)
#raw("Njen") is the more Serbian-leaning form, #raw("njezin") the more Croatian-leaning form — same pattern as a lot of the paired dictionary entries where the first word skews Croatian and the second skews Serbian.

There\'s also #strong[#raw("svoj")] — the reflexive possessive, meaning \"one\'s own,\" which refers back to the subject of the clause no matter who that subject is: #raw("Uzeo je svoju knjigu") \(He took his \[own\] book\) vs. #raw("Uzeo je njegovu knjigu") \(He took his \[someone else\'s\] book\). English doesn\'t distinguish these and it\'s an easy thing to just never use if nobody corrects you — but it\'s a real, meaningful distinction to natives.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[8.4 Demonstrative Pronouns]]
Three-way distance system, same one covered in the Random Notes chapter:

#table(columns: 3, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Pronoun]], [#strong[Distance]], [#strong[Example]],
  [ovaj \/ ovo \/ ova], [near the speaker], [Ovo je moja knjiga. \(This is my book.\)],
  [taj \/ to \/ ta], [near the listener, or the current topic], [Da li vidiš to drvo? \(Do you see that tree?\)],
  [onaj \/ ono \/ ona], [far from both speaker and listener], [Ono je tamo daleko. \(That\'s far away over there.\)],
)
All three decline like adjectives \(Section 5.2\) across all seven cases.

#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[8.5 Interrogative Pronouns]]
#strong[#raw("Ko")\/#raw("šta")] \(who\/what\) don\'t decline for gender or number, but they do decline for case: #raw("ko, koga, kome, koga, —, kim(e), kome") and #raw("šta, čega, čemu, šta, —, čim(e), čemu").

#strong[#raw("Koji")] \(which\) is the one that fully declines like an adjective and gets used constantly as a relative pronoun \(\"that\/which\"\), not just a question word:

#table(columns: 5, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Case]], [#strong[Masc. sg.]], [#strong[Fem. sg.]], [#strong[Neut. sg.]], [#strong[Plural]],
  [Nominative], [koji], [koja], [koje], [koji],
  [Genitive], [kog\(a\)], [koje], [kog\(a\)], [kojih],
  [Dative], [kom\(e\)], [kojoj], [kom\(e\)], [kojima],
  [Accusative], [koji\/koga #emph[\(Inan\/Anim\)]], [koju], [koje], [koje],
  [Instrumental], [kojim], [kojom], [kojim], [kojima],
  [Locative], [kom\(e\)], [kojoj], [kom\(e\)], [kojima],
)
#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[8.6 Reflexive #raw("se")]]
#raw("Se") is its own animal — it doesn\'t inflect at all, it\'s the same form no matter who or what it\'s attached to. It shows up in a few different jobs:

#block(above: 0.42em, below: 0.5em)[
- #strong[True reflexive]: the subject does something to itself. #raw("Kupam se.") \(I\'m bathing \[myself\].\)
- #strong[Reciprocal]: two subjects doing something to each other. #raw("Vole se.") \(They love each other.\)
- #strong[Verbs that are just inherently \"se\" verbs] with no non-reflexive form at all, or where the reflexive version means something totally different from the base verb. This is why the dictionary bullets #raw("se") verbs underneath their non-reflexive counterpart — to make that relationship visible.
- #strong[The impersonal\/\"felt\" construction] covered in Common Questions — #raw("Želi mi se gledati") \(\"I feel like watching,\" more literally \"it wants itself to watch to me\"\). This one leans on the dative clitics from 8.1 stacked with #raw("se"), following the ordering rule from 8.2.
]
#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[9. Numbers — Agreement Rules]]
The actual number words \(jedan, dva, tri...\) and their ordinal\/collective variants are already listed out in the Key to Markings section of this book, so I won\'t re-list them here — go there for the raw vocabulary. What\'s missing, and what genuinely confused me for a while, is #strong[how the noun after the number has to change] depending on which number it is. This is its own table because the rule isn\'t gradual, it hits a hard wall at two specific points: after 1, and after 4.

#table(columns: 4, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[Number]], [#strong[Noun form required]], [#strong[Adjective form required]], [#strong[Example]],
  [#strong[1] \(jedan\/jedna\/jedno\)], [Nominative singular — behaves exactly like an adjective, agrees in gender], [Nominative singular, agrees], [jedan dobar sto \(one good table\)],
  [#strong[2, 3, 4] \(dva\/tri\/četiri\)], [Special \"counting form\" — for masc.\/neut. nouns this looks like the Genitive singular; for fem. nouns it looks like the Nominative plural#degmark ], [Genitive plural, regardless of the noun\'s gender], [dva dobra stola \(two good tables\); dve dobre žene \(two good women\)],
  [#strong[5 and up]], [Genitive plural], [Genitive plural], [pet dobrih stolova \(five good tables\)],
)
A few things to unpack there:

#block(above: 0.42em, below: 0.5em)[
- #raw("dva") has a separate feminine form, #raw("dve")\/#raw("dvije") \[E\]\/\[J\] — #raw("tri") and #raw("četiri") don\'t change for gender at all.
- The 2-4 \"counting form\" for masculine\/neuter nouns is a leftover of the old dual number Slavic languages used to have \(a grammatical category for \"exactly two\" that most Slavic languages have since lost\) — that history is why it looks like a case form that doesn\'t quite match anything else in the noun\'s regular paradigm.#degmark  This is also the exact \"Countable Plural\" form mentioned in the Random Notes chapter for words like #raw("grm"), #raw("list"), #raw("kamen"), #raw("cvijet") — his note that \"the only time the Countable Plural form is seen is when the number is specified\" is describing this same 2-4 counting form, just from the word-list side instead of the rule side.
- After 5 and up, everything — noun and adjective both — just goes plain Genitive Plural, no special counting form involved. This is the easiest bracket once you know it, ironically, because it\'s just \"genitive plural, no exceptions.\"
]
#strong[Collective numbers] \(dvoje, troje, četvoro, petoro...\) — also already listed in the Key to Markings section — get pulled out instead of the regular cardinal number in two situations: when you\'re counting a group of #strong[mixed-gender people] \(#raw("dvoje dece") — two children, mixed or unspecified gender\) or a noun that only exists in plural form \(#raw("troje vrata") — three doors, since #raw("vrata") is pluralia tantum and has no singular to count against\). If you try to use the regular cardinal \(#raw("dva deteta")\) instead of the collective \(#raw("dvoje dece")\) in a mixed-gender-group context, it\'s not going to break the sentence, but it will sound off to a native ear.

#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
That\'s the whole system in one place. Cross-reference back to the Key to Markings chapter any time a dictionary entry throws a marker at you that doesn\'t immediately click — the short version, always: #raw("(a)")\/#raw("(+a)") is Section 3, #raw("(k->c)") etc. is Section 4, #raw("(Imp)")\/#raw("(Perf)") is Section 7, #raw("(Anim)")\/#raw("(Inan)") is Section 2. Stay awesome, Elders and Sisters. Keep killing it.

