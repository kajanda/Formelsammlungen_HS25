#import "../../style.typ": default_style, formula, example, steps, variables, math


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
    + Falls $p$ ganzzahlig → $Q_q = 1/2(x_((p)) + x_((p+1)))$\
      -> auf Stufe
    + Falls nicht → $k = ceil(p)$, dann $Q_q = x_((k))$ \
      -> an Stufe
  ]


  #example[
    *Stichprobe:* 4, 4, 0, 3, 5, 3, 1
    
    *Sortiert:* 0, 1, 3, 3, 4, 4, 5 ($n = 7$)


    *Q1:* $p = 7 dot 0.25 = 1.75$ → $k = 2$ → $Q_1 = 1$


    *Median:* $p = 7 dot 0.5 = 3.5$ → $k = 4$ → $Q_2 = 3$


    *Q3:* $p = 7 dot 0.75 = 5.25$ → $k = 6$ → $Q_3 = 4$
  ]

