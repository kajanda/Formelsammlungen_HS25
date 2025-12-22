#import "../../style.typ": default_style, formula, example, steps, variables, math
#show: default_style

#align(center)[
  #text(size: 14pt, weight: "bold")[Quartile und Boxplot]
]

#columns(3, gutter: 1.2em)[

  = Median und Quantile

  #variables[
    *Neue Variablen:*
    
    $q$: Quantilsniveau (z.B. 0.25, 0.5, 0.75) \
    $Q_q$: zugehöriges $q$-Quantil \
    $p$: Positionsindex in der sortierten Liste
  ]

  #formula[
    *q-Quantil* $Q_q$:
    
    Position: $p = n dot q$
    
    *Falls* $p$ *ganzzahlig:*
    
    #math[$ Q_q = 1/2 (x_((p)) + x_((p+1))) $]
    
    *Falls* $p$ *nicht ganzzahlig:*
    
    #math[$ Q_q = x_((ceil(p))) $]
    
    *Spezialfälle:*
    - Median: $q = 0.5$
    - 1. Quartil (Q1): $q = 0.25$
    - 3. Quartil (Q3): $q = 0.75$
  ]
  === Quartil aus CDF ablesen
  #image("../assets/CDF_quartil.png", width: 80%)

  #image("../assets/image.png", width: 80%)

  #steps[
    + Daten sortieren: $x_((1)) <= x_((2)) <= dots <= x_((n))$
    + Position berechnen: $p = n dot q$
    + Falls $p$ ganzzahlig → $Q_q = 1/2(x_((p)) + x_((p+1)))$
    + Falls nicht → $k = ceil(p)$, dann $Q_q = x_((k))$
  ]


  #example[
    *Stichprobe:* 4, 4, 0, 3, 5, 3, 1
    
    *Sortiert:* 0, 1, 3, 3, 4, 4, 5 ($n = 7$)


    *Q1:* $p = 7 dot 0.25 = 1.75$ → $k = 2$ → $Q_1 = 1$


    *Median:* $p = 7 dot 0.5 = 3.5$ → $k = 4$ → $Q_2 = 3$


    *Q3:* $p = 7 dot 0.75 = 5.25$ → $k = 6$ → $Q_3 = 4$
  ]

  = Quantile bei klassierten Daten

  #variables[
    *Neue Variablen:*
    
    $a_(k-1), a_k$: Klassenunter-/obergrenze \
    $F(a_k)$: CDF an rechter Klassengrenze
  ]

  #formula[
    Gegeben: Klasse $[a_(k-1), a_k]$ mit $F(a_(k-1)) < q <= F(a_k)$
    
    *Lineare Interpolation:*
    
    #math[$ Q_q = a_(k-1) + (a_k - a_(k-1))/(F(a_k) - F(a_(k-1))) dot (q - F(a_(k-1))) $]
  ]


  #steps[
    + Kumulierte Verteilung $F(a_k)$ aus Tabelle ablesen
    + Klasse finden, in der $F(a_(k-1)) < q <= F(a_k)$
    + Formel anwenden (lineare Interpolation)
  ]


  #example[
    *Mieten (0.7351-Quantil):*
    
    Klasse 1000–1500: $F(1000) = 0.47$, $F(1500) = 0.775$


    $ Q_(0.7351) &= 1000 + (1500 - 1000)/(0.775 - 0.47) dot (0.7351 - 0.47) \
                  &= 1000 + 500/0.305 dot 0.2651 \
                  &approx 1434.78 $
  ]


  = Boxplot-Kennwerte

  #variables[
    *Neue Variablen:*
    
    $"IQR"$: Interquartilsabstand \
    Untere/obere Antenne: Bereich ohne Ausreißer
  ]

  #image("../assets/boxplot.png", width: 100%)


  #formula[
    *Interquartilsabstand (IQR):*
    
    #math[$ "IQR" = Q_3 - Q_1 $]
    
    *Antennen (Whisker):*
    - Untere: Minimum in $[Q_1 - 1.5 dot "IQR", Q_1]$
    - Obere: Maximum in $[Q_3, Q_3 + 1.5 dot "IQR"]$
    
    *Ausreißer:* Werte außerhalb $[Q_1 - 1.5 dot "IQR", Q_3 + 1.5 dot "IQR"]$
  ]


  #example[
    *Daten:* 5, 7, 8, 9, 10, 12, 15, 20, 22


    $ Q_1 = 8, quad "Median" = 10, quad Q_3 = 15 $


    $ "IQR" = 15 - 8 = 7 $


    *Whisker:*
    - Untere: $Q_1 - 1.5 dot "IQR" = 8 - 10.5 = -2.5$ → Min(Daten) = 5
    - Obere: $Q_3 + 1.5 dot "IQR" = 15 + 10.5 = 25.5$ → Max(Daten) = 22


    *Ergebnis:* Alle Werte in $[5, 22]$ → **keine Ausreißer**
  ]

]
