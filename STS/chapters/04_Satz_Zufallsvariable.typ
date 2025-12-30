#import "../../style.typ": default_style, formula, example, steps, variables, math


= Satz (Zufallsvariable, PMF, CDF)

#variables[
  *Variablen:*
  
  $X$: Zufallsvariable $X: Omega -> RR$ \
  $P M F$: Wahrscheinlichkeitsfunktion (Probability Mass Function) \
  $C D F$: Verteilungsfunktion (Cumulative Distribution Function) \
  $F(x)$: Verteilungsfunktion an Stelle $x$ \
  $a^-$: Grenzwert von $F(x)$ für $x$ gegen $a$ von links
]

#formula[
  Gegeben sind ein diskreter Wahrscheinlichkeitsraum $(Omega, P)$ sowie eine Zufallsvariable $X: Omega -> RR$. Dann haben $P M F$ und $C D F$ folgende Eigenschaften:
  
  (1) $sum_(x = -infinity)^infinity f(x) = 1$ und $F(z) = sum_(x = -infinity)^z f(x)$
  
  (2) $lim_(x -> -infinity) F(x) = 0$ und $lim_(x -> infinity) F(x) = 1$
  
  (3) Monotonie: Aus $x <= y$ folgt $F(x) <= F(y)$
  
  (4) $f(x) = F(x) - lim_(y -> x^-) F(y)$
  
  (5) $P(a < X <= b) = F(b) - F(a)$ und $P(a <= X <= b) = F(b) - lim_(y -> a^-) F(x)$
  
  (6) $P(X > b) = 1 - F(b)$ und $P(X >= b) = 1 - lim_(y -> b^-) F(x)$
]

#steps[
  + PMF bestimmen: Wahrscheinlichkeiten für alle möglichen Werte
  + CDF berechnen: Kumulative Summe der PMF
  + Monotonie prüfen: CDF muss monoton steigend sein
  + Grenzwerte: $lim_(x -> -infinity) F(x) = 0$ und $lim_(x -> infinity) F(x) = 1$
  + Für Intervalle: Differenz der CDF-Werte berechnen
]

#example[
  *Würfel:* $X in {1,2,3,4,5,6}$ mit $P(X = i) = 1/6$
  
  *PMF:* $f(i) = 1/6$ für $i in {1,2,3,4,5,6}$
  
  *CDF:* $F(x) = cases(
    0 &"für" x < 1,
    1/6 &"für" 1 <= x < 2,
    2/6 &"für" 2 <= x < 3,
    3/6 &"für" 3 <= x < 4,
    4/6 &"für" 4 <= x < 5,
    5/6 &"für" 5 <= x < 6,
    1 &"für" x >= 6
  )$
  
#image("/assets/cdf_plot.png")

  *Punkt (5) - Intervallwahrscheinlichkeiten:*
  
  $P(2 < X <= 5) = F(5) - F(2) = 5/6 - 2/6 = 3/6 = 1/2$
  
  $P(2 <= X <= 5) = F(5) - lim_(y -> 2^-) F(y) = 5/6 - 1/6 = 4/6 = 2/3$
  
  $P(3 < X <= 4) = F(4) - F(3) = 4/6 - 3/6 = 1/6$
  
  $P(3 <= X <= 4) = F(4) - lim_(y -> 3^-) F(y) = 4/6 - 2/6 = 2/6 = 1/3$
]

