#import "../../style.typ": default_style, formula, example, steps, variables, math


= Diskreter Wahrscheinlichkeitsraum

#variables[
  *Variablen:*
  
  $Omega$: Ergebnisraum (endlich oder abzählbar unendlich) \
  $cal(A)$: Ereignisalgebra (Potenzmenge von $Omega$) \
  $P$: Wahrscheinlichkeitsmass \
  $omega_i$: Einzelne Ergebnisse
]

#formula[
  *Definition:*
  
  Ein diskreter Wahrscheinlichkeitsraum ist ein Tripel $(Omega, cal(A), P)$ mit:
  
  #math[$ Omega = {omega_1, omega_2, ...} quad "endlich oder abzählbar" $]
  
  *Kolmogorov-Axiome:*
  
  1. Nichtnegativität: #math[$ P(A) >= 0 quad forall A subset.eq Omega $]
  
  2. Normiertheit: #math[$ P(Omega) = 1 $]
  
  3. Additivität: #math[$ P(A union B) = P(A) + P(B) quad "falls" A sect B = emptyset $]
  
  *Wichtige Folgerungen:*
  
  #math[$ P(emptyset) = 0 $]
  #math[$ P(overline(A)) = 1 - P(A) $]
  #math[$ P(A union B) = P(A) + P(B) - P(A sect B) $]
  #math[$ sum_(omega in Omega) P({omega}) = 1 $]
]

#steps[
  + Ergebnisraum $Omega$ definieren
  + Einzelwahrscheinlichkeiten $P({omega_i})$ festlegen
  + Prüfen: Summe aller Einzelwahrscheinlichkeiten = 1
  + Ereigniswahrscheinlichkeiten durch Addition berechnen
]

#example[
  *Unfairer Würfel:*
  
  $Omega = {1,2,3,4,5,6}$ \
  $P({1}) = 1/12$, $P({2}) = 1/12$, $P({3}) = 1/6$ \
  $P({4}) = 1/6$, $P({5}) = 1/4$, $P({6}) = 1/4$ \
  
  Prüfung: $1/12 + 1/12 + 1/6 + 1/6 + 1/4 + 1/4 = 1$ ✓
  
  $P("gerade") = P({2,4,6}) = 1/12 + 1/6 + 1/4 = 11/24$
]
