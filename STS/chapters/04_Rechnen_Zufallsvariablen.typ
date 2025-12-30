#import "../../style.typ": default_style, formula, example, steps, variables, math, remark


= Rechnen mit Zufallsvariablen

#variables[
  *Variablen:*
  
  $X, Y$: Zufallsvariablen \
  $E(X)$: Erwartungswert von $X$ \
  $"Var"(X)$: Varianz von $X$ \
  $sigma_X$: Standardabweichung von $X$
]

== Allgemeine Rechenregeln

#formula[
  Gegeben sind ein diskreter Wahrscheinlichkeitsraum $(Omega, P)$ sowie eine Zufallsvariable $X: Omega -> RR$. Dann haben die Kenngrössen von $X$ folgende Eigenschaften:
  
  (1) *Linearität des Erwartungswertes:*
  
  #math[$ E(X + Y) = E(X) + E(Y) "und" E(alpha X) = alpha E(X), "mit" alpha in RR. $]
  
  (2) *Verschiebungssatz für die Varianz:*
  
  #math[$ V(X) = E(X^2) - (E(X))^2 = (sum_(x in RR) P(X = x) dot x^2) - E(X)^2 $]
  
  (3) *Varianz bei linearer Transformation:*
  
  #math[$ V(alpha X + beta) = alpha^2 dot V(X) "mit" alpha, beta in RR. $]
]

== Stochastische Unabhängigkeit (Ereignisse)
#remark[
Wir betrachten einen diskreten Wahrscheinlichkeitsraum $(Omega, P)$ und zwei Ereignisse $A$ , $B subset.eq Omega$.

Folgende Eigenschaften sind äquivalent:

(i) $A$ und $B$ sind stochastisch unabhängig.

(ii) $A$ und $Omega \\ B$ sind stochastisch unabhängig.

(iii) $Omega \\ A$ und $Omega \\ B$ sind stochastisch unabhängig.
]

#formula[
  *Zwei Ereignisse $A$ und $B$ heissen stochastisch unabhängig, falls*
  
  #math[$ P(A sect B) = P(A) dot P(B) $]
  
  *Zwei Zufallsvariablen $X: Omega -> RR$ und $Y: Omega -> RR$ heissen stochastisch unabhängig, falls*
  
  #math[$ P(X = x, Y = y) = P(X = x) dot P(Y = y), quad "für alle" x, y in RR $]
]

== Rechenregeln

#formula[
  *Für stochastisch unabhängige Zufallsvariablen $X$ und $Y$ gilt*
  
  #math[$ E(X dot Y) = E(X) dot E(Y)\ quad V(X + Y) = V(X) + V(Y)\
  V(a dot X) = a^2 V(X) \ sigma_(X + Y) = sqrt("Var"(X) + "Var"(Y)) quad  $]
]


#formula[
  *Für $n$ unabhängige, identisch verteilte Zufallsvariablen $X_1, ..., X_n$:*
  
  Summe: #math[$ S = sum_(i=1)^n X_i $]
  
  Mittelwert: #math[$ overline(X) = 1/n sum_(i=1)^n X_i $]
  
  *Erwartungswerte:*
  
  #math[$ E(S) = n dot E(X), E(overline(X)) = E(X)  $]
  
  *Varianzen:*
  
  #math[$ "Var"(S) = n dot "Var"(X), "Var"(overline(X)) = ("Var"(X))/n $]
  
  *Standardabweichungen:*
  
  #math[$ sigma_S = sqrt(n) dot sigma_X , sigma_(overline(X)) = sigma_X / sqrt(n)$]
]

#steps[
  Zeigen Stochastische Unabhängigkeit:
  
  + Berechnen von $P(A)$ und $P(B)$
  + Berechnen von $P(A sect B)$
  + Prüfen ob $P(A sect B) = P(A) dot P(B)$
]


#example[
  *Zeigen Stochastische Unabhängigkeit:*
  
  Gegeben: Faire Münze und fairer Würfel

  Ereignisse: $A$ = "Münze zeigt Kopf", $B$ = "Würfel zeigt eine 6"

  $ P(A) = 1/2 , P(B) = 1/6 $

  $ P(A sect B) = P("Kopf und 6") = 1/12 $

  $ P(A) dot P(B) = 1/2 dot 1/6 = 1/12 $

  → $A$ und $B$ sind stochastisch unabhängig
]

#steps[
  + Linearität des Erwartungswerts ausnutzen
  + Bei Varianz: Konstanten quadrieren, aus Summe ziehen
  + Unabhängigkeit prüfen für Vereinfachungen
  + Achtung: Konstanten verschwinden bei Varianz!
]


#example[
  *Gegeben:* $E(X) = 10$, $"Var"(X) = 4$, $E(Y) = 5$, $"Var"(Y) = 9$ \
  $X, Y$ unabhängig
  
  *Gesucht:* $E(2X - 3Y + 7)$, $"Var"(2X - 3Y + 7)$
  
  *Erwartungswert (Linearität):*
  
  $E(2X - 3Y + 7) = 2 E(X) - 3 E(Y) + 7 = 2 dot 10 - 3 dot 5 + 7 = 12$
  
  *Varianz (Konstanten quadrieren, + bei Summe und Differenz):*
  
  $"Var"(2X - 3Y + 7) = 2^2 "Var"(X) + (-3)^2 "Var"(Y) + 0$
  
  $= 4 dot 4 + 9 dot 9 = 16 + 81 = 97$
  
  *Standardabweichung:*
  
  $sigma_(2X - 3Y + 7) = sqrt(97) approx 9.85$
]
