#set document(title: "Stochastik_Zusammenfassung", author: "Jan Kaiser (kaiseja1)")
#set page(
  paper: "a4",
  flipped: true,
  margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm),
  footer: [
    #set align(right)
    kaiseja1
  ],
)
#set text(size: 8.5pt)
#set heading(numbering: "1.1")


#let formula(body) = block(
  inset: 4pt,
  radius: 3pt,
  fill: rgb("#e9f5ee"),
  stroke: (paint: rgb("#8bc5a3"), thickness: 0.5pt),
)[
  #body
]

#let math(body) = block(
  inset: 4pt,
  radius: 3pt,
  fill: rgb("#c8e6d0"),
  stroke: (paint: rgb("#6ba885"), thickness: 0.5pt),  // darker border
)[
  #body
]


#let example(body) = block(
  inset: 4pt,
  radius: 3pt,
  fill: rgb("#f0f4ff"),
  stroke: (paint: rgb("#a3b8e8"), thickness: 0.5pt),
)[
  #body
]


#let steps(body) = block(
  inset: 4pt,
  radius: 3pt,
  fill: rgb("#fff8e1"),
  stroke: (paint: rgb("#ffb74d"), thickness: 0.5pt),
)[
  #body
]


// NEU: Block für Variablen mit rotem Hintergrund
#let variables(body) = block(
  inset: 4pt,
  radius: 3pt,
  fill: rgb("#ffe6e6"),
  stroke: (paint: rgb("#ff6b6b"), thickness: 0.5pt),
)[
  #body
]


#align(center)[
  #text(size: 14pt, weight: "bold")[
    STS - Zusammenfassung
  ]
  #v(0.3em)
  #text(size: 11pt)[
    Stochastik & Statistik · Zusammenfassung
  ]
]


#v(1em)


#columns(
  3,
  gutter: 1.2em,
)[
  = Grundbegriffe

  #variables[
    *Häufig gebrauchte Variablen:*
    
    $x$: Merkmal / Beobachtung \
    $a_i$: Merkmalsausprägung (Wertklasse) \
    $h_i$: absolute Häufigkeit von $a_i$ \
    $f_i$: relative Häufigkeit von $a_i$ \
    $H_i$: kumulierte absolute Häufigkeit \
    $F_i$: kumulierte relative Häufigkeit \
    $overline(x)$: arithmetisches Mittel \
    $x_"med"$: Median (2. Quantil) \
    $x_"mod"$: Modalwert (häufigster Wert) \
    $s^2$: Varianz, $s_x$: Standardabweichung \
    $s_"korr"$: korrigierte Standardabweichung \
    $f(x)$: PMF/PDF, $F(x)$: CMF/CDF
  ]

  #formula[
    *PMF:* $f(x)$ Relative Häufigkeit (Stabdiagramm)
    
    *CMF:* $F(x)$ Kumulative relative Häufigkeit (Treppendiagramm)
    
    *PDF:* $f(x)$ Höhe Balken Histogramm
    
    *CDF:* $F(x)$ Kumultative Fläche Balken Histogramm
  ]


  = Diagramtypen
  == PMF
  $f(x)$ Relative Häufigkeit (Stabdiagramm)
  #image("assets/PMF.png", width: 100%)


  == CMF
  $F(x)$ Kumulative relative Häufigkeit (Treppendiagramm)
  #image("assets/CMF.png", width: 100%)


  == PDF
  $f(x)$ Höhe Balken Histogramm
  #image("assets/PDF.png", width: 100%)


  == CDF
  $F(x)$ Kumultative Fläche Balken Histogramm
  #image("assets/CDF.png", width: 90%)


  // ============================================================
  // 1. DESKRIPTIVE STATISTIK (UNIVARIAT)
  // ============================================================


  = Häufigkeiten und Verteilungen

  #variables[
    *Neue Variablen in diesem Abschnitt:*
    
    $n$: Stichprobengröße (Anzahl Beobachtungen)
  ]

  #steps[
    + Urliste sortieren
    + Verschiedene Werte $a_i$ bestimmen
    + Absolute Häufigkeit: $h_i$ = Anzahl von $a_i$
    + Relative Häufigkeit: $f_i = h_i / n$
    + Kumulative Häufigkeit:
      - $H_i = sum_(k <= i) h_k$
      - $F_i = sum_(k <= i) f_k$
  ]


  #example[
    *Würfeln (20 Würfe):*
    
    #table(
      columns: 7,
      [$a_i$], [1], [2], [3], [4], [5], [6],
      [$h_i$], [4], [3], [4], [0], [6], [3],
      [$f_i$], [0.2], [0.15], [0.2], [0], [0.3], [0.15],
      [$F_i$], [0.2], [0.35], [0.55], [0.55], [0.85], [1.0],
      [$H_i$], [4], [7], [11], [11], [17], [20]
    )


    PMF: $h_i / 20$ , PDF: $h_i / (20)$ , CDF: $F_i$, CMF: $H_i$
  ]


  = Median und Quantile

  #variables[
    *Neue Variablen:*
    
    $q$: Quantilsniveau (z.B. 0.25, 0.5, 0.75) \
    $Q_q$: zugehöriges $q$-Quantil \
    $p$: Positionsindex in der sortierten Liste
  ]

  #formula[
    *q-Quantil* $Q_q$:
    
    Position: $p = n dot q$
    
    *Falls* $p$ *ganzzahlig:*
    
    #math[$ Q_q = 1/2 (x_((p)) + x_((p+1))) $]
    
    *Falls* $p$ *nicht ganzzahlig:*
    
    #math[$ Q_q = x_((ceil(p))) $]
    
    *Spezialfälle:*
    - Median: $q = 0.5$
    - 1. Quartil (Q1): $q = 0.25$
    - 3. Quartil (Q3): $q = 0.75$
  ]
  == Quartil aus CDF ablesen
  #image("assets/CDF_quartil.png", width: 80%)

  #image("assets/image.png", width: 80%)

  #steps[
    + Daten sortieren: $x_((1)) <= x_((2)) <= dots <= x_((n))$
    + Position berechnen: $p = n dot q$
    + Falls $p$ ganzzahlig → $Q_q = 1/2(x_((p)) + x_((p+1)))$
    + Falls nicht → $k = ceil(p)$, dann $Q_q = x_((k))$
  ]


  #example[
    *Stichprobe:* 4, 4, 0, 3, 5, 3, 1
    
    *Sortiert:* 0, 1, 3, 3, 4, 4, 5 ($n = 7$)


    *Q1:* $p = 7 dot 0.25 = 1.75$ → $k = 2$ → $Q_1 = 1$


    *Median:* $p = 7 dot 0.5 = 3.5$ → $k = 4$ → $Q_2 = 3$


    *Q3:* $p = 7 dot 0.75 = 5.25$ → $k = 6$ → $Q_3 = 4$
  ]

