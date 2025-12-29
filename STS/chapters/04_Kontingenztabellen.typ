#import "../../style.typ": default_style, formula, example, steps, variables, math


  = Kontingenztabellen

  #variables[
    *Neue Variablen:*
    
    $n_(i j)$: absolute Häufigkeit in Zelle $(i, j)$ \
    $f_(i j)$: relative Häufigkeit in Zelle $(i, j)$ \
    Randsummen: Summen über Zeilen/Spalten
  ]

  #formula[
    *Kontingenztabelle* für Merkmale $A$, $B$:
    
    #table(
      columns: 4,
      [], [$B_1$], [$B_2$], [*Summe*],
      [$A_1$], [$n_(11)$], [$n_(12)$], [$n_(1 dot)$],
      [$A_2$], [$n_(21)$], [$n_(22)$], [$n_(2 dot)$],
      [*Summe*], [$n_(dot 1)$], [$n_(dot 2)$], [$n$]
    )
    
    *Randhäufigkeiten:*
    - Zeilen: $n_(i dot) = sum_j n_(i j)$
    - Spalten: $n_(dot j) = sum_i n_(i j)$
    
    *Relative Häufigkeiten:*
    
    #math[$ f_(i j) = n_(i j)/n $]
    
    *Bedingte Häufigkeit* ($A_i$ gegeben $B_j$):
    
    #math[$ f(A_i | B_j) = n_(i j)/n_(dot j) $]
  ]

  #steps[
    + Tabelle mit Zeilen (Merkmal $A$) und Spalten (Merkmal $B$) aufstellen
    + Absolute Häufigkeiten $n_(i j)$ eintragen
    + Randsummen berechnen
    + Relative/bedingte Häufigkeiten bei Bedarf berechnen
    + Visualisierung: Mosaikplot
  ]

  #example[
    *Zivilstand vs. Geschlecht (100 Personen):*

    #table(
      columns: 4,
      [], [*Männer*], [*Frauen*], [*Summe*],
      [*Ledig*], [25], [20], [45],
      [*Verheiratet*], [30], [25], [55],
      [*Summe*], [55], [45], [100]
    )

    $ f("Ledig" | "Mann") = 25/55 approx 0.45 $

    $ f("Frau" | "Verheiratet") = 25/55 approx 0.45 $
  ]

