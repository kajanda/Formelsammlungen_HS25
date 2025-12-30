#import "../../style.typ": default_style, formula, example, steps, variables, math


= Satz der Kenngrössen

#variables[
  *Variablen:*
  
  $X$: Zufallsvariable \
  $n$: Anzahl Versuche \
  $X_i$: i-te Zufallsvariable \
  $overline(X)$: Stichprobenmittel \
  $S^2$: Stichprobenvarianz
]

#formula[
  *Für $n$ unabhängige, identisch verteilte Zufallsvariablen $X_1, ..., X_n$:*
  
  Summe: #math[$ S = sum_(i=1)^n X_i $]
  
  Mittelwert: #math[$ overline(X) = 1/n sum_(i=1)^n X_i $]
  
  *Erwartungswerte:*
  
  #math[$ E(S) = n dot E(X) $]
  
  #math[$ E(overline(X)) = E(X) $]
  
  *Varianzen:*
  
  #math[$ "Var"(S) = n dot "Var"(X) $]
  
  #math[$ "Var"(overline(X)) = ("Var"(X))/n $]
  
  *Standardabweichungen:*
  
  #math[$ sigma_S = sqrt(n) dot sigma_X $]
  
  #math[$ sigma_(overline(X)) = sigma_X / sqrt(n) $]
]

#steps[
  + Identifizieren: Summe oder Mittelwert?
  + Anzahl $n$ bestimmen
  + Erwartungswert und Varianz der Einzelvariable ermitteln
  + Formeln anwenden (Faktor $n$ bei Summe, $1/n$ bzw. $1/sqrt(n)$ bei Mittelwert)
]

#example[
  *10 Würfelwürfe:*
  
  $X_i$: Augenzahl beim $i$-ten Wurf \
  $E(X_i) = 3.5$, $"Var"(X_i) = 35/12 approx 2.917$ \
  $S = X_1 + ... + X_10$ (Gesamtsumme)
  
  $E(S) = 10 dot 3.5 = 35$
  
  $"Var"(S) = 10 dot 35/12 = 350/12 approx 29.17$
  
  $sigma_S = sqrt(10) dot sqrt(35/12) approx 5.40$
  
  *Mittelwert:* $overline(X) = S/10$
  
  $E(overline(X)) = 3.5$
  
  $"Var"(overline(X)) = (35/12)/10 = 35/120 approx 0.292$
  
  $sigma_(overline(X)) = sqrt(35/12) / sqrt(10) approx 0.54$
]
