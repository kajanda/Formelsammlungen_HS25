#import "../../style.typ": default_style, formula, example, steps, variables, math


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
    
    $n=8$

    $s_x = sqrt(1/n sum x_i^2 - (overline(x))^2) = sqrt(126.25 - 100) = sqrt(26.25) = 5.12$
    
    $s_y = sqrt(1/n sum y_i^2 - (overline(y))^2) = sqrt(2143.5 - 1914.06) = 15.15$
    
    *(3) Kovarianz berechnen:*
    
    $s_(x y) = 1/8 sum x_i y_i - overline(x) dot overline(y) = 514 - 10 dot 43.75 = 76.5$
    
    *(4) Korrelationskoeffizient berechnen:*
    
    $r = s_(x y) / (s_x dot s_y) = 76.5 / (5.12 dot 15.15) approx 0.986$
    
    → *Starker positiver linearer Zusammenhang* zwischen $x$ und $y$
  ]

