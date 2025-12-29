#import "../../style.typ": default_style, formula, example, steps, variables, math


  = Normalverteilung

  #variables[
    *Neue Variablen:*
    
    $mu$: Erwartungswert der Normalverteilung \
    $sigma$: Standardabweichung \
    $Phi$: Verteilungsfunktion der Standardnormalverteilung
  ]

  #formula[
    *Notation:* $X tilde N(mu, sigma^2)$
    
    *Dichtefunktion (PDF):*
    
    #math[$ f(x) = 1/(sqrt(2 pi) sigma) dot e^(-(x - mu)^2 \/ (2 sigma^2)) $]
    
    *Standardisierung:*
    
    #math[$ Z = (X - mu)/sigma tilde N(0, 1) $]
    
    *Intervallwahrscheinlichkeit:*
    
    #math[$ P(a <= X <= b) = Phi((b - mu)/sigma) - Phi((a - mu)/sigma) $]
    
    *68-95-99.7-Regel:*
    - ca. 68% in $[mu - sigma, mu + sigma]$
    - ca. 95% in $[mu - 2sigma, mu + 2sigma]$
    - ca. 99.7% in $[mu - 3sigma, mu + 3sigma]$
  ]


  #steps[
    + Gegeben: $X tilde N(mu, sigma^2)$
    + Grenzen $a$, $b$ standardisieren: $z = (x - mu)/sigma$
    + Tabellenwerte $Phi(z_a)$, $Phi(z_b)$ ablesen
    + $P(a <= X <= b) = Phi(z_b) - Phi(z_a)$
  ]


  #example[
    *Gegeben:* $X tilde N(3, 4)$ → $mu = 3$, $sigma = 2$


    *Gesucht:* $P(1.26 <= X <= 5.12)$


    $ z_1 = (1.26 - 3)/2 = -0.87 $
    $ z_2 = (5.12 - 3)/2 = 1.06 $


    $ P(1.26 <= X <= 5.12) &= Phi(1.06) - Phi(-0.87) \
                            &= 0.8554 - (1 - 0.8078) \
                            &= 0.6632 $
  ]

