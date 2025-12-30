#import "../../style.typ": default_style, formula, example, steps, variables, math


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

    *Korrelationskoeffizient:*

    #math[$ r = (s_(x y))/(s_x dot s_y) $]
    
    *Bestimmtheitsmaß:*
    
    #math[$ R^2 = r^2 = (s_y^2 - s_"Res"^2)/(s_y^2) $]
  ]

  #steps[
    + Korrelationskoeffizient $r$ berechnen
    + Steigung: $b = s_(x y)\/s_x^2$ (siehe Kapitel Bivariate Daten)
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

  == Transformationen für nicht-lineare Regression

  #table(
    columns: 2,
    stroke: 0.5pt,
    align: center + horizon,
    [*Ausgangsfunktion*], [*Transformation*],
    
    [$y = q dot x^m$], [$log(y) = log(q) + m dot log(x)$],
    
    [$y = q dot m^x$], [$log(y) = log(q) + log(m) dot x$],
    
    [$y = q dot e^(m dot x)$], [$ln(y) = ln(q) + m dot x$],
    
    [$y = 1/(q + m dot x)$], [$V = q + m dot x; quad V = 1/y$],
    
    [$y = q + m dot ln(x)$], [$y = q + m dot U; quad U = ln(x)$],
    
    [$y = 1/(q dot m^x)$], [$log(1/y) = log(q) + log(m) dot x$],
  )

  #example[
    *Beispiel: Exponentielles Wachstum*

    Gegeben sind folgende Wertepaare $(x_i, y_i)$:
    
    #table(
      columns: 7,
      align: center,
      [*i*], [1], [2], [3], [4], [5], [6],
      [$x_i$], [1], [2], [3], [4], [5], [6],
      [$y_i$], [2.7], [7.4], [20.1], [54.6], [148.4], [403.4]
    )
    
    *(1) Transformation:* $Y = log(y)$
    
    #table(
      columns: 7,
      align: center,
      [*i*], [1], [2], [3], [4], [5], [6],
      [$x_i$], [1], [2], [3], [4], [5], [6],
      [$Y_i$], [0.431], [0.869], [1.303], [1.737], [2.171], [2.606]
    )
    
    *(2) Regressionsgerade für $Y = a + b x$ berechnen:*
    
    $overline(x) = 3.5$, $s_x = 1.7078$
    
    $overline(Y) = 1.5195$, $s_Y = 0.7896$
    
    $s_(x Y) = 1.3483$, $r = 0.999$

    $ b = 1.3483/1.7078^2 approx 0.462 $

    $ a = 1.5195 - 0.462 dot 3.5 approx -1.1135 $

    *Regressionsgerade für transformierte Daten:*
    
    $ Y = -1.1135 + 0.462 x $
    
    *(3) Rücktransformation:*
    
    $ y = 10^Y = 10^(-1.1135 + 0.462 x) = 0.0772 dot 10^(0.462 x) $
    
    *Endergebnis:*
    
    $ y = 0.0772 dot (2.9)^x $
  ]