= Klassierte Daten
== Grundbegriffe

#image("assets/Grundbegriffe_Klassierte_Daten_Beispiel.jpeg", width: 100%)

- *Mittelwert*:
  #math[$ overline(x) = (1/n) sum_(i=1)^k m_i dot h_i $]
  $m_i$: Klassenmitte der i-ten Klasse(Mittelwert der Klassengrenzen)\
  $h_i$: absolute Häufigkeit der i-ten Klasse

- *Varianz*:
  #math[$ s^2 = (1/n) sum_(i=1)^k (h_i dot m_i^2) - overline(x)^2 $]

#image("assets/Klassierte_Daten_Mittelwert_Beispiel.jpeg", width: 90%)

#image("assets/Klassierte_Daten_Varianz_Beispiel.jpeg", width: 90%)
== Quantile bei klassierten Daten

  #variables[
    *Neue Variablen:*
    
    $a_(k-1), a_k$: Klassenunter-/obergrenze \
    $F(a_k)$: CDF an rechter Klassengrenze
  ]

  #formula[
    Gegeben: Klasse $[a_(k-1), a_k]$ mit $F(a_(k-1)) < q <= F(a_k)$
    
    *Lineare Interpolation:*
    
    #math[$ Q_q = a_(k-1) + (a_k - a_(k-1))/(F(a_k) - F(a_(k-1))) dot (q - F(a_(k-1))) $]
  ]


  #steps[
    + Kumulierte Verteilung $F(a_k)$ aus Tabelle ablesen
    + Klasse finden, in der $F(a_(k-1)) < q <= F(a_k)$
    + Formel anwenden (lineare Interpolation)
  ]


  #example[
    *Mieten (0.7351-Quantil):*
    
    Klasse 1000–1500: $F(1000) = 0.47$, $F(1500) = 0.775$


    $ Q_(0.7351) &= 1000 + (1500 - 1000)/(0.775 - 0.47) dot (0.7351 - 0.47) \
                  &= 1000 + 500/0.305 dot 0.2651 \
                  &approx 1434.78 $
  ]



  = Boxplot-Kennwerte

  #variables[
    *Neue Variablen:*
    
    $"IQR"$: Interquartilsabstand \
    Untere/obere Antenne: Bereich ohne Ausreißer
  ]

  #image("assets/boxplot.png", width: 100%)


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


    *Ergebnis:* Alle Werte in $[5, 22]$ → **keine Ausreißer**
  ]


  = Mittelwert und Varianz

  #variables[
    *Neue Variablen:*
    
    $s$: Standardabweichung \
    $s_"korr"$: korrigierte Standardabweichung
  ]

  #formula[
    *Arithmetischer Mittelwert:*
    
    #math[$ overline(x) = 1/n sum_(i=1)^n x_i $]
    
    *Empirische Varianz:*
    
    #math[$ s^2 = 1/n sum_(i=1)^n (x_i - overline(x))^2 $]
    
    *Verschiebungssatz:*
    
    #math[$ s^2 = overline(x^2) - overline(x)^2 = (1/n sum_(i=1)^n x_i^2 ) - overline(x)^2 $] 
    
    *Standardabweichung:*
    
    #math[$ s = sqrt(s^2) $]
    
    *Korrigierte Varianz:*
    
    #math[$ s_"korr"^2 = n/(n-1) dot s^2 $]
  ]


  #steps[
    + Mittelwert $overline(x)$ berechnen
    + Varianz entweder direkt oder mit Verschiebungssatz
    + Standardabweichung: $s = sqrt(s^2)$
    + Für Schätzungen: korrigierte Varianz verwenden
  ]


  #example[
    *Gewinnspiel (100 Spiele):*
    
    #table(
      columns: 7,
      [Gewinn], [-1], [0], [4], [8], [10], [20],
      [$h_i$], [74], [13], [3], [5], [4], [1]
    )


    $ overline(x) &= 1/100(-1 dot 74 + 0 dot 13 + 4 dot 3 + 8 dot 5 + 10 dot 4 + 20 dot 1) \
                  &= -0.38 "CHF" $


    $ s^2 &= 1/100(1 dot 74 + 0 + 16 dot 3 + 64 dot 5 + 100 dot 4 + 400 dot 1) - 0.38^2 \
          &= 12.28 "CHF"^2 $


    $ s = sqrt(12.28) approx 3.5 "CHF" $
  ]



