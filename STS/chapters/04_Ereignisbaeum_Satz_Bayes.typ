#import "../../style.typ": default_style, formula, example, steps, variables, math


  = Ereignisbäume & Satz von Bayes

  #variables[
    *Neue Begriffe:*
    
    *Pfadwahrscheinlichkeit*: Produkt der Kantenwahrscheinlichkeiten 
  ]

  #steps[
    + Ereignisbaum zeichnen mit allen Verzweigungen
    + Pfadwahrscheinlichkeit = Produkt entlang Pfad
    + Totale Wahrscheinlichkeit = Summe aller Pfade zum Ereignis
    + Bayes: $P(A|B) = ("Pfad zu A und B")/("Alle Pfade zu B")$
  ]
#image("../assets/image-4.png", width: 100%)

  #example[
    #image("../assets/image-5.png")
    *Steckdosen (defekt):*
    
    Fabrik 1: $P(F_1) = 0.8$, $P(D|F_1) = 0.05$
    
    Fabrik 2: $P(F_2) = 0.2$, $P(D|F_2) = 0.1$
    

    *Totale Wahrscheinlichkeit (defekt):*
    
    $ P(D) = 0.8 dot 0.05 + 0.2 dot 0.1 = 0.06 $


    *Nicht fehlerhaft und aus F1:*
    
    
    $ P(F_1 sect overline(D)) = P(F_1) dot P(overline(D)|F_1) = 0.8 dot 0.95 = 0.76 $

    *F1 oder fehlerhaft:*
    
    $ P(F_1 union D) = P(F_1 sect overline(D)) + P(D) = 0.76 + 0.06 = 0.82 $

    *Bayes (F1 gegeben defekt):*
    
    $ P(F_1 | D) = (P(F_1) dot P(D|F_1))/P(D) = (0.8 dot 0.05)/0.06 = 2/3 $

    *Bayes (F2 gegeben defekt):*
    
    $ P(F_2 | D) = 1 - P(F_1|D) = 1 - 2/3 = 1/3 $
  ]

