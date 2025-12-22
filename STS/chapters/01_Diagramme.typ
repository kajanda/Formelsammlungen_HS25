#import "../../style.typ": default_style, formula, example, steps, variables, math
#show: default_style

#align(center)[
  #text(size: 14pt, weight: "bold")[Diagramme]
  #v(0.2em)
]

#columns(3, gutter: 1.2em)[

  = Grundbegriffe

  #variables[
    *Häufig gebrauchte Variablen:*
    
    $x$: Merkmal / Beobachtung \
    $a_i$: Merkmalsausprägung (Wertklasse) \
    $h_i$: absolute Häufigkeit von $a_i$ \
    $f_i$: relative Häufigkeit von $a_i$ \
    $H_i$: kumulierte absolute Häufigkeit \
    $F_i$: kumulierte relative Häufigkeit \
    $overline(x)$: arithmetisches Mittel \
    $x_"med"$: Median (2. Quantil) \
    $x_"mod"$: Modalwert (häufigster Wert) \
    $s^2$: Varianz, $s_x$: Standardabweichung \
    $s_"korr"$: korrigierte Standardabweichung \
    $f(x)$: PMF/PDF, $F(x)$: CMF/CDF
  ]

  #formula[
    *PMF:* $f(x)$ Relative Häufigkeit (Stabdiagramm)
    
    *CMF:* $F(x)$ Kumulative relative Häufigkeit (Treppendiagramm)
    
    *PDF:* $f(x)$ Höhe Balken Histogramm
    
    *CDF:* $F(x)$ Kulutative Fläche Balken Histogramm
  ]


  = Diagramtypen
  == PMF
  #image("../assets/PMF.png", width: 100%)


  == CMF
  #image("../assets/CMF.png", width: 100%)

  == PDF
  #image("../assets/PDF.png", width: 100%)


  == CDF
  #image("../assets/CDF.png", width: 90%)

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


    PMF: $h_i / 20$ , PDF: $h_i / (20)$ , CDF: $F_i$, CMF: $H_i$
  ]

]
