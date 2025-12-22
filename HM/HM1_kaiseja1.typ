#import "../style.typ": default_style, formula, example, steps
#show: default_style

#align(center)[
  #text(size: 14pt, weight: "bold")[HM1-Zusammenfassung]

]

#columns(3, gutter: 1.2em)[

= Rechnerarithmetik

#include "chapters/02_Rechnerarithmetik.typ"

#colbreak()

= Nullstellenprobleme

#include "chapters/03_Nullstellenprobleme.typ"

#colbreak()

= Lineare Gleichungssysteme

#include "chapters/04_Lineare_Gleichungssysteme.typ"

#colbreak()

= Ergänzung & Formeln
#include "chapters/05_Ergaenzung_Formeln.typ"

]