// ... (bisheriger Code bleibt gleich bis "Lineare Regression")

  = Lineare Regression (KQM)

  #variables[
    *Neue Variablen:*
    
    $a$: Achsenabschnitt \
    $b$: Steigung der Regressionsgeraden \
    $R^2$: Bestimmtheitsmaß
  ]

  #formula[
    *Regressionsgerade:* $y = a + b x$
    
    *Steigung:*
    
    #math[$ b = (s_(x y))/(s_x^2) = r dot s_y/s_x $]
    
    *Achsenabschnitt:*
    
    #math[$ a = overline(y) - b dot overline(x) $]
    
    *Residualvarianz:*
    
    #math[$ s_"Res"^2 = s_y^2 - s_"xy"^2/s_"x"^2  $]
    
    *Bestimmtheitsmaß:*
    
    #math[$ R^2 = r^2 = ((s_(x y))/(s_x dot s_y))^2 $]

    *Korrelationskoeffizient:*
    #math[$ r = (s_(x y))/(s_x dot s_y) $]
  ]

  #steps[
    + Korrelationskoeffizient $r$ berechnen
    + Steigung: $b = s_(x y)\/s_x^2$
    + Achsenabschnitt: $a = overline(y) - b overline(x)$
    + Prüfung: Residuenplot (sollte unsystematisch streuen)
    + Güte: $R^2$ berechnen (Anteil erklärter Varianz)
  ]

  #example[
    *Größe-Gewicht (15 Personen):*

    $overline(x) = 173$ cm, $s_x = 6.047$ cm
    
    $overline(y) = 72.267$ kg, $s_y = 7.474$ kg
    
    $s_(x y) = 41.071$, $r = 0.898$

    $ b = 41.071/6.047^2 approx 1.123 $

    $ a = 72.267 - 1.123 dot 173 approx -122.02 $

    *Regressionsgerade:*
    
    $ y = -122.02 + 1.123 x $

    $ R^2 = 0.898^2 approx 0.806 $
    
    → 80.6% der Varianz erklärt
  ]

  // ============================================================
  // NEU: BIVARIATE STATISTIK
  // ============================================================

  = Bivariate Daten & Kovarianz

  #variables[
    *Neue Variablen:*
    
    $(x_i, y_i)$: Wertepaare zweier Merkmale \
    $s_(x y)$: empirische Kovarianz \
    $overline(x y)$: Mittelwert der Produkte
  ]

  #formula[
    *Empirische Kovarianz:*
    
    #math[$ s_(x y) = 1/n sum_(i=1)^n (x_i - overline(x))(y_i - overline(y)) $]
    
    *Verschiebungssatz:*
    
    #math[$ s_(x y) = overline(x y) - overline(x) dot overline(y) $]
    
    wobei:
    
    #math[$ overline(x y) = 1/n sum_(i=1)^n x_i y_i $]
    
    *Korrigierte Kovarianz:*
    
    #math[$ s_(x y\,"korr") = n/(n-1) dot s_(x y) $]
    
    *Interpretation:*
    - $s_(x y) > 0$: positiver Zusammenhang
    - $s_(x y) approx 0$: kein linearer Zusammenhang
    - $s_(x y) < 0$: negativer Zusammenhang
  ]

  #steps[
    + Mittelwerte $overline(x)$, $overline(y)$ berechnen
    + Produkte $x_i y_i$ bilden
    + Verschiebungssatz anwenden: $s_(x y) = overline(x y) - overline(x) overline(y)$
    + Interpretation: Vorzeichen gibt Richtung des Zusammenhangs
  ]

  #example[
    *Stichprobe:* $x = [1, 2, 3]$, $y = [4, -1, 2]$

    $ overline(x) = 2, quad overline(y) = 5/3 $

    $ overline(x y) = 1/3(1 dot 4 + 2 dot (-1) + 3 dot 2) = 8/3 $

    $ s_(x y) = 8/3 - 2 dot 5/3 = -2/3 $

    Negativer Wert → negativer Zusammenhang
  ]

  = Spearman-Rangkorrelation

  #variables[
    *Neue Variablen:*
    
    $"rg"(x_i)$: Rang von $x_i$ in sortierter Liste \
    $r_"Sp"$: Spearman-Korrelationskoeffizient \
    $d_i$: Differenz der Ränge
  ]

  #formula[
    *Definition (allgemein):*
    
    #math[$ r_"Sp" = (sum_(i=1)^n ("rg"(x_i) - overline("rg"(x)))("rg"(y_i) - overline("rg"(y))))/(sqrt(sum_(i=1)^n ("rg"(x_i) - overline("rg"(x)))^2) dot sqrt(sum_(i=1)^n ("rg"(y_i) - overline("rg"(y)))^2)) $]
    
    *Vereinfachte Formel* (keine gleichen Ränge):
    
    #math[$ r_"Sp" = 1 - (6 sum_(i=1)^n d_i^2)/(n(n^2 - 1)) $]
    
    wobei $d_i = "rg"(x_i) - "rg"(y_i)$
    
    *Interpretation:*
    - Misst **monotonen** (nicht nur linearen) Zusammenhang
    - Robust gegen Ausreißer
    - Werte: $-1 <= r_"Sp" <= 1$
  ]

  #steps[
    + Ränge für $x$ und $y$ separat vergeben (1 = kleinster Wert)
    + Bei gleichen Werten: Durchschnittsrang vergeben
    + Rangdifferenzen $d_i$ berechnen
    + Formel anwenden (vereinfacht falls keine Bindungen)
    + Interpretation wie bei Pearson
  ]

  #example[
    *Alter vs. Laufzeit (6 Personen):*

    #table(
      columns: 5,
      [$i$], [$x_i$], [$y_i$], [$"rg"(x_i)$], [$"rg"(y_i)$],
      [1], [59], [14.6], [6], [6],
      [2], [35], [11.8], [3], [2],
      [3], [43], [14.3], [5], [5],
      [4], [23], [13.0], [1], [3],
      [5], [42], [14.2], [4], [4],
      [6], [27], [11.0], [2], [1]
    )

    $ sum d_i^2 = 0 + 1 + 0 + 4 + 0 + 1 = 6 $

    $ r_"Sp" = 1 - (6 dot 6)/(6(36 - 1)) = 1 - 36/210 approx 0.83 $

    Starker positiver monotoner Zusammenhang
  ]

    = Korrelation nach Bravais-Pearson

  #variables[
    *Neue Variablen:*
    
    $y$: zweite Variable \
    $s_x, s_y$: Standardabweichungen von $x$, $y$ \
    $s_(x y)$: Kovarianz von $x$, $y$ \
    $r$: Korrelationskoeffizient
  ]

  #formula[
    *Korrelationskoeffizient:*
    
    #math[$ r = (s_(x y))/(s_x dot s_y) $]
    
    wobei:
    
    #math[$ s_(x y) = 1/n sum_(i=1)^n (x_i - overline(x))(y_i - overline(y)) $]
    
    *Interpretation:*
    - $r approx 1$: starker positiver Zusammenhang
    - $r approx 0$: kein linearer Zusammenhang
    - $r approx -1$: starker negativer Zusammenhang
    
    *Bestimmtheitsmaß:* $r^2$ = Anteil erklärter Varianz
  ]


  #steps[
    + Mittelwerte $overline(x)$, $overline(y)$ berechnen
    + Standardabweichungen $s_x$, $s_y$ berechnen
    + Kovarianz $s_(x y)$ berechnen
    + Korrelationskoeffizient: $r = s_(x y)\/(s_x s_y)$
  ]

  #example[
    *Beispiel: Berechnung des Bravais-Pearson Korrelationskoeffizienten*
    
    Gegeben sind folgende Wertepaare $(x_i, y_i)$:
    
    #table(
      columns: 9,
      align: center,
      [*i*], [1], [2], [3], [4], [5], [6], [7], [8],
      [$x_i$], [5], [10], [20], [8], [4], [6], [12], [15],
      [$y_i$], [27], [46], [73], [40], [30], [28], [47], [59]
    )
    
    *(1) Mittelwerte berechnen:* $overline(x) = 10$, $overline(y) = 43.75$
    
    #table(
      columns: 9,
      align: center,
      [$x^2$], [25], [100], [400], [64], [16], [36], [144], [225],
      [$y^2$], [729], [2116], [5329], [1600], [900], [784], [2209], [3481],
      [$x_i y_i$], [135], [460], [1460], [320], [120], [168], [564], [885]
    )
    
    $sum x_i^2 = 1010$, $sum y_i^2 = 17148$, $sum x_i y_i = 4112$
    
    *(2) Standardabweichungen berechnen:*
    
    $s_x = sqrt(1/n sum x_i^2 - (overline(x))^2) = sqrt(126.25 - 100) = sqrt(26.25) = 5.12$
    
    $s_y = sqrt(1/n sum y_i^2 - (overline(y))^2) = sqrt(2143.5 - 1914.06) = 15.15$
    
    *(3) Kovarianz berechnen:*
    
    $s_(x y) = 1/8 sum x_i y_i - overline(x) dot overline(y) = 514 - 10 dot 43.75 = 76.5$
    
    *(4) Korrelationskoeffizient berechnen:*
    
    $r = s_(x y) / (s_x dot s_y) = 76.5 / (5.12 dot 15.15) approx 0.986$
    
    → *Starker positiver linearer Zusammenhang* zwischen $x$ und $y$
  ]


