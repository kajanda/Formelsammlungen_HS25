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

#align(center)[
  #text(size: 14pt, weight: "bold")[
    Definitionen, Bemerkungen & Beispiele
  ]
  #v(0.3em)
  #text(size: 11pt)[
    Stochastik & Statistik · Kurz-Zusammenfassung
  ]
]

#v(1em)

#columns(
  3,
  gutter: 1.2em,
)[

  // ------------------------------------------------------------
  // 1. Häufigkeiten & empirische Verteilungen
  // ------------------------------------------------------------

  = Häufigkeiten und Verteilungen

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
    *Gegeben:* 10 Messwerte
    
    2, 3, 3, 4, 4, 4, 5, 6, 6, 6

    *Tabelle:*
    
    $a_i$: 2, 3, 4, 5, 6 \
    $h_i$: 1, 2, 3, 1, 3 \
    $f_i$: 0.1, 0.2, 0.3, 0.1, 0.3 \
    $F_i$: 0.1, 0.3, 0.6, 0.7, 1.0
  ]

  // ------------------------------------------------------------
  // 2. Lagekennwerte
  // ------------------------------------------------------------

  = Median und Quantile

  #formula[
    *q-Quantil* $Q_q$:
    
    Position: $p = n dot q$
    
    *Falls* $p$ *ganzzahlig:*
    
    $ Q_q = 1/2 (x_((p)) + x_((p+1))) $
    
    *Falls* $p$ *nicht ganzzahlig:*
    
    $ Q_q = x_((ceil(p))) $
    
    *Spezialfälle:*
    - Median: $q = 0.5$
    - 1. Quartil: $q = 0.25$
    - 3. Quartil: $q = 0.75$
  ]

  #steps[
    + Daten sortieren: $x_((1)) <= x_((2)) <= dots <= x_((n))$
    + Position berechnen: $p = n dot q$
    + Falls $p$ ganzzahlig → Mittelwert von $x_((p))$ und $x_((p+1))$
    + Falls nicht → aufrunden zu $k = ceil(p)$, dann $Q_q = x_((k))$
  ]

  #example[
    *Stichprobe:* 4, 4, 0, 3, 5, 3, 1
    
    *Sortiert:* 0, 1, 3, 3, 4, 4, 5 mit $n = 7$

    *1. Quartil:*
    - $p = 7 dot 0.25 = 1.75$
    - $k = ceil(1.75) = 2$
    - $Q_1 = x_((2)) = 1$

    *Median:*
    - $p = 7 dot 0.5 = 3.5$
    - $Q_2 = x_((4)) = 3$

    *3. Quartil:*
    - $p = 7 dot 0.75 = 5.25$
    - $Q_3 = x_((6)) = 4$
  ]

  = Mittelwert und Varianz

  #formula[
    *Arithmetischer Mittelwert:*
    
    $ overline(x) = 1/n sum_(i=1)^n x_i $
    
    *Empirische Varianz:*
    
    $ s^2 = 1/n sum_(i=1)^n (x_i - overline(x))^2 $
    
    *Verschiebungssatz:*
    
    $ s^2 = 1/n sum_(i=1)^n x_i^2 - overline(x)^2 $
    
    *Standardabweichung:*
    
    $ s = sqrt(s^2) $
    
    *Korrigierte Varianz:*
    
    $ s_"korr"^2 = n/(n-1) dot s^2 $
  ]

  #steps[
    + $overline(x)$ berechnen
    + Entweder Abweichungen quadrieren oder Verschiebungssatz nutzen
    + Wurzel ziehen für $s$
    + Für Schätzungen: korrigierte Varianz verwenden
  ]

  #example[
    *Werte:* 1, 2, 2, 5 mit $n = 4$

    $ overline(x) = (1 + 2 + 2 + 5)/4 = 2.5 $

    $ sum x_i^2 = 1 + 4 + 4 + 25 = 34 $

    $ s^2 = 34/4 - 2.5^2 = 8.5 - 6.25 = 2.25 $

    $ s = sqrt(2.25) = 1.5 $

    $ s_"korr"^2 = 4/3 dot 2.25 = 3.0 $
  ]

  // ------------------------------------------------------------
  // 3. Klassierte Daten
  // ------------------------------------------------------------

  = Quantile bei klassierten Daten

  #formula[
    Gegeben: Klasse $[a_(k-1), a_k]$ mit $F(a_(k-1)) < q <= F(a_k)$
    
    *Lineare Interpolation:*
    
    $ Q_q = a_(k-1) + (a_k - a_(k-1))/(F(a_k) - F(a_(k-1))) dot (q - F(a_(k-1))) $
  ]

  #steps[
    + Kumulierte Verteilung $F(a_k)$ bestimmen
    + Klasse finden, wo $q$ zwischen $F(a_(k-1))$ und $F(a_k)$ liegt
    + Formel anwenden (lineare Interpolation innerhalb Klasse)
  ]

  #example[
    *Klassenstruktur (Mieten):*
    - 1000–1500: $F = 0.47$
    - 1500–2000: $F = 0.775$

    *Gesucht:* $q = 0.7351$

    $ Q_(0.7351) &= 1000 + (1500 - 1000)/(0.775 - 0.47) dot (0.7351 - 0.47) \
                  &= 1000 + 500/0.305 dot 0.2651 \
                  &approx 1435 $
  ]

  // ------------------------------------------------------------
  // 4. Bedingte Wahrscheinlichkeit
  // ------------------------------------------------------------

  = Bedingte Wahrscheinlichkeit

  #formula[
    *Definition:*
    
    $ P(A | B) = (P(A sect B))/(P(B)), quad P(B) > 0 $
    
    *Multiplikationssatz:*
    
    $ P(A sect B) = P(B) dot P(A | B) = P(A) dot P(B | A) $
    
    *Satz von Bayes:*
    
    $ P(A | B) = (P(A) dot P(B | A))/(P(B)) $
  ]

  #steps[
    + Ereignisse $A$, $B$ definieren
    + $P(A)$, $P(B)$, $P(A sect B)$ aus Tabelle/Modell ablesen
    + Bedingte Wahrscheinlichkeit mit Formel berechnen
    + Bei Vierfeldertafel: Randsummen beachten
  ]

  #example[
    *Vierfeldertafel (1400 Personen):*
    
    #table(
      columns: 3,
      [*Frauen*], [*Männer*], [*Summe*],
      [100 (R)], [400 (R)], [500],
      [200 (NR)], [700 (NR)], [900],
      [300], [1100], [1400]
    )

    $ P("Raucherin" | "Frau") = (100\/1400)/(300\/1400) = 100/300 = 1/3 $

    $ P("Mann" | "Raucher") = (400\/1400)/(500\/1400) = 4/5 $
  ]

  // ------------------------------------------------------------
  // 5. Binomialverteilung
  // ------------------------------------------------------------

  = Binomialverteilung

  #formula[
    *Notation:* $X tilde B(n, p)$
    
    *Dichtefunktion (PMF):*
    
    $ P(X = k) = binom(n, k) dot p^k dot (1-p)^(n-k) $
    
    *Erwartungswert:*
    
    $ E(X) = n dot p $
    
    *Varianz:*
    
    $ "Var"(X) = n dot p dot (1-p) $
    
    *Standardabweichung:*
    
    $ sigma = sqrt(n dot p dot (1-p)) $
  ]

  #steps[
    + Prüfen: $n$ Wiederholungen, konstantes $p$, unabhängig?
    + Parameter festlegen: $n$, $p$
    + Einzelwahrscheinlichkeit: $P(X = k)$ mit PMF-Formel
    + Erwartete Anzahl Erfolge: $E(X) = n p$
  ]

  #example[
    *12-mal Würfeln, X = Anzahl Sechsen*

    $n = 12$, $p = 1/6$

    $ P(X = 3) = binom(12, 3) dot (1/6)^3 dot (5/6)^9 approx 0.197 $

    $ E(X) = 12 dot 1/6 = 2 $

    $ "Var"(X) = 12 dot 1/6 dot 5/6 = 5/3 $
  ]

  // ------------------------------------------------------------
  // 6. Normalverteilung
  // ------------------------------------------------------------

  = Normalverteilung

  #formula[
    *Notation:* $X tilde N(mu, sigma^2)$
    
    *Dichtefunktion (PDF):*
    
    $ f(x) = 1/(sqrt(2 pi) sigma) dot e^(-(x - mu)^2 \/ (2 sigma^2)) $
    
    *Standardisierung:*
    
    $ Z = (X - mu)/sigma tilde N(0, 1) $
    
    *Intervallwahrscheinlichkeit:*
    
    $ P(a <= X <= b) = Phi((b - mu)/sigma) - Phi((a - mu)/sigma) $
    
    wobei $Phi$ die CDF der Standardnormalverteilung ist.
  ]

  #steps[
    + Gegeben: $X tilde N(mu, sigma^2)$
    + Werte $a$, $b$ standardisieren: $z_a = (a - mu)/sigma$, $z_b = (b - mu)/sigma$
    + Aus Tabelle: $Phi(z_a)$, $Phi(z_b)$ ablesen
    + $P(a <= X <= b) = Phi(z_b) - Phi(z_a)$
  ]

  #example[
    *Gegeben:* $X tilde N(3, 4)$ also $mu = 3$, $sigma = 2$

    *Gesucht:* $P(X <= 4.84)$

    $ z = (4.84 - 3)/2 = 0.92 $

    Aus Tabelle: $Phi(0.92) approx 0.821$

    $ arrow.r.double P(X <= 4.84) approx 0.821 $
  ]

  = Normalapproximation

  #formula[
    *Binomialverteilung approximieren:*
    
    Falls $n dot p dot (1-p) >= 9$:
    
    $ B(n, p) approx N(n p, n p(1-p)) $
    
    *Stetigkeitskorrektur:*
    
    $ P(a <= X <= b) approx P(a - 0.5 <= Y <= b + 0.5) $
    
    wobei $Y tilde N(n p, n p(1-p))$
  ]

  #steps[
    + Faustregel prüfen: $n p(1-p) >= 9$
    + Parameter: $mu = n p$, $sigma^2 = n p(1-p)$
    + Stetigkeitskorrektur anwenden
    + Mit Standardnormalverteilung rechnen
  ]

  #example[
    *200 Geräte, $p = 0.06$, gesucht: $P(10 <= X <= 15)$*

    $ n p(1-p) = 200 dot 0.06 dot 0.94 = 11.28 >= 9 quad checkmark $

    $ mu = 12, quad sigma = sqrt(11.28) approx 3.36 $

    Mit Stetigkeitskorrektur:

    $ P(9.5 <= Y <= 15.5) = Phi((15.5 - 12)/3.36) - Phi((9.5 - 12)/3.36) $

    $ approx Phi(1.04) - Phi(-0.74) approx 0.85 - 0.23 = 0.62 $
  ]

  // ------------------------------------------------------------
  // 7. Vertrauensintervalle
  // ------------------------------------------------------------

  = Vertrauensintervall für $mu$

  #formula[
    *Bei unbekanntem $sigma$ (t-Verteilung):*
    
    $ [overline(x) - t_(n-1\; 1-alpha\/2) dot s/sqrt(n), quad overline(x) + t_(n-1\; 1-alpha\/2) dot s/sqrt(n)] $
    
    wobei:
    - $overline(x)$ = Stichprobenmittel
    - $s$ = Stichprobenstandardabweichung
    - $t_(n-1\; 1-alpha\/2)$ = kritischer Wert der t-Verteilung
  ]

  #steps[
    + Stichprobenmittel $overline(x)$ berechnen
    + Standardabweichung $s$ berechnen
    + Vertrauensniveau wählen (z.B. 95% → $alpha = 0.05$)
    + Quantil aus t-Tabelle: $t_(n-1\; 1-alpha\/2)$
    + Halbbreite: $h = t dot s\/sqrt(n)$
    + Intervall: $[overline(x) - h, overline(x) + h]$
  ]

  #example[
    *Marroni-Beispiel:*
    
    $n = 8$, $overline(x) = 18$, $s = 2.39$, Niveau 95%

    Aus Tabelle: $t_(7\; 0.975) = 2.365$

    $ h = 2.365 dot 2.39/sqrt(8) = 2.365 dot 0.845 approx 2.0 $

    *Vertrauensintervall:*
    
    $ [18 - 2.0, 18 + 2.0] = [16.0, 20.0] $

    Mit 95% Sicherheit liegt $mu$ in diesem Intervall.
  ]

  // ------------------------------------------------------------
  // 8. Poissonverteilung
  // ------------------------------------------------------------

  = Poissonverteilung

  #formula[
    *Notation:* $X tilde "Pois"(lambda)$
    
    *Dichtefunktion:*
    
    $ P(X = k) = (lambda^k dot e^(-lambda))/k! $
    
    *Erwartungswert & Varianz:*
    
    $ E(X) = lambda, quad "Var"(X) = lambda $
  ]

  #steps[
    + Modell: Seltene Ereignisse in festem Intervall (Zeit/Raum)
    + Parameter $lambda$ = erwartete Anzahl Ereignisse
    + Einzelwahrscheinlichkeit mit PMF berechnen
    + Kumulative Werte addieren bei Bedarf
  ]

  #example[
    *Anrufe in Telefonzentrale:*
    
    $lambda = 2$ Anrufe/Minute

    $ P(X = 0) = (2^0 dot e^(-2))/0! = e^(-2) approx 0.135 $

    $ P(X = 1) = (2^1 dot e^(-2))/1! = 2 e^(-2) approx 0.271 $

    $ P(X <= 3) = sum_(k=0)^3 P(X = k) approx 0.857 $
  ]

  = Hypergeometrische Verteilung

  #formula[
    *Ziehen ohne Zurücklegen:*
    
    $ P(X = k) = (binom(M, k) dot binom(N-M, n-k))/binom(N, n) $
    
    wobei:
    - $N$ = Grundgesamtheit
    - $M$ = Merkmalsträ

