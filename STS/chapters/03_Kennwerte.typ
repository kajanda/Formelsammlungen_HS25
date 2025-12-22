#import "../../style.typ": default_style, formula, example, steps, variables, math
#show: default_style

#align(center)[
  #text(size: 14pt, weight: "bold")[Kennwerte und Korrelation]
]

#columns(3, gutter: 1.2em)[

  = Mittelwert und Varianz

  #variables[
    *Neue Variablen:*
    
    $s$: Standardabweichung \
    $s_"korr"$: korrigierte Standardabweichung
  ]

  #formula[
    *Arithmetischer Mittelwert:*
    
    #math[$ overline(x) = 1/n sum_(i=1)^n x_i $]
    
    *Empirische Varianz:*
    
    #math[$ s^2 = 1/n sum_(i=1)^n (x_i - overline(x))^2 $]
    
    *Verschiebungssatz:*
    
    #math[$ s^2 = 1/n sum_(i=1)^n x_i^2 - overline(x)^2 $]
    
    *Standardabweichung:*
    
    #math[$ s = sqrt(s^2) $]
    
    *Korrigierte Varianz:*
    
    #math[$ s_"korr"^2 = n/(n-1) dot s^2 $]
  ]


  #steps[
    + Mittelwert $overline(x)$ berechnen
    + Varianz entweder direkt oder mit Verschiebungssatz
    + Standardabweichung: $s = sqrt(s^2)$
    + Für Schätzungen: korrigierte Varianz verwenden
  ]


  #example[
    *Gewinnspiel (100 Spiele):*
    
    #table(
      columns: 7,
      [Gewinn], [-1], [0], [4], [8], [10], [20],
      [$h_i$], [74], [13], [3], [5], [4], [1]
    )


    $ overline(x) &= 1/100(-1 dot 74 + 0 dot 13 + 4 dot 3 + 8 dot 5 + 10 dot 4 + 20 dot 1) \
                  &= -0.38 "CHF" $


    $ s^2 &= 1/100(1 dot 74 + 0 + 16 dot 3 + 64 dot 5 + 100 dot 4 + 400 dot 1) - 0.38^2 \
          &= 12.28 "CHF"^2 $


    $ s = sqrt(12.28) approx 3.5 "CHF" $
  ]


  = Lineare Regression (KQM)

  #variables[
    *Neue Variablen:*
    
    $a$: Achsenabschnitt \
    $b$: Steigung der Regressionsgeraden \
    $R^2$: Bestimmtheitsmaß
  ]

  #formula[
    *Regressionsgerade:* $y = a + b x$
    
    *Steigung:*
    
    #math[$ b = (s_(x y))/(s_x^2) = r dot s_y/s_x $]
    
    *Achsenabschnitt:*
    
    #math[$ a = overline(y) - b dot overline(x) $]
    
    *Residualvarianz:*
    
    #math[$ s_"Res"^2 = s_y^2 (1 - r^2) $]
    
    *Bestimmtheitsmaß:*
    
    #math[$ R^2 = r^2 = (s_y^2 - s_"Res"^2)/(s_y^2) $]
  ]

  #steps[
    + Korrelationskoeffizient $r$ berechnen
    + Steigung: $b = s_(x y)\/s_x^2$
    + Achsenabschnitt: $a = overline(y) - b overline(x)$
    + Prüfung: Residuenplot (sollte unsystematisch streuen)
    + Güte: $R^2$ berechnen (Anteil erklärter Varianz)
  ]

  #example[
    *Größe-Gewicht (15 Personen):*

    $overline(x) = 173$ cm, $s_x = 6.047$ cm
    
    $overline(y) = 72.267$ kg, $s_y = 7.474$ kg
    
    $s_(x y) = 41.071$, $r = 0.898$

    $ b = 41.071/6.047^2 approx 1.123 $

    $ a = 72.267 - 1.123 dot 173 approx -122.02 $

    *Regressionsgerade:*
    
    $ y = -122.02 + 1.123 x $

    $ R^2 = 0.898^2 approx 0.806 $
    
    → 80.6% der Varianz erklärt
  ]

  = Bivariate Daten & Kovarianz

  #variables[
    *Neue Variablen:*
    
    $(x_i, y_i)$: Wertepaare zweier Merkmale \
    $s_(x y)$: empirische Kovarianz \
    $overline(x y)$: Mittelwert der Produkte
  ]

  #formula[
    *Empirische Kovarianz:*
    
    #math[$ s_(x y) = 1/n sum_(i=1)^n (x_i - overline(x))(y_i - overline(y)) $]
    
    *Verschiebungssatz:*
    
    #math[$ s_(x y) = overline(x y) - overline(x) dot overline(y) $]
    
    wobei:
    
    #math[$ overline(x y) = 1/n sum_(i=1)^n x_i y_i $]
    
    *Korrigierte Kovarianz:*
    
    #math[$ s_(x y\,"korr") = n/(n-1) dot s_(x y) $]
    
    *Interpretation:*
    - $s_(x y) > 0$: positiver Zusammenhang
    - $s_(x y) approx 0$: kein linearer Zusammenhang
    - $s_(x y) < 0$: negativer Zusammenhang
  ]

  #steps[
    + Mittelwerte $overline(x)$, $overline(y)$ berechnen
    + Produkte $x_i y_i$ bilden
    + Verschiebungssatz anwenden: $s_(x y) = overline(x y) - overline(x) overline(y)$
    + Interpretation: Vorzeichen gibt Richtung des Zusammenhangs
  ]

  #example[
    *Stichprobe:* $x = [1, 2, 3]$, $y = [4, -1, 2]$

    $ overline(x) = 2, quad overline(y) = 5/3 $

    $ overline(x y) = 1/3(1 dot 4 + 2 dot (-1) + 3 dot 2) = 8/3 $

    $ s_(x y) = 8/3 - 2 dot 5/3 = -2/3 $

    Negativer Wert → negativer Zusammenhang
  ]

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
    - Misst **monotonen** (nicht nur linearen) Zusammenhang
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

  = Korrelation nach Bravais-Pearson

  #variables[
    *Neue Variablen:*
    
    $y$: zweite Variable \
    $s_x, s_y$: Standardabweichungen von $x$, $y$ \
    $s_(x y)$: Kovarianz von $x$, $y$ \
    $r$: Korrelationskoeffizient
  ]

  #formula[
    *Korrelationskoeffizient:*
    
    #math[$ r = (s_(x y))/(s_x dot s_y) $]
    
    wobei:
    
    #math[$ s_(x y) = 1/n sum_(i=1)^n (x_i - overline(x))(y_i - overline(y)) $]
    
    *Interpretation:*
    - $r approx 1$: starker positiver Zusammenhang
    - $r approx 0$: kein linearer Zusammenhang
    - $r approx -1$: starker negativer Zusammenhang
    
    *Bestimmtheitsmaß:* $r^2$ = Anteil erklärter Varianz
  ]


  #steps[
    + Mittelwerte $overline(x)$, $overline(y)$ berechnen
    + Standardabweichungen $s_x$, $s_y$ berechnen
    + Kovarianz $s_(x y)$ berechnen
    + Korrelationskoeffizient: $r = s_(x y)\/(s_x s_y)$
  ]

  #example[
    *Beispiel: Berechnung des Bravais-Pearson Korrelationskoeffizienten*
    
    Gegeben sind folgende Wertepaare $(x_i, y_i)$:
    
    #table(
      columns: 9,
      align: center,
      [*i*], [1], [2], [3], [4], [5], [6], [7], [8],
      [$x_i$], [5], [10], [20], [8], [4], [6], [12], [15],
      [$y_i$], [27], [46], [73], [40], [30], [28], [47], [59]
    )
    
    *(1) Mittelwerte berechnen:* $overline(x) = 10$, $overline(y) = 43.75$
    
    #table(
      columns: 9,
      align: center,
      [$x^2$], [25], [100], [400], [64], [16], [36], [144], [225],
      [$y^2$], [729], [2116], [5329], [1600], [900], [784], [2209], [3481],
      [$x_i y_i$], [135], [460], [1460], [320], [120], [168], [564], [885]
    )
    
    $sum x_i^2 = 1010$, $sum y_i^2 = 17148$, $sum x_i y_i = 4112$
    
    *(2) Standardabweichungen berechnen:*
    
    $s_x = sqrt(1/n sum x_i^2 - (overline(x))^2) = sqrt(126.25 - 100) = sqrt(26.25) = 5.12$
    
    $s_y = sqrt(1/n sum y_i^2 - (overline(y))^2) = sqrt(2143.5 - 1914.06) = 15.15$
    
    *(3) Kovarianz berechnen:*
    
    $s_(x y) = 1/8 sum x_i y_i - overline(x) dot overline(y) = 514 - 10 dot 43.75 = 76.5$
    
    *(4) Korrelationskoeffizient berechnen:*
    
    $r = s_(x y) / (s_x dot s_y) = 76.5 / (5.12 dot 15.15) approx 0.986$
    
    → *Starker positiver linearer Zusammenhang* zwischen $x$ und $y$
  ]

]