== Kombinatorik

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
  = Aufgabe

  Beim Rommé spielt man mit *110* Karten; *sechs* davon sind Joker.
  Zu Beginn eines Spiels erhält jeder Spieler genau *12* Karten.
  In wieviel Prozent aller möglichen Fälle sind darunter

  a) genau zwei bzw. b) mindestens ein Joker?

  == Lösung

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
 

  // ============================================================
  // 7. WICHTIGE KENNWERTE & ÜBERSICHT
  // ============================================================

  = Übersichtstabelle Verteilungen

  #table(
    columns: 4,
    [*Verteilung*], [*PMF/PDF*], [*E(X)*], [*Var(X)*],
    
    [Bernoulli], [$p^x (1-p)^(1-x)$], [$p$], [$p(1-p)$],
    
    [Binomial], [$binom(n,k) p^k (1-p)^(n-k)$], [$n p$], [$n p(1-p)$],
    
    [Poisson], [$(lambda^k e^(-lambda))/k!$], [$lambda$], [$lambda$],
    
    [Hypergeom.], [$(binom(M,k) binom(N-M,n-k))/binom(N,n)$], [$n M/N$], [$dots$],
    
    [Normal], [$1/(sqrt(2pi)sigma) e^(-(x-mu)^2\/(2sigma^2))$], [$mu$], [$sigma^2$]
  )

  = Wichtige Quantile

  #variables[
    *Neue Begriffe:*
    
    $z_p$: p-Quantil der Standardnormalverteilung \
    $t_("df"\; p)$: p-Quantil der t-Verteilung mit df Freiheitsgraden
  ]

  #table(
    columns: 3,
    [*Niveau*], [*z-Wert*], [*Verwendung*],
    [90%], [1.645], [Normalvert.],
    [95%], [1.960], [Normalvert.],
    [99%], [2.576], [Normalvert.],
    [95% (n=7)], [2.365], [t-Vert. (df=7)],
    [95% (n=10)], [2.262], [t-Vert. (df=9)]
  )



  // ============================================================
  // 2. WAHRSCHEINLICHKEITSRECHNUNG
  // ============================================================


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


  // ============================================================
  // 3. DISKRETE VERTEILUNGEN
  // ============================================================


  = Binomialverteilung

  #variables[
    *Neue Variablen:*
    
    $n$: Anzahl Versuche \
    $p$: Erfolgswahrscheinlichkeit pro Versuch \
    $k$: Anzahl Erfolge
  ]

  #formula[
    *Notation:* $X tilde B(n, p)$
    
    *Dichtefunktion (PMF):*
    
    #math[$ P(X = k) = binom(n, k) dot p^k dot (1-p)^(n-k) $]
    
    *Erwartungswert:*
    
    #math[$ E(X) = n dot p $]
    
    *Varianz:*
    
    #math[$ "Var"(X) = n dot p dot (1-p) $]
    
    *Standardabweichung:*
    
    #math[$ sigma = sqrt(n dot p dot (1-p)) $]
  ]


  #steps[
    + Prüfen: $n$ Wiederholungen, konstantes $p$, unabhängig?
    + Parameter $n$, $p$ festlegen
    + $P(X = k)$ mit PMF-Formel berechnen
    + Für Intervalle: CDF nutzen oder summieren
  ]


  #example[
    *12× Würfeln, X = Anzahl Sechsen*


    $n = 12$, $p = 1/6$


    $ P(X = 3) = binom(12, 3) dot (1/6)^3 dot (5/6)^9 approx 0.1974 $


    $ P(X <= 3) = sum_(k=0)^3 P(X = k) approx 0.8748 $


    $ E(X) = 12 dot 1/6 = 2 $


    $ "Var"(X) = 12 dot 1/6 dot 5/6 = 5/3 $
  ]


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


  = Hypergeometrische Verteilung

  #variables[
    *Neue Variablen:*
    
    $N$: Gesamtzahl Objekte \
    $M$: Anzahl Merkmalträger in Grundgesamtheit \
    $n$: Stichprobengröße \
    $k$: Merkmalsträger in Stichprobe
  ]

  #formula[
    *Ziehen ohne Zurücklegen:*
    
    #math[$ P(X = k) = (binom(M, k) dot binom(N-M, n-k))/binom(N, n) $]
    
    *Erwartungswert:*
    
    #math[$ E(X) = n dot M/N $]
    
    *Varianz:*
    
    #math[$ "Var"(X) = n dot M/N dot (1 - M/N) dot (N-n)/(N-1) $]
  ]


  #steps[
    + Modell: Ziehen ohne Zurücklegen aus endlicher Grundgesamtheit
    + Parameter $N$, $M$, $n$ bestimmen
    + $P(X = k)$ mit Binomialkoeffizienten berechnen
    + Bei großem $N$: Approximation durch Binomialverteilung
  ]


  #example[
    *Lotto 6 aus 49:*
    
    $N = 49$, $M = 6$, $n = 6$


    $ P(X >= 4) &= sum_(k=4)^6 (binom(6, k) dot binom(43, 6-k))/binom(49, 6) \
                 &approx 0.00099 $


    Etwa 1 von 1000 Tipps hat ≥ 4 Richtige.


    *Approximation durch Binomial:*
    
    Faustregel: $n/N <= 0.05$ → $B(n, M/N)$
  ]


  // ============================================================
  // 4. STETIGE VERTEILUNGEN
  // ============================================================


  = Normalverteilung

  #variables[
    *Neue Variablen:*
    
    $mu$: Erwartungswert der Normalverteilung \
    $sigma$: Standardabweichung \
    $Phi$: Verteilungsfunktion der Standardnormalverteilung
  ]

  #formula[
    *Notation:* $X tilde N(mu, sigma^2)$
    
    *Dichtefunktion (PDF):*
    
    #math[$ f(x) = 1/(sqrt(2 pi) sigma) dot e^(-(x - mu)^2 \/ (2 sigma^2)) $]
    
    *Standardisierung:*
    
    #math[$ Z = (X - mu)/sigma tilde N(0, 1) $]
    
    *Intervallwahrscheinlichkeit:*
    
    #math[$ P(a <= X <= b) = Phi((b - mu)/sigma) - Phi((a - mu)/sigma) $]
    
    *68-95-99.7-Regel:*
    - ca. 68% in $[mu - sigma, mu + sigma]$
    - ca. 95% in $[mu - 2sigma, mu + 2sigma]$
    - ca. 99.7% in $[mu - 3sigma, mu + 3sigma]$
  ]


  #steps[
    + Gegeben: $X tilde N(mu, sigma^2)$
    + Grenzen $a$, $b$ standardisieren: $z = (x - mu)/sigma$
    + Tabellenwerte $Phi(z_a)$, $Phi(z_b)$ ablesen
    + $P(a <= X <= b) = Phi(z_b) - Phi(z_a)$
  ]


  #example[
    *Gegeben:* $X tilde N(3, 4)$ → $mu = 3$, $sigma = 2$


    *Gesucht:* $P(1.26 <= X <= 5.12)$


    $ z_1 = (1.26 - 3)/2 = -0.87 $
    $ z_2 = (5.12 - 3)/2 = 1.06 $


    $ P(1.26 <= X <= 5.12) &= Phi(1.06) - Phi(-0.87) \
                            &= 0.8554 - (1 - 0.8078) \
                            &= 0.6632 $
  ]


  = Normalapproximation der Binomialverteilung

  #variables[
    *Neue Begriffe:*
    
    $Y$: approximierende Normalverteilung zu $X$ \
    Stetigkeitskorrektur: Anpassung um 0.5
  ]

  #formula[
    *Faustregel:* $n dot p dot (1-p) >= 9$
    
    *Approximation:*
    
    #math[$ B(n, p) approx N(n p, n p(1-p)) $]
    
    *Stetigkeitskorrektur:*
    
    #math[$ P(a <= X <= b) approx P(a - 0.5 <= Y <= b + 0.5) $]
    
    wobei $Y tilde N(n p, n p(1-p))$
  ]


  #steps[
    + Faustregel prüfen: $n p(1-p) >= 9$
    + Parameter berechnen: $mu = n p$, $sigma^2 = n p(1-p)$
    + Stetigkeitskorrektur anwenden (±0.5)
    + Mit Standardnormalverteilung rechnen
  ]


  #example[
    *200 Geräte, $p = 0.06$, $P(10 <= X <= 15)$*


    Prüfung: $200 dot 0.06 dot 0.94 = 11.28 >= 9$ ✓


    $ mu = 12, quad sigma = sqrt(11.28) approx 3.36 $


    Mit Stetigkeitskorrektur:


    $ P(9.5 <= Y <= 15.5) &= Phi((15.5 - 12)/3.36) - Phi((9.5 - 12)/3.36) \
                           &= Phi(1.04) - Phi(-0.74) \
                           &approx 0.85 - 0.23 = 0.62 $
  ]


  = Zentraler Grenzwertsatz

  #variables[
    *Neue Variablen:*
    
    $X_i$: i-te Zufallsvariable in Stichprobe \
    $overline(X)$: Stichprobenmittel \
    $n$: Stichprobengröße (hier als Zufallsvariablenzahl)
  ]

  #formula[
    *Aussage:* Summe/Mittelwert von i.i.d. Zufallsvariablen ist asymptotisch normalverteilt.
    
    Gegeben: $X_1, X_2, dots, X_n$ i.i.d. mit $E(X_i) = mu$, $"Var"(X_i) = sigma^2$
    
    #math[$ overline(X) = 1/n sum_(i=1)^n X_i $]
    
    *Für großes* $n$*:*
    
    #math[$ overline(X) tilde.dot N(mu, sigma^2/n) $]
    
    *Standardisiert:*
    
    #math[$ (overline(X) - mu)/(sigma/sqrt(n)) tilde.dot N(0, 1) $]
  ]


  #example[
    *Produktion (6 Arbeitsschritte):*
    
    Jeder Schritt: gleichverteilt in [1, 2] Stunden
    
    $ mu = 1.5, quad sigma^2 = 1/12 $


    Gesamtdauer $T = sum_(i=1)^6 X_i$:


    $ E(T) = 6 dot 1.5 = 9 $
    $ "Var"(T) = 6 dot 1/12 = 1/2 $
    $ sigma_T = 1/sqrt(2) approx 0.707 $


    $ P(T <= 10) approx Phi((10 - 9)/0.707) approx Phi(1.41) approx 0.92 $
  ]


  // ============================================================
  // 5. SCHLIESSENDE STATISTIK
  // ============================================================


  = Punktschätzungen

  #variables[
    *Neue Variablen:*
    
    $hat(theta)$: Schätzer für Parameter $theta$ \
    $hat(mu)$: Schätzer für Mittelwert \
    $hat(sigma)^2$: Schätzer für Varianz
  ]

  #formula[
    *Erwartungswert:*
    
    #math[$ hat(mu) = overline(X) = 1/n sum_(i=1)^n X_i $]
    
    *Varianz:*
    
    #math[$ hat(sigma)^2 = s^2 = 1/(n-1) sum_(i=1)^n (X_i - overline(X))^2 $]
    
    *Eigenschaften:*
    - *Erwartungstreu:* $E(hat(theta)) = theta$
    - *Konsistent:* $hat(theta) arrow.r theta$ für $n arrow.r infinity$
    - *Effizient:* minimale Varianz
  ]


  #steps[
    + Stichprobe $x_1, dots, x_n$ gegeben
    + Schätzer wählen (z.B. $overline(x)$ für $mu$)
    + Schätzwert berechnen
    + Eigenschaften prüfen (erwartungstreu, konsistent)
  ]


]
#pagebreak()

