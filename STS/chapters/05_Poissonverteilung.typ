#import "../../style.typ": default_style, formula, example, steps, variables, math


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

