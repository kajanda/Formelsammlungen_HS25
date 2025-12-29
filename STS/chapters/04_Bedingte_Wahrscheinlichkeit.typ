#import "../../style.typ": default_style, formula, example, steps, variables, math


  = Bedingte Wahrscheinlichkeit

  #variables[
    *Neue Variablen:*
    
    $A, B$: Ereignisse \
    $A_i$: Zerlegung des Ergebnisraums in Teilereignisse \
    $P(dot)$: Wahrscheinlichkeit eines Ereignisses
  ]

  #formula[
    *Definition:*
    
    #math[$ P(A | B) = (P(A sect B))/(P(B)), quad P(B) > 0 $]
    
    *Multiplikationssatz:*
    
    #math[$ P(A sect B) = P(B) dot P(A | B) $]
    
    *Satz von Bayes:*
    
    #math[$ P(A | B) = (P(A) dot P(B | A))/(P(B)) $]
    
    *Totale Wahrscheinlichkeit:*
    
    #math[$ P(B) = sum_i P(A_i) dot P(B | A_i) $]
  ]


  #steps[
    + Vierfeldertafel erstellen (Randsummen!)
    + Gegebene Wahrscheinlichkeiten eintragen
    + Formel $P(A|B) = P(A sect B) / P(B)$ anwenden
    + Bei Bayes: Totale Wahrscheinlichkeit im Nenner
  ]


  #example[
    *Raucher/Nichtraucher (1400 Personen):*
    
    #table(
      columns: 4,
      [], [*Raucher*], [*Nichtraucher*], [*Summe*],
      [*Frauen*], [100], [200], [300],
      [*Männer*], [400], [700], [1100],
      [*Summe*], [500], [900], [1400]
    )


    $ P("Raucherin" | "Frau") = 100/300 = 1/3 $


    $ P("Mann" | "Raucher") = 400/500 = 4/5 $
  ]