// Farben für die Vertrauensintervall-Tabelle
#let vi_farbe1 = rgb("#e8f5e9") // Grün - Normalverteilung σ bekannt
#let vi_farbe2 = rgb("#e3f2fd") // Blau - Normalverteilung σ unbekannt
#let vi_farbe3 = rgb("#fff3e0") // Orange - Chi-Quadrat
#let vi_farbe4 = rgb("#fce4ec") // Rosa - Bernoulli
#let vi_farbe5 = rgb("#f3e5f5") // Violett - beliebig n>30

#table(
  columns: 6,
  stroke: 0.5pt,
  
  // Header row
  [*(1) Verteilung Grundgesamtheit*],
  [*(2) Param.*],
  [*(3) Schätzfunktionen*],
  [*(4) standardisierte Zufallsvariable*],
  [*(5) Verteilung, benötigte Quantile*],
  [*(6) Intervallgrenzen*],
  
  // Row 1: Normalverteilung (Varianz bekannt) - GRÜN
  table.cell(fill: vi_farbe1)[Normalverteilung (Varianz $sigma^2$ bekannt)],
  table.cell(fill: vi_farbe1)[$mu$],
  table.cell(fill: vi_farbe1)[$overline(X) = 1/n sum_(i=1)^n X_i$],
  table.cell(fill: vi_farbe1)[$U = (overline(X) - mu)/(sigma\/sqrt(n))$],
  table.cell(fill: vi_farbe1)[*Standardnormalverteilung* (Tabelle 2) \ $c = u_p$ mit $p = (1+gamma)/2$],
  table.cell(fill: vi_farbe1)[$theta_u = overline(X) - c dot sigma/sqrt(n)$ \ $theta_o = overline(X) + c dot sigma/sqrt(n)$],
  
  // Row 2: Normalverteilung (Varianz unbekannt) - BLAU
  table.cell(fill: vi_farbe2)[Normalverteilung (Varianz $sigma^2$ unbekannt und $n <= 30$; sonst Fall 1 mit $s$ als Schätzwert für $sigma$)],
  table.cell(fill: vi_farbe2)[$mu$],
  table.cell(fill: vi_farbe2)[$overline(X) = 1/n sum_(i=1)^n X_i$ \ $S^2 = 1/(n-1) dot sum_(i=1)^n (X_i - overline(X))^2$],
  table.cell(fill: vi_farbe2)[$T = (overline(X) - mu)/(S\/sqrt(n))$],
  table.cell(fill: vi_farbe2)[*$t$-Verteilung* (Tabelle 4) mit $f = n - 1$ \ $c = t_((p;f))$ mit $p = (1+gamma)/2$],
  table.cell(fill: vi_farbe2)[$theta_u = overline(X) - c dot S/sqrt(n)$ \ $theta_o = overline(X) + c dot S/sqrt(n)$],
  
  // Row 3: Normalverteilung (Chi-Quadrat) - ORANGE
  table.cell(fill: vi_farbe3)[Normalverteilung],
  table.cell(fill: vi_farbe3)[$sigma^2$],
  table.cell(fill: vi_farbe3)[$overline(X) = 1/n sum_(i=1)^n X_i$ \ $S^2 = 1/(n-1) dot sum_(i=1)^n (X_i - overline(X))^2$],
  table.cell(fill: vi_farbe3)[$Z = (n-1) S^2/sigma^2$],
  table.cell(fill: vi_farbe3)[*Chi-Quadrat-Verteilung* (Tabelle 3) mit $f = n - 1$ \ $c_1 = z_((p_1;f))$ mit $p_1 = (1-gamma)/2$ \ $c_2 = z_((p_2;f))$ mit $p_2 = (1+gamma)/2$],
  table.cell(fill: vi_farbe3)[$theta_u = ((n-1) dot S^2)/c_2$ \ $theta_o = ((n-1) dot S^2)/c_1$],
  
  // Row 4: Bernoulli-Verteilung - ROSA
  table.cell(fill: vi_farbe4)[Bernoulli-Verteilung Anteilsschätzung (mit $n hat(p)(1 - hat(p)) > 9$)],
  table.cell(fill: vi_farbe4)[$p$],
  table.cell(fill: vi_farbe4)[$overline(X) = 1/n sum_(i=1)^n X_i$ \ $X_i$ 0/1-wertig mit $P(X_i = 1) = p$],
  table.cell(fill: vi_farbe4)[$U = (overline(X) - p)/sqrt(p(1-p)\/n)$],
  table.cell(fill: vi_farbe4)[*Standardnormalverteilung* (näherungsweise), Tabelle 2 \ $c = u_q$ mit $q = (1+gamma)/2$],
  table.cell(fill: vi_farbe4)[$theta_u = overline(X) - c dot sqrt((overline(X) dot (1 - overline(X)))/n)$ \ $theta_o = overline(X) + c dot sqrt((overline(X) dot (1 - overline(X)))/n)$],
  
  // Row 5: beliebig mit n > 30 - VertrauensintervallOLETT
  table.cell(fill: vi_farbe5)[beliebig mit $n > 30$],
  table.cell(fill: vi_farbe5)[$mu, sigma^2$],
  table.cell(fill: vi_farbe5)[wie im Fall 1 (gegebenenfalls mit $s$ als Schätzwert für $sigma$) bzw. im Fall 3],
  table.cell(fill: vi_farbe5)[],
  table.cell(fill: vi_farbe5)[],
  table.cell(fill: vi_farbe5)[]
)

