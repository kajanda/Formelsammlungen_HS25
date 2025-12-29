#import "../../style.typ": default_style, formula, example, steps, variables, math


  = Hypergeometrische Verteilung

  #variables[
    *Neue Variablen:*
    
    $N$: Gesamtzahl Objekte \
    $M$: Anzahl Merkmalträger in Grundgesamtheit \
    $n$: Stichprobengröße \
    $k$: Merkmalsträger in Stichprobe
  ]

  #formula[
    *Ziehen ohne Zurücklegen:*
    
    #math[$ P(X = k) = (binom(M, k) dot binom(N-M, n-k))/binom(N, n) $]
    
    *Erwartungswert:*
    
    #math[$ E(X) = n dot M/N $]
    
    *Varianz:*
    
    #math[$ "Var"(X) = n dot M/N dot (1 - M/N) dot (N-n)/(N-1) $]
  ]


  #steps[
    + Modell: Ziehen ohne Zurücklegen aus endlicher Grundgesamtheit
    + Parameter $N$, $M$, $n$ bestimmen
    + $P(X = k)$ mit Binomialkoeffizienten berechnen
    + Bei großem $N$: Approximation durch Binomialverteilung
  ]


  #example[
    *Lotto 6 aus 49:*
    
    $N = 49$, $M = 6$, $n = 6$


    $ P(X >= 4) &= sum_(k=4)^6 (binom(6, k) dot binom(43, 6-k))/binom(49, 6) \
                 &approx 0.00099 $


    Etwa 1 von 1000 Tipps hat ≥ 4 Richtige.


    *Approximation durch Binomial:*
    
    Faustregel: $n/N <= 0.05$ → $B(n, M/N)$
  ]

