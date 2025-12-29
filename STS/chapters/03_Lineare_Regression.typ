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

