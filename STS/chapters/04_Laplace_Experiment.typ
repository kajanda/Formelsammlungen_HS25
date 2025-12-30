#import "../../style.typ": default_style, formula, example, steps, variables, math


= Laplace-Experiment

#variables[
  *Variablen:*
  
  $Omega$: Ergebnisraum (alle möglichen Ergebnisse) \
  $omega$: Einzelnes Ergebnis \
  $A$: Ereignis (Teilmenge von $Omega$) \
  $P(A)$: Wahrscheinlichkeit des Ereignisses $A$ \
  $|A|$: Anzahl der günstigen Ergebnisse \
  $|Omega|$: Anzahl aller möglichen Ergebnisse
]

#formula[
  *Definition Laplace-Experiment:*
  
  Ein Zufallsexperiment heisst Laplace-Experiment, wenn alle Ergebnisse *gleichwahrscheinlich* sind.
  
  #math[$ P(omega) = 1/(|Omega|) quad forall omega in Omega $]
  
  *Laplace-Wahrscheinlichkeit:*
  
  #math[$ P(A) = (|A|)/(|Omega|) = ("Anzahl günstige Ergebnisse")/("Anzahl mögliche Ergebnisse") $]
]

#steps[
  + Ergebnisraum $Omega$ bestimmen
  + Prüfen, ob alle Ergebnisse gleichwahrscheinlich sind
  + Anzahl günstiger Ergebnisse $|A|$ zählen
  + Anzahl möglicher Ergebnisse $|Omega|$ zählen
  + Wahrscheinlichkeit $P(A) = |A| / |Omega|$ berechnen
]

#example[
  *Würfelwurf:*
  
  $Omega = {1,2,3,4,5,6}$, $|Omega| = 6$ \
  Ereignis $A$: "Gerade Augenzahl" = ${2,4,6}$, $|A| = 3$ \
  $P(A) = 3/6 = 1/2$
  
  *Zwei Würfel:*
  
  $|Omega| = 6 dot 6 = 36$ (mit Reihenfolge) \
  Ereignis $A$: "Summe = 7" = ${(1,6), (2,5), (3,4), (4,3), (5,2), (6,1)}$ \
  $P(A) = 6/36 = 1/6$
]
