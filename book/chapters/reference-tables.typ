#import "../lib.typ": *

#runhead("Colors, Numbers, Days")

#chapter[Reference Tables]
Restored from his front matter — colors, numbers, and time expressions, cleaned up into proper tables. Anything he didn\'t personally finish is marked with a #strong[#degmark ], per the key to markings.

#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[Colors \(Boja\)]]
#table(columns: 3, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[English]], [#strong[Srpsko-Hrvatski]], [#strong[Comparative]],
  [White], [bijel \/ beo], [bjelji#degmark ],
  [Black], [crn], [crniji#degmark ],
  [Red], [crven], [crveniji#degmark ],
  [Yellow], [žut], [žući#degmark ],
  [Blue], [plav], [plaviji#degmark ],
  [Orange], [narandžast], [narandžastiji#degmark ],
  [Purple], [ljubičast], [ljubičastiji#degmark ],
  [Green], [zelen], [zeleniji#degmark ],
  [Pink], [roze? \/ ružičast?], [\(check?#degmark \)],
  [Light], [lak?], [\(check?#degmark \)],
  [Dark], [mrk, taman, mračan], [tamniji#degmark ],
  [Brown], [braon? \/ smeđ?], [smeđiji#degmark ],
)
He flagged the words themselves with a #raw("?") for Pink and Light — he wasn\'t sure those were the right words even before he left, so those are left as he had them rather than guessed at further.

#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[Numbers \(Brojevi\)]]
Cardinal, ordinal \(m\/f\/n\), collective, and the #raw("-ica")\/#raw("-ka") noun form, 1–20, restored from his list. A couple of duplicated tokens in the source that looked like extraction repeats \(e.g. a collective form printed twice in a row\) were normalized to match the pattern the rest of the list follows — noted where that happened.

#table(columns: 5, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[\#]], [#strong[Cardinal]], [#strong[Ordinal \(m \/ f \/ n\)]], [#strong[Collective]], [#strong[Noun form]],
  [1], [jedan \(m\) \/ jedna \(f\) \/ jedno \(n\)], [prvi \/ prva \/ prvo], [—], [jedinica],
  [2], [dva \/ dve], [drugi \/ druga \/ drugo], [dvoje], [dvojica, dvojka],
  [3], [tri], [treći \/ treća \/ treće], [troje], [trojka],
  [4], [četiri], [četvrti \/ četvrta \/ četvrto], [četvoro], [četvorka],
  [5], [pet], [peti \/ peta \/ peto], [petoro], [petica],
  [6], [šest], [šesti \/ šesta \/ šesto], [šestoro], [šestica],
  [7], [sedam], [sedmi \/ sedma \/ sedmo], [sedmoro], [sedmica],
  [8], [osam], [osmi \/ osma \/ osmo], [osmoro], [osmica],
  [9], [devet], [deveti \/ deveta \/ deveto], [devetoro], [devetka],
  [10], [deset], [deseti \/ deseta \/ deseto], [desetoro], [desetka],
  [11], [jedanaest], [jedanaesti \/ jedanaesta \/ jedanaesto], [jedanaestoro], [jedanaestica],
  [12], [dvanaest], [dvanaesti \/ dvanaesta \/ dvanaesto], [dvanaestoro], [dvanaestica],
  [13], [trinaest], [trinaesti \/ trinaesta \/ trinaesto], [trinaestoro], [trinaestica],
  [14], [četrnaest], [četrnaesti \/ četrnaesta \/ četrnaesto], [četrnaestoro], [četrnaestica],
  [15], [petnaest], [petnaesti \/ petnaesta \/ petnaesto], [petnaestoro], [petnaestica],
  [16], [šesnaest], [šesnaesti \/ šesnaesta \/ šesnaesto], [šesnaestoro], [šesnaestica],
  [17], [sedamnaest], [sedamnaesti \/ sedamnaesta \/ sedamnaesto], [sedamnaestoro], [sedamnaestica],
  [18], [osamnaest], [osamnaesti \/ osamnaesta \/ osamnaesto], [osamnaestoro], [osamnaestica],
  [19], [devetnaest], [devetnaesti \/ devetnaesta \/ devetnaesto], [devetnaestoro], [devetnaestica],
  [20], [dvadeset], [dvadeseti \/ dvadeseta \/ dvadeseto], [dvadesetoro], [dvadesetica],
)
#note[Note: The forms above are variations for groups, gendered ordinal forms, and colloquial or informal terms. \(His own note.\)
]
#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[Beyond twenty#degmark ]]
He didn\'t get past twenty in the source. The round numbers, cardinal form only:

30 — trideset#degmark , 40 — četrdeset#degmark , 50 — pedeset#degmark , 60 — šezdeset#degmark , 70 — sedamdeset#degmark , 80 — osamdeset#degmark , 90 — devedeset#degmark , 100 — sto#degmark 

#v(0.3em) #line(length: 100%, stroke: 0.4pt + luma(200)) #v(0.3em)
#block(above: 1.05em, below: 0.42em)[#text(size: 13pt, weight: "bold")[Measurement of Time]]
#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[Months]]
His note on how these actually get used in conversation: Croatians will say the traditional name, but the international\/cognate name is also common in speech.

#table(columns: 3, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[English]], [#strong[Traditional \(Hrv\)]], [#strong[Conversational \/ International]],
  [January], [siječanj], [januar],
  [February], [veljača], [februar],
  [March], [ožujak], [mart],
  [April], [travanj], [april],
  [May], [svibanj], [maj],
  [June], [lipanj], [jun],
  [July], [srpanj], [jul],
  [August], [kolovoz], [avgust],
  [September], [rujan], [septembar],
  [October], [listopad], [oktobar],
  [November], [studeni], [novembar],
  [December], [prosinac], [decembar],
)
#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[Seasons]]
#table(columns: 2, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[English]], [#strong[Srpsko-Hrvatski]],
  [Summer], [ljeto],
  [Winter], [zima],
  [Fall], [jesen],
  [Spring], [proljeće],
)
#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[Days of the Week]]
#table(columns: 2, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[English]], [#strong[Srpsko-Hrvatski]],
  [Monday], [ponedeljak],
  [Tuesday], [utorak],
  [Wednesday], [sreda],
  [Thursday], [četvrtak],
  [Friday], [petak],
  [Saturday], [subota],
  [Sunday], [nedelja],
)
#block(above: 1.05em, below: 0.42em)[#text(size: 11pt, weight: "bold")[Time Expressions]]
#table(columns: 2, stroke: 0.4pt + luma(195), inset: (x: 0.45em, y: 0.3em), fill: (_, y) => if y == 0 { luma(238) } else { none },
  [#strong[English]], [#strong[Srpsko-Hrvatski]],
  [Year], [godina],
  [Month], [mesec],
  [Week], [nedelja, sedmica, tjedan],
  [Day], [dan],
  [Hour], [sat],
  [Minute], [minut],
  [Second], [sekund],
)
