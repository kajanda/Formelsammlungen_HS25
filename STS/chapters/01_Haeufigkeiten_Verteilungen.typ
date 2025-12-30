#import "../../style.typ": default_style, formula, example, steps, variables, math


  = Häufigkeiten und Verteilungen

  #variables[
    *Neue Variablen in diesem Abschnitt:*
    
    $n$: Stichprobengröße (Anzahl Beobachtungen)
  ]

  #steps[
    + Urliste sortieren
    + Verschiedene Werte $a_i$ bestimmen
    + Absolute Häufigkeit: $h_i$ = Anzahl von $a_i$
    + Relative Häufigkeit: $f_i = h_i / n$
    + Kumulative Häufigkeit:
      - $H_i = sum_(k <= i) h_k$
      - $F_i = sum_(k <= i) f_k$
  ]


  #example[
    *Würfeln (20 Würfe):*
    
    #table(
      columns: 7,
      [$a_i$], [1], [2], [3], [4], [5], [6],
      [$h_i$], [4], [3], [4], [0], [6], [3],
      [$f_i$], [0.2], [0.15], [0.2], [0], [0.3], [0.15],
      [$F_i$], [0.2], [0.35], [0.55], [0.55], [0.85], [1.0],
      [$H_i$], [4], [7], [11], [11], [17], [20]
    )
  CDF: $F_i$, CMF: $H_i$
  ]