#import "../../style.typ": default_style, formula, example, steps, variables, math


= Rechnen mit Zufallsvariablen

#variables[
  *Variablen:*
  
  $X, Y$: Zufallsvariablen \
  $a, b, c$: Konstanten \
  $E(X)$: Erwartungswert von $X$ \
  $"Var"(X)$: Varianz von $X$ \
  $sigma_X$: Standardabweichung von $X$ \
  $"Cov"(X,Y)$: Kovarianz von $X$ und $Y$
]

#formula[
  *Erwartungswert:*
  
  #math[$ E(a X + b Y + c) = a E(X) + b E(Y) + c $]
  
  #math[$ E(X dot Y) = E(X) dot E(Y) quad "falls X, Y unabhängig" $]
  
  *Varianz:*
  
  #math[$ "Var"(a X + c) = a^2 "Var"(X) $]
  
  #math[$ "Var"(X + Y) = "Var"(X) + "Var"(Y) + 2 "Cov"(X,Y) $]
  
  #math[$ "Var"(X + Y) = "Var"(X) + "Var"(Y) quad "falls X, Y unabhängig" $]
  
  #math[$ "Var"(X - Y) = "Var"(X) + "Var"(Y) quad "falls X, Y unabhängig" $]
  
  *Standardabweichung:*
  
  #math[$ sigma_(a X + c) = |a| dot sigma_X $]
  
  #math[$ sigma_(X + Y) = sqrt("Var"(X) + "Var"(Y)) quad "falls X, Y unabhängig" $]
  
  *Kovarianz:*
  
  #math[$ "Cov"(X,Y) = E[(X - E(X))(Y - E(Y))] = E(X Y) - E(X)E(Y) $]
  
  #math[$ "Cov"(X,X) = "Var"(X) $]
  
  #math[$ "Cov"(X,Y) = 0 quad "falls X, Y unabhängig" $]
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
  
  $E(2X - 3Y + 7) = 2 dot 10 - 3 dot 5 + 7 = 12$
  
  $"Var"(2X - 3Y + 7) = 4 dot 4 + 9 dot 9 = 16 + 81 = 97$
  
  $sigma_(2X - 3Y + 7) = sqrt(97) approx 9.85$
]
