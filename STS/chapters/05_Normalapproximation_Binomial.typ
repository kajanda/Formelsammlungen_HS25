#import "../../style.typ": default_style, formula, example, steps, variables, math


  = Normalapproximation der Binomialverteilung

  #variables[
    *Neue Begriffe:*
    
    $Y$: approximierende Normalverteilung zu $X$ \
    Stetigkeitskorrektur: Anpassung um 0.5
  ]

  #formula[
    *Faustregel:* $n dot p dot (1-p) >= 9$
    
    *Approximation:*
    
    #math[$ B(n, p) approx N(n p, n p(1-p)) $]
    
    *Stetigkeitskorrektur:*
    
    #math[$ P(a <= X <= b) approx P(a - 0.5 <= Y <= b + 0.5) $]
    
    wobei $Y tilde N(n p, n p(1-p))$
  ]


  #steps[
    + Faustregel prüfen: $n p(1-p) >= 9$
    + Parameter berechnen: $mu = n p$, $sigma^2 = n p(1-p)$
    + Stetigkeitskorrektur anwenden (±0.5)
    + Mit Standardnormalverteilung rechnen
  ]


  #example[
    *200 Geräte, $p = 0.06$, $P(10 <= X <= 15)$*


    Prüfung: $200 dot 0.06 dot 0.94 = 11.28 >= 9$


    $ mu = 12, quad sigma = sqrt(11.28) approx 3.36 $


    Mit Stetigkeitskorrektur:


    $ P(9.5 <= Y <= 15.5) &= Phi((15.5 - 12)/3.36) - Phi((9.5 - 12)/3.36) \
                           &= Phi(1.04) - Phi(-0.74) \
                           &approx 0.85 - 0.23 = 0.62 $
  ]

