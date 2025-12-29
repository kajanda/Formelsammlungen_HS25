#import "../../style.typ": default_style, formula, example, steps, variables, math


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

