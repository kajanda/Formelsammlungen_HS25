#import "../../style.typ": default_style, formula, example, steps, variables, math


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

