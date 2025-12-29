#import "../../style.typ": default_style, formula, example, steps, variables, math


  = Spearman-Rangkorrelation

  #variables[
    *Neue Variablen:*
    
    $"rg"(x_i)$: Rang von $x_i$ in sortierter Liste \
    $r_"Sp"$: Spearman-Korrelationskoeffizient \
    $d_i$: Differenz der Ränge
  ]

  #formula[
    *Definition (allgemein):*
    
    #math[$ r_"Sp" = (sum_(i=1)^n ("rg"(x_i) - overline("rg"(x)))("rg"(y_i) - overline("rg"(y))))/(sqrt(sum_(i=1)^n ("rg"(x_i) - overline("rg"(x)))^2) dot sqrt(sum_(i=1)^n ("rg"(y_i) - overline("rg"(y)))^2)) $]
    
    *Vereinfachte Formel* (keine gleichen Ränge):
    
    #math[$ r_"Sp" = 1 - (6 sum_(i=1)^n d_i^2)/(n(n^2 - 1)) $]
    
    wobei $d_i = "rg"(x_i) - "rg"(y_i)$
    
    *Interpretation:*
    - Misst *monotonen* (nicht nur linearen) Zusammenhang
    - Robust gegen Ausreißer
    - Werte: $-1 <= r_"Sp" <= 1$
  ]

  #steps[
    + Ränge für $x$ und $y$ separat vergeben (1 = kleinster Wert)
    + Bei gleichen Werten: Durchschnittsrang vergeben
    + Rangdifferenzen $d_i$ berechnen
    + Formel anwenden (vereinfacht falls keine Bindungen)
    + Interpretation wie bei Pearson
  ]

  #example[
    *Alter vs. Laufzeit (6 Personen):*

    #table(
      columns: 5,
      [$i$], [$x_i$], [$y_i$], [$"rg"(x_i)$], [$"rg"(y_i)$],
      [1], [59], [14.6], [6], [6],
      [2], [35], [11.8], [3], [2],
      [3], [43], [14.3], [5], [5],
      [4], [23], [13.0], [1], [3],
      [5], [42], [14.2], [4], [4],
      [6], [27], [11.0], [2], [1]
    )

    $ sum d_i^2 = 0 + 1 + 0 + 4 + 0 + 1 = 6 $

    $ r_"Sp" = 1 - (6 dot 6)/(6(36 - 1)) = 1 - 36/210 approx 0.83 $

    Starker positiver monotoner Zusammenhang
  ]