#columns(4, gutter: 1em)[

  #block(fill: rgb("#e8f5e9"), inset: 4pt, radius: 3pt)[
    *Vertrauensintervall für $mu$ ($sigma$ bekannt)*
  ]

  #example[
    *Gewichte ($sigma = 2$ kg, $n = 100$, $overline(x) = 75$ kg, 95%-Niveau):*
    
    + *Vertrauensniveau festlegen:* 95% → $alpha = 0.05$
    + *Quantil aus Tabelle 2:* $z_(1-alpha\/2) = z_(0.975) = 1.960$
    + *Halbbreite berechnen:*
      $ h = z dot sigma/sqrt(n) = 1.960 dot 2/sqrt(100) = 0.392 $
    + *Intervallgrenzen:*
      $ theta_u = overline(x) - h = 75 - 0.392 = 74.608 $
      $ theta_o = overline(x) + h = 75 + 0.392 = 75.392 $
    
    *Vertrauensintervall:* $[74.608, 75.392]$
  ]

  #colbreak()
  #block(fill: rgb("#e3f2fd"), inset: 4pt, radius: 3pt)[
    *Vertrauensintervall für $mu$ ($sigma$ unbekannt)*
  ]

  #example[
    *Marroni ($n = 8$, $overline(x) = 18$, $s = 2.39$, 95%-Niveau):*
    
    + *Vertrauensniveau:* 95% → $alpha = 0.05$
    + *Freiheitsgrade:* $f = n - 1 = 7$
    + *t-Quantil aus Tabelle 4:* $t_(7\; 0.975) = 2.365$
    + *Halbbreite berechnen:*
      $ h = t dot s/sqrt(n) = 2.365 dot 2.39/sqrt(8) approx 2.0 $
    + *Intervallgrenzen:*
      $ theta_u = 18 - 2.0 = 16.0 $
      $ theta_o = 18 + 2.0 = 20.0 $
    
    *Vertrauensintervall:* $[16.0, 20.0]$
  ]

  #colbreak()
  #block(fill: rgb("#fff3e0"), inset: 4pt, radius: 3pt)[
    *Vertrauensintervall für $sigma^2$*
  ]

  #example[
    *Marroni ($n = 8$, $s^2 = 5.71$, 95%-Niveau):*
    
    + *Vertrauensniveau:* 95% → $alpha = 0.05$
    + *Freiheitsgrade:* $f = n - 1 = 7$
    + *$chi^2$-Quantile aus Tabelle 3:*
      - $chi^2_(7\; 0.975) = 16.01$ (für untere Grenze)
      - $chi^2_(7\; 0.025) = 1.69$ (für obere Grenze)
    + *Intervallgrenzen:*
      $ theta_u = ((n-1) dot s^2)/chi^2_(0.975) = (7 dot 5.71)/16.01 = 2.50 $
      $ theta_o = ((n-1) dot s^2)/chi^2_(0.025) = (7 dot 5.71)/1.69 = 23.66 $
    
    *Vertrauensintervall:* $[2.50, 23.66]$
  ]

  #colbreak()
  #block(fill: rgb("#fce4ec"), inset: 4pt, radius: 3pt)[
    *Vertrauensintervall für Anteilswert $p$*
  ]

  #example[
    *Umfrage ($n = 1200$, $k = 473$ Ja, 99%-Niveau):*
    
    + *Anteil berechnen:*
      $ hat(p) = k/n = 473/1200 = 0.394 $
    + *Faustregel prüfen:*
      $ n hat(p)(1-hat(p)) = 1200 dot 0.394 dot 0.606 = 286.5 >= 9 $
    + *Quantil (Tabelle 2):* $z_(0.995) = 2.576$
    + *Halbbreite:*
      $ h = z sqrt((hat(p)(1-hat(p)))/n) = 2.576 sqrt((0.394 dot 0.606)/1200) approx 0.036 $
    + *Intervallgrenzen:*
      $ theta_u = 0.394 - 0.036 = 0.358 $
      $ theta_o = 0.394 + 0.036 = 0.430 $
    
    *Vertrauensintervall:* $[0.358, 0.430]$
  ]

]

