#import "../../style.typ": default_style, formula, example, steps, variables, math


  = Boxplot-Kennwerte

  #variables[
    *Neue Variablen:*
    
    $"IQR"$: Interquartilsabstand \
    Untere/obere Antenne: Bereich ohne Ausreißer
  ]

  #image("../assets/boxplot.png", width: 100%)


  #formula[
    *Interquartilsabstand (IQR):*
    
    #math[$ "IQR" = Q_3 - Q_1 $]
    
    *Antennen (Whisker):*
    - Untere: Minimum in $[Q_1 - 1.5 dot "IQR", Q_1]$
    - Obere: Maximum in $[Q_3, Q_3 + 1.5 dot "IQR"]$
    
    *Ausreißer:* Werte außerhalb $[Q_1 - 1.5 dot "IQR", Q_3 + 1.5 dot "IQR"]$
  ]


  #example[
    *Daten:* 5, 7, 8, 9, 10, 12, 15, 20, 22


    $ Q_1 = 8, quad "Median" = 10, quad Q_3 = 15 $


    $ "IQR" = 15 - 8 = 7 $


    *Whisker:*
    - Untere: $Q_1 - 1.5 dot "IQR" = 8 - 10.5 = -2.5$ → Min(Daten) = 5
    - Obere: $Q_3 + 1.5 dot "IQR" = 15 + 10.5 = 25.5$ → Max(Daten) = 22


    *Ergebnis:* Alle Werte in $[5, 22]$ → *keine Ausreißer*
  ]

