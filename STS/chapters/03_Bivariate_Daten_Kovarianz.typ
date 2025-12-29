#import "../../style.typ": default_style, formula, example, steps, variables, math


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

