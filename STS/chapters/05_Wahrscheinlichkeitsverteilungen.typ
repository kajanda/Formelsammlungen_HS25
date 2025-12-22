#import "../../style.typ": default_style, formula, example, steps, variables, math
#show: default_style

#align(center)[
  #text(size: 14pt, weight: "bold")[Wahrscheinlichkeitsverteilungen]

]

#columns(3, gutter: 1.2em)[

  = Übersichtstabelle Verteilungen

  #table(
    columns: 4,
    [*Verteilung*], [*PMF/PDF*], [*E(X)*], [*Var(X)*],
    
    [Bernoulli], [$p^x (1-p)^(1-x)$], [$p$], [$p(1-p)$],
    
    [Binomial], [$binom(n,k) p^k (1-p)^(n-k)$], [$n p$], [$n p(1-p)$],
    
    [Poisson], [$(lambda^k e^(-lambda))/k!$], [$lambda$], [$lambda$],
    
    [Hypergeom.], [$(binom(M,k) binom(N-M,n-k))/binom(N,n)$], [$n M/N$], [$dots$],
    
    [Normal], [$1/(sqrt(2pi)sigma) e^(-(x-mu)^2\/(2sigma^2))$], [$mu$], [$sigma^2$]
  )


  = Wichtige Quantile

  #variables[
    *Neue Begriffe:*
    
    $z_p$: p-Quantil der Standardnormalverteilung \
    $t_("df"\; p)$: p-Quantil der t-Verteilung mit df Freiheitsgraden
  ]

  #table(
    columns: 3,
    [*Niveau*], [*z-Wert*], [*Verwendung*],
    [90%], [1.645], [Normalvert.],
    [95%], [1.960], [Normalvert.],
    [99%], [2.576], [Normalvert.],
    [95% (n=7)], [2.365], [t-Vert. (df=7)],
    [95% (n=10)], [2.262], [t-Vert. (df=9)]
  )


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


  = Poissonverteilung

  #variables[
    *Neue Variablen:*
    
    $lambda$: mittlere Ereignisrate pro Intervall
  ]

  #formula[
    *Notation:* $X tilde "Pois"(lambda)$
    
    *Dichtefunktion:*
    
    #math[$ P(X = k) = (lambda^k dot e^(-lambda))/k! $]
    
    *Erwartungswert & Varianz:*
    
    #math[$ E(X) = lambda, quad "Var"(X) = lambda $]
    
    *Anwendung:* Seltene Ereignisse in festem Intervall
  ]


  #steps[
    + Modell: Ereignisse pro Zeit/Fläche/Volumen
    + Parameter $lambda$ = erwartete Anzahl
    + $P(X = k)$ mit PMF berechnen
    + Für Summen: einzeln addieren oder Tabelle nutzen
  ]


  #example[
    *Anrufe (120/Stunde = 2/Minute):*
    
    $lambda = 2$


    $ P(X = 0) = (2^0 dot e^(-2))/0! approx 0.135 $


    $ P(X = 1) = (2^1 dot e^(-2))/1! approx 0.271 $


    $ P(X <= 3) = sum_(k=0)^3 P(X = k) approx 0.857 $
  ]


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


    Prüfung: $200 dot 0.06 dot 0.94 = 11.28 >= 9$ ✓


    $ mu = 12, quad sigma = sqrt(11.28) approx 3.36 $


    Mit Stetigkeitskorrektur:


    $ P(9.5 <= Y <= 15.5) &= Phi((15.5 - 12)/3.36) - Phi((9.5 - 12)/3.36) \
                           &= Phi(1.04) - Phi(-0.74) \
                           &approx 0.85 - 0.23 = 0.62 $
  ]


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

]