ger
    - $n$ = Stichprobengröße
    - $k$ = Anzahl Merkmalträger in Stichprobe
  ]

  #example[
    *Lotto 6 aus 49:*
    
    $N = 49$, $M = 6$, $n = 6$

    $ P(X >= 4) = sum_(k=4)^6 (binom(6, k) dot binom(43, 6-k))/binom(49, 6) approx 0.00099 $

    Etwa 1 von 1000 Tipps hat mindestens 4 Richtige.
  ]

  // ------------------------------------------------------------
  // 9. Zentrale Begriffe
  // ------------------------------------------------------------

  = Wichtige Kennwerte

  #formula[
    *Korrelationskoeffizient nach Bravais-Pearson:*
    
    $ r = (s_(x y))/(s_x dot s_y) $
    
    wobei $s_(x y)$ die Kovarianz ist.
    
    *Interpretation:*
    - $r approx 1$: starker positiver Zusammenhang
    - $r approx 0$: kein linearer Zusammenhang
    - $r approx -1$: starker negativer Zusammenhang
  ]

  = Boxplot-Kennwerte

  #formula[
    *Interquartilsabstand (IQR):*
    
    $ "IQR" = Q_3 - Q_1 $
    
    *Antennen (Whisker):*
    - Untere: Minimum in $[Q_1 - 1.5 dot "IQR", Q_1]$
    - Obere: Maximum in $[Q_3, Q_3 + 1.5 dot "IQR"]$
    
    *Ausreißer:* Werte außerhalb der Antennen
  ]

]
