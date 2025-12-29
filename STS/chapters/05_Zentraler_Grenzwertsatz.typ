#import "../../style.typ": default_style, formula, example, steps, variables, math


  = Zentraler Grenzwertsatz

  #variables[
    *Neue Variablen:*
    
    $X_i$: i-te Zufallsvariable in Stichprobe \
    $overline(X)$: Stichprobenmittel \
    $n$: Stichprobengröße (hier als Zufallsvariablenzahl)
  ]

  #formula[
    *Aussage:* Summe/Mittelwert von i.i.d. Zufallsvariablen ist asymptotisch normalverteilt.
    
    Gegeben: $X_1, X_2, dots, X_n$ i.i.d. mit $E(X_i) = mu$, $"Var"(X_i) = sigma^2$
    
    #math[$ overline(X) = 1/n sum_(i=1)^n X_i $]
    
    *Für großes* $n$*:*
    
    #math[$ overline(X) tilde.dot N(mu, sigma^2/n) $]
    
    *Standardisiert:*
    
    #math[$ (overline(X) - mu)/(sigma/sqrt(n)) tilde.dot N(0, 1) $]
  ]


  #example[
    *Produktion (6 Arbeitsschritte):*
    
    Jeder Schritt: gleichverteilt in [1, 2] Stunden
    
    $ mu = 1.5, quad sigma^2 = 1/12 $


    Gesamtdauer $T = sum_(i=1)^6 X_i$:


    $ E(T) = 6 dot 1.5 = 9 $
    $ "Var"(T) = 6 dot 1/12 = 1/2 $
    $ sigma_T = 1/sqrt(2) approx 0.707 $


    $ P(T <= 10) approx Phi((10 - 9)/0.707) approx Phi(1.41) approx 0.92 $
  ]

