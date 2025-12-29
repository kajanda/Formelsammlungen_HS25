#import "../../style.typ": default_style, formula, example, steps, variables, math


  = Punktschätzungen

  #variables[
    *Neue Variablen:*
    
    $hat(theta)$: Schätzer für Parameter $theta$ \
    $hat(mu)$: Schätzer für Mittelwert \
    $hat(sigma)^2$: Schätzer für Varianz
  ]

  #formula[
    *Erwartungswert:*
    
    #math[$ hat(mu) = overline(X) = 1/n sum_(i=1)^n X_i $]
    
    *Varianz:*
    
    #math[$ hat(sigma)^2 = s^2 = 1/(n-1) sum_(i=1)^n (X_i - overline(X))^2 $]
    
    *Eigenschaften:*
    - *Erwartungstreu:* $E(hat(theta)) = theta$
    - *Konsistent:* $hat(theta) arrow.r theta$ für $n arrow.r infinity$
    - *Effizient:* minimale Varianz
  ]


  #steps[
    + Stichprobe $x_1, dots, x_n$ gegeben
    + Schätzer wählen (z.B. $overline(x)$ für $mu$)
    + Schätzwert berechnen
    + Eigenschaften prüfen (erwartungstreu, konsistent)
  ]