#pagebreak()
#columns(3, gutter: 1.2em)[

  // ============================================================
  // 6. KORRELATION & REGRESSION
  // ============================================================

  = Lineare Regression (KQM)

  #variables[
    *Neue Variablen:*
    
    $a$: Achsenabschnitt \
    $b$: Steigung der Regressionsgeraden \
    $R^2$: Bestimmtheitsmaß
  ]

  #formula[
    *Regressionsgerade:* $y = a x + b$
    
    *Steigung:*
    
    #math[$ a = (s_(x y))/(s_x^2) = r dot s_y/s_x $]
    
    *Achsenabschnitt:*
    
    #math[$ b = overline(y) - a dot overline(x) $]
    
    *Residualvarianz:*
    
    #math[$ s_"Res"^2 = s_y^2 (1 - r^2) $]
    
    *Bestimmtheitsmaß:*
    
    #math[$ R^2 = r^2 = (s_y^2 - s_"Res"^2)/(s_y^2) $]
  ]


  #steps[
    + Korrelationskoeffizient $r$ berechnen
    + Steigung: $b = s_(x y)\/s_x^2$
    + Achsenabschnitt: $a = overline(y) - b overline(x)$
    + Prüfung: Residuenplot (sollte unsystematisch streuen)
    + Güte: $R^2$ berechnen (Anteil erklärter Varianz)
  ]


  #example[
    *Größe-Gewicht (15 Personen):*


    $overline(x) = 173$ cm, $s_x = 6.047$ cm
    
    $overline(y) = 72.267$ kg, $s_y = 7.474$ kg
    
    $s_(x y) = 41.071$, $r = 0.898$


    $ b = 41.071/6.047^2 approx 1.123 $


    $ a = 72.267 - 1.123 dot 173 approx -122.02 $


    *Regressionsgerade:*
    
    $ y = -122.02 + 1.123 x $


    $ R^2 = 0.898^2 approx 0.806 $
    
    → 80.6% der Varianz erklärt
  ]


  // ============================================================
  // 7. WICHTIGE KENNWERTE & ÜBERSICHT
  // ============================================================


  = Übersichtstabelle Verteilungen

  #table(
    columns: 4,
    [*Verteilung*], [*PMF/PDF*], [*E(X)*], [*Var(X)*],
    
    [Bernoulli], [$p^x (1-p)^(1-x)$], [$p$], [$p(1-p)$],
    
    [Binomial], [$binom(n,k) p^k (1-p)^(n-k)$], [$n p$], [$n p(1-p)$],
    
    [Poisson], [$(lambda^k e^(-lambda))/k!$], [$lambda$], [$lambda$],
    
    [Hypergeom.], [$(binom(M,k) binom(N-M,n-k))/binom(N,n)$], [$n M/N$], [$dots$],
    
    [Normal], [$1/(sqrt(2pi)sigma) e^(-(x-mu)^2\/(2sigma^2))$], [$mu$], [$sigma^2$]
  )


  = Wichtige Quantile

  #variables[
    *Neue Begriffe:*
    
    $z_p$: p-Quantil der Standardnormalverteilung \
    $t_("df"\; p)$: p-Quantil der t-Verteilung mit df Freiheitsgraden
  ]

  #table(
    columns: 3,
    [*Niveau*], [*z-Wert*], [*Verwendung*],
    [90%], [1.645], [Normalvert.],
    [95%], [1.960], [Normalvert.],
    [99%], [2.576], [Normalvert.],
    [95% (n=7)], [2.365], [t-Vert. (df=7)],
    [95% (n=10)], [2.262], [t-Vert. (df=9)]
  )


]

#image("assets/image-2.png", height: 110%)

#image("assets/image-3.png")