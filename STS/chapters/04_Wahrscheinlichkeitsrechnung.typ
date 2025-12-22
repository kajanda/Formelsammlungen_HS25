#import "../../style.typ": default_style, formula, example, steps, variables, math
#show: default_style

#align(center)[
  #text(size: 14pt, weight: "bold")[Wahrscheinlichkeitsrechnung]
]

#columns(3, gutter: 1.2em)[

  = Kombinatorik

  #variables[
    *Neue Variablen:*
    
    $n$: Größe der Grundmenge \
    $k$: Größe der Teilmenge
  ]

  #steps[
    + Art der Auswahl bestimmen (Variation/Kombination, mit/ohne Wiederholung)
    + Passende Formel aus Übersichtstabelle auswählen
    + Werte für $n$, $k$ einsetzen und berechnen
  ]
    
  #table(
    columns: 3,
    [*Art*], [*Mit Wiederholung*], [*Ohne Wiederholung*],
    [*Variation* (mit Reihenfolge)], [$n^k$], [$frac(n!, (n - k)!)$],
    [*Kombination* (ohne Reihenfolge)], [$binom(n + k - 1, k)$], [$binom(n, k)$]
  )

  #formula[
    *Permutation*:
    (alle Elemente, keine Wiederholung)

  #math[
    $ N = n! $
  ]

  → Es werden *alle $n$ Elemente* in *verschiedener Reihenfolge* angeordnet.

  *Permutation mit Wiederholungen*

  #math[
    $ N = frac(n!, n_1! n_2! dots n_r!) $
  ]
  $n_i$: Anzahl gleiche Elemente der i-ten Sorte (3 für T in TATTOO)

  → Es gibt *mehrere gleiche Elemente*,  
  z. B. bei Wörtern wie *„TATTOO"*
  ]

  #example[
    *Beispiel: TATTOO*
    
    Das Wort „TATTOO" hat 6 Buchstaben:
    - T kommt 3-mal vor
    - A kommt 1-mal vor
    - O kommt 2-mal vor
    
    $ N = frac(6!, 3! times 1! times 2!) = frac(720, 6 times 1 times 2) = frac(720, 12) = 60 $
    
    Es gibt also *60 verschiedene Anordnungen* des Wortes „TATTOO".
  ]

  === Wahrscheinlichkeit berechenen

  #formula[
    Obige Kombinatorikformeln können zur Berechnung von Wahrscheinlichkeiten verwendet werden.

    #math[
      $ P = frac(N_"günstig", N_"möglich") $
    ]
  ]

  == hypergeometrische Verteilung Anwendung

  Formel siehe unten bei Kontingenztabellen.

#example[
  *Aufgabe*

  Beim Rommé spielt man mit *110* Karten; *sechs* davon sind Joker.
  Zu Beginn eines Spiels erhält jeder Spieler genau *12* Karten.
  In wieviel Prozent aller möglichen Fälle sind darunter

  a) genau zwei bzw. b) mindestens ein Joker?

  *Lösung*

  a) $ (binom(6, 2) * binom(104, 10)) / binom(110, 12) approx 11.13% $

  b) $ 1 - binom(104, 12) / binom(110, 12) approx 50.85% $

]


  = Kontingenztabellen

  #variables[
    *Neue Variablen:*
    
    $n_(i j)$: absolute Häufigkeit in Zelle $(i, j)$ \
    $f_(i j)$: relative Häufigkeit in Zelle $(i, j)$ \
    Randsummen: Summen über Zeilen/Spalten
  ]

  #formula[
    *Kontingenztabelle* für Merkmale $A$, $B$:
    
    #table(
      columns: 4,
      [], [$B_1$], [$B_2$], [*Summe*],
      [$A_1$], [$n_(11)$], [$n_(12)$], [$n_(1 dot)$],
      [$A_2$], [$n_(21)$], [$n_(22)$], [$n_(2 dot)$],
      [*Summe*], [$n_(dot 1)$], [$n_(dot 2)$], [$n$]
    )
    
    *Randhäufigkeiten:*
    - Zeilen: $n_(i dot) = sum_j n_(i j)$
    - Spalten: $n_(dot j) = sum_i n_(i j)$
    
    *Relative Häufigkeiten:*
    
    #math[$ f_(i j) = n_(i j)/n $]
    
    *Bedingte Häufigkeit* ($A_i$ gegeben $B_j$):
    
    #math[$ f(A_i | B_j) = n_(i j)/n_(dot j) $]
  ]

  #steps[
    + Tabelle mit Zeilen (Merkmal $A$) und Spalten (Merkmal $B$) aufstellen
    + Absolute Häufigkeiten $n_(i j)$ eintragen
    + Randsummen berechnen
    + Relative/bedingte Häufigkeiten bei Bedarf berechnen
    + Visualisierung: Mosaikplot
  ]

  #example[
    *Zivilstand vs. Geschlecht (100 Personen):*

    #table(
      columns: 4,
      [], [*Männer*], [*Frauen*], [*Summe*],
      [*Ledig*], [25], [20], [45],
      [*Verheiratet*], [30], [25], [55],
      [*Summe*], [55], [45], [100]
    )

    $ f("Ledig" | "Mann") = 25/55 approx 0.45 $

    $ f("Frau" | "Verheiratet") = 25/55 approx 0.45 $
  ]

  = Scatterplot & Streudiagramm

  #variables[evaluieren ob irgendwo gebraucht ]


  *Verwendung:* Visualisierung zweier **metrischer** Merkmale
  
  *Interpretation:*
  - **Form**: linear, gekrümmt, mehrere Cluster
  - **Richtung**: positiv (steigend), negativ (fallend)
  - **Stärke**: eng um Kurve → stark, weit gestreut → schwach
  
  *Warnung:* Korrelation ≠ Kausalität (Scheinkorrelation möglich)

  #steps[
    + Wertepaare $(x_i, y_i)$ als Punkte in Koordinatensystem eintragen
    + Visuelle Inspektion: Form, Richtung, Stärke erkennen
    + Ausreißer identifizieren
    + Korrelationskoeffizient berechnen (Pearson oder Spearman)
    + Immer Scatterplot + Korrelationskoeffizient zusammen angeben!
  ]
 

  = Bedingte Wahrscheinlichkeit

  #variables[
    *Neue Variablen:*
    
    $A, B$: Ereignisse \
    $A_i$: Zerlegung des Ergebnisraums in Teilereignisse \
    $P(dot)$: Wahrscheinlichkeit eines Ereignisses
  ]

  #formula[
    *Definition:*
    
    #math[$ P(A | B) = (P(A sect B))/(P(B)), quad P(B) > 0 $]
    
    *Multiplikationssatz:*
    
    #math[$ P(A sect B) = P(B) dot P(A | B) $]
    
    *Satz von Bayes:*
    
    #math[$ P(A | B) = (P(A) dot P(B | A))/(P(B)) $]
    
    *Totale Wahrscheinlichkeit:*
    
    #math[$ P(B) = sum_i P(A_i) dot P(B | A_i) $]
  ]


  #steps[
    + Vierfeldertafel erstellen (Randsummen!)
    + Gegebene Wahrscheinlichkeiten eintragen
    + Formel $P(A|B) = P(A sect B) / P(B)$ anwenden
    + Bei Bayes: Totale Wahrscheinlichkeit im Nenner
  ]


  #example[
    *Raucher/Nichtraucher (1400 Personen):*
    
    #table(
      columns: 4,
      [], [*Raucher*], [*Nichtraucher*], [*Summe*],
      [*Frauen*], [100], [200], [300],
      [*Männer*], [400], [700], [1100],
      [*Summe*], [500], [900], [1400]
    )


    $ P("Raucherin" | "Frau") = 100/300 = 1/3 $


    $ P("Mann" | "Raucher") = 400/500 = 4/5 $
  ]


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


  #example[
    *Steckdosen (defekt):*
    
    Fabrik 1: $P(F_1) = 0.8$, $P(D|F_1) = 0.05$
    
    Fabrik 2: $P(F_2) = 0.2$, $P(D|F_2) = 0.1$


    *Totale Wahrscheinlichkeit (defekt):*
    
    $ P(D) = 0.8 dot 0.05 + 0.2 dot 0.1 = 0.06 $


    *Bayes (F1 gegeben defekt):*
    
    $ P(F_1 | D) = (0.8 dot 0.05)/0.06 = 2/3 $
  ]

]
