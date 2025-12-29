#import "../../style.typ": default_style, formula, example, steps, variables, math


  = Binomialverteilung

  #variables[
    *Neue Variablen:*
    
    $n$: Anzahl Versuche \
    $p$: Erfolgswahrscheinlichkeit pro Versuch \
    $k$: Anzahl Erfolge
  ]

  #formula[
    *Notation:* $X tilde B(n, p)$
    
    *Dichtefunktion (PMF):*
    
    #math[$ P(X = k) = binom(n, k) dot p^k dot (1-p)^(n-k) $]
    
    *Erwartungswert:*
    
    #math[$ E(X) = n dot p $]
    
    *Varianz:*
    
    #math[$ "Var"(X) = n dot p dot (1-p) $]
    
    *Standardabweichung:*
    
    #math[$ sigma = sqrt(n dot p dot (1-p)) $]
  ]


  #steps[
    + Prüfen: $n$ Wiederholungen, konstantes $p$, unabhängig?
    + Parameter $n$, $p$ festlegen
    + $P(X = k)$ mit PMF-Formel berechnen
    + Für Intervalle: CDF nutzen oder summieren
  ]


  #example[
    *12× Würfeln, X = Anzahl Sechsen*


    $n = 12$, $p = 1/6$


    $ P(X = 3) = binom(12, 3) dot (1/6)^3 dot (5/6)^9 approx 0.1974 $


    $ P(X <= 3) = sum_(k=0)^3 P(X = k) approx 0.8748 $


    $ E(X) = 12 dot 1/6 = 2 $


    $ "Var"(X) = 12 dot 1/6 dot 5/6 = 5/3 $
  ]

