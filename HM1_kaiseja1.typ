#set document(title: "HM1_Zusammenfassung", author: "Jan Kaiser (kaiseja1)")
#set page(paper: "a4", flipped: true,
  footer: [
    #set align(right)
    kaiseja1
  ]
)
#set text(size: 8.5pt)
#set heading(numbering: "1.1")

# Test test test

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
    Numerik HM1/2 · Kapitel 1-4
  ]
]

#v(1em)

#columns(3, gutter: 1.2em)[


= Kapitel 2: Rechnerarithmetik

== Definition 2.1: Maschinenzahlen


  Unter Normalisierung $m_1 != 0$ (falls $x != 0$):
#formula[
  $ bb(M) = {x in bb(R) | x = 0.m_1 m_2 dots.h m_n dot B^(e - "bias")} union {0} $

  *Wert:* $x = sum_(i=1)^n m_i dot B^(-i) dot B^e$
]

=== Vorgehen: Zahlensystem-Umwandlung

#steps[
  *Schritt 1:* Mantisse normalisieren ($0.m_1 m_2...$ mit $m_1 != 0$)
  
  *Schritt 2:* Exponent bestimmen (Verschiebungen zählen)
  
  *Schritt 3:* Wert berechnen: $sum m_i dot B^(-i) dot B^e$
]

=== Beispiel 2.1a: Dezimalzahl

#example[
  *Gegeben:* $x_1 = 0.2345 times 10^3$
  
  *Schritt 1:* Mantisse bereits normalisiert: $0.2345$
  
  *Schritt 2:* Exponent: $e = 3$
  
  *Schritt 3:* Wert berechnen:
  $ x_1 &= (2 dot 10^(-1) + 3 dot 10^(-2) + 4 dot 10^(-3) + 5 dot 10^(-4)) dot 10^3 \
       &= 2 dot 10^2 + 3 dot 10^1 + 4 dot 10^0 + 5 dot 10^(-1) \
       &= 200 + 30 + 4 + 0.5 = 234.5 $
]

=== Beispiel 2.1b: Binärzahl

#example[
  *Gegeben:* $x_2 = 0.111 times 2^3$
  
  *Schritt 1:* Mantisse normalisiert: $0.111_2$
  
  *Schritt 2:* Exponent: $e = 3$
  
  *Schritt 3:* Wert berechnen:
  $ x_2 &= (1 dot 2^(-1) + 1 dot 2^(-2) + 1 dot 2^(-3)) dot 2^3 \
       &= 1 dot 2^2 + 1 dot 2^1 + 1 dot 2^0 \
       &= 4 + 2 + 1 = 7 $
]

=== Beispiel 2.1c: Hexadezimalzahl

#example[
  *Gegeben:* $x_5 = 0."AB3C9F" times 16^4$, mit $A=10, B=11$
  
  *Schritt 1:* Mantisse normalisiert: $0."AB3C9F"_16$
  
  *Schritt 2:* Exponent: $e = 4$
  
  *Schritt 3:* Wert berechnen (Auszug):
  $ x_5 &= (10 dot 16^(-1) + 11 dot 16^(-2) + 3 dot 16^(-3) + ...) dot 16^4 \
       &= 10 dot 16^3 + 11 dot 16^2 + 3 dot 16^1 + ... \
       &= 40960 + 2816 + 48 + ... = 43836.62... $
]

== Definition 2.2: Fehler

#formula[
  *Absoluter Fehler:* $|tilde(x) - x|$

  *Relativer Fehler:* $(|tilde(x) - x|) / (|x|)$ (falls $x != 0$)
]

=== Vorgehen: Fehlerberechnung

#steps[
  *Schritt 1:* Zahl auf $n$ Stellen runden
  
  *Schritt 2:* Absoluter Fehler: $|tilde(x) - x|$
  
  *Schritt 3:* Relativer Fehler: $(|tilde(x) - x|) / (|x|)$
  
  *Schritt 4:* Prüfen: $|"rd"(x) - x| <= B/(2) dot B^(e-(n+1))$
]

=== Beispiel 2.2: Rundungsfehler

#example[
  *Gegeben:* $x = 180.1234567 = 0.1801234567 times 10^3$
  
  Auf $n=7$ Stellen runden.
  
  *Schritt 1:* Rundung auf 7 Stellen:
  $ "rd"(x) = 0.1801235 times 10^3 $
  (8. Stelle ist 6 $>=$ 5 $arrow.r$ aufrunden)
  
  *Schritt 2:* Absoluter Fehler:
  $ |"rd"(x) - x| &= |0.1801235 - 0.1801234567| times 10^3 \
                   &= 0.0000000433 times 10^3 \
                   &= 0.433 times 10^(-4) $
  
  *Schritt 3:* Relativer Fehler:
  $ (|"rd"(x) - x|) / |x| = (0.433 times 10^(-4)) / (180.1234567) approx 2.4 times 10^(-7) $
  
  *Schritt 4:* Prüfung ($B=10, e=3, n=7$):
  $ B/(2) dot B^(e-(n+1)) = 5 times 10^(3-8) = 0.5 times 10^(-4) $
  $ 0.433 times 10^(-4) < 0.5 times 10^(-4) checkmark $
]

== Definition 2.3: Maschinengenauigkeit

#formula[
  $ epsilon_"mach" = 1/(2) dot B^(1-n) $
  
  Maximaler relativer Rundungsfehler.
]

=== Vorgehen: Maschinengenauigkeit

#steps[
  *Schritt 1:* Mantissenlänge $n$ bestimmen
  
  *Schritt 2:* Basis $B$ identifizieren
  
  *Schritt 3:* Formel anwenden: $epsilon_"mach" = 1/(2) dot B^(1-n)$
  
  *Schritt 4:* Bei IEEE: hidden bit beachten!
]

=== Beispiel 2.3a: IEEE Double Precision

#example[
  *Gegeben:* IEEE-754 Double Precision
  
  *Schritt 1:* Mantissenlänge bestimmen:
  - 52 Bit gespeichert
  - + 1 hidden bit
  - $arrow.r n = 53$
  
  *Schritt 2:* Basis: $B = 2$ (binär)
  
  *Schritt 3:* Formel anwenden:
  $ epsilon_"mach" &= 1/(2) dot 2^(1-53) \
                   &= 1/(2) dot 2^(-52) \
                   &= 2^(-53) $
  
  *Schritt 4:* Dezimal umrechnen:
  $ epsilon_"mach" approx 1.110223 times 10^(-16) $
]

== Definition 2.4: Konditionszahl

#formula[
  *Absolute:* $kappa = |f'(x)|$
  
  *Relative:* $kappa_"rel" = (|x dot f'(x)|) / (|f(x)|)$
]

#colbreak()

= Kapitel 3: Nullstellenprobleme

== Definition 3.1: Fixpunkt

#formula[
  $x^*$ heißt *Fixpunkt* von $F$, falls:
  $ F(x^*) = x^* $
]

=== Vorgehen: Fixpunktform

#steps[
  *Schritt 1:* Nullstellenproblem $f(x) = 0$ gegeben
  
  *Schritt 2:* Nach $x$ auflösen: $F(x) = x$
  
  *Schritt 3:* Mehrere Formen möglich!
  
  *Schritt 4:* Konvergenz prüfen: $|F'(x^*)| < 1$
]

=== Beispiel 3.1: Fixpunktform

#example[
  *Gegeben:* $p(x) = x^3 - x + 0.3 = 0$
  
  *Schritt 1:* Nullstellenproblem identifiziert
  
  *Schritt 2:* Umformen nach $x$:
  
  *Variante A:* $x^3 - x + 0.3 = 0$
  $ arrow.r x = x^3 + 0.3 $
  $ arrow.r F(x) = x^3 + 0.3 $
  
  *Variante B:* $x^3 = x - 0.3$
  $ arrow.r x = root(3, x - 0.3) $
  $ arrow.r F(x) = root(3, x - 0.3) $
  
  *Schritt 3:* Beide Formen sind gültig
  
  *Schritt 4:* Konvergenz prüfen (Variante A):
  $ F'(x) = 3x^2 $
  Bei $x^* approx 0.339$: $|F'(0.339)| = 3 dot 0.339^2 approx 0.34 < 1$ ✓
]

=== Vorgehen: Fixpunktiteration

#steps[
  *Schritt 1:* Fixpunktform $x = F(x)$ aufstellen
  
  *Schritt 2:* Startwert $x_0$ wählen
  
  *Schritt 3:* Iterieren: $x_(n+1) = F(x_n)$
  
  *Schritt 4:* Konvergenz prüfen: $|F'(x^*)| < 1$
  
  *Schritt 5:* Abbruch bei $|x_(n+1) - x_n| < epsilon$
]

=== Beispiel 3.2: Fixpunktiteration

#example[
  *Gegeben:* $F(x) = x^3 + 0.3$, Startwert $x_0 = 0$
  
  *Schritt 1:* Fixpunktform bereits gegeben
  
  *Schritt 2:* Startwert: $x_0 = 0$
  
  *Schritt 3:* Iteration durchführen:
  $ x_1 &= F(x_0) = 0^3 + 0.3 = 0.3 $
  $ x_2 &= F(x_1) = 0.3^3 + 0.3 = 0.027 + 0.3 = 0.327 $
  $ x_3 &= F(x_2) = 0.327^3 + 0.3 approx 0.335 $
  $ x_4 &= F(x_3) = 0.335^3 + 0.3 approx 0.338 $
  $ x_5 &= F(x_4) approx 0.339 $
  
  *Schritt 4:* Konvergenz (siehe Beispiel 3.1): ✓
  
  *Schritt 5:* $|x_5 - x_4| approx 0.001$ → Abbruch bei $epsilon = 0.01$
  
  *Fixpunkt:* $x^* approx 0.339$
]

== Newton-Verfahren

#formula[
  $ x_(n+1) = x_n - (f(x_n)) / (f'(x_n)) $
]

=== Vorgehen: Newton-Verfahren

#steps[
  *Schritt 1:* Funktion $f(x)$ und Ableitung $f'(x)$ bestimmen
  
  *Schritt 2:* Startwert $x_0$ wählen (nahe Nullstelle)
  
  *Schritt 3:* Iterieren: $x_(n+1) = x_n - (f(x_n)) / (f'(x_n))$
  
  *Schritt 4:* Konvergenz prüfen: $(|f(x) dot f''(x)|) / (|f'(x)|^2) < 1$
  
  *Schritt 5:* Abbruch bei $|f(x_n)| < epsilon$ oder $|x_(n+1) - x_n| < epsilon$
  
  *Schritt 6:* Quadratische Konvergenz bei einfachen Nullstellen
]

=== Beispiel 3.4: Newton für $x^2 = 2$

#example[
  *Gegeben:* $f(x) = x^2 - 2$, Startwert $x_0 = 1$
  
  *Schritt 1:* Funktionen bestimmen:
  $ f(x) = x^2 - 2 $
  $ f'(x) = 2x $
  $ f''(x) = 2 $
  
  *Schritt 2:* Startwert: $x_0 = 1$
  
  *Schritt 3:* Iteration:
  $ x_1 &= x_0 - (x_0^2 - 2)/(2x_0) = 1 - (1-2)/(2) = 1.5 $
  $ x_2 &= 1.5 - (1.5^2 - 2)/(2 dot 1.5) = 1.5 - (0.25)/(3) approx 1.4167 $
  $ x_3 &= 1.4167 - (1.4167^2 - 2)/(2 dot 1.4167) approx 1.4142 $
  
  *Schritt 4:* Konvergenzprüfung bei $x approx 1.414$:
  $ (|f(x) dot f''(x)|) / (|f'(x)|^2) = (|(x^2-2) dot 2|) / (|2x|^2) approx 0 / 8 < 1 $ 
  
  *Schritt 5:* $|f(x_3)| = |1.4142^2 - 2| approx 0.0002 < epsilon$
  
  *Schritt 6:* $sqrt(2) approx 1.4142$ (quadratische Konvergenz!)
]

#colbreak()

= Kapitel 4: Lineare Gleichungssysteme

== Definition 4.1: Dreiecksmatrizen

#formula[
  *Untere:* $l_(i j) = 0$ für $j > i$
  
  *Obere:* $r_(i j) = 0$ für $i > j$
  
  *Normiert:* Diagonale = 1
]

=== Vorgehen: Gauss-Elimination

#steps[
  *Schritt 1 - Vorwärtselimination:*
  - Zeile 2: $-$ Vielfaches von Zeile 1
  - Zeile 3: $-$ Vielfaches von Zeile 1
  - Dann weiter mit Zeile 3: $-$ Vielfaches von Zeile 2
  
  *Schritt 2:* Ergebnis ist obere Dreiecksmatrix
  
  *Schritt 3 - Rückwärtseinsetzen:*
  - $x_n$ aus letzter Zeile
  - $x_(n-1)$ aus vorletzter (mit $x_n$)
  - Weiter bis $x_1$
]

=== Beispiel 4.1: Gauss 3×3 System

#example[
  *Gegeben:*
  $ x_1 + 2x_2 + 3x_3 &= 6 \
    2x_1 + 5x_2 + 2x_3 &= 4 \
    6x_1 - 3x_2 + x_3 &= 2 $
  
  *Schritt 1a:* Eliminiere $x_1$ aus Zeile 2:
  Zeile 2 $-$ $2 dot$ Zeile 1:
  $ (2-2 dot 1)x_1 + (5-2 dot 2)x_2 + (2-2 dot 3)x_3 &= 4 - 2 dot 6 \
    0x_1 + x_2 - 4x_3 &= -8 $
  
  *Schritt 1b:* Eliminiere $x_1$ aus Zeile 3:
  Zeile 3 $-$ $6 dot$ Zeile 1:
  $ 0x_1 - 15x_2 - 17x_3 &= -34 $
  
  *Schritt 1c:* Eliminiere $x_2$ aus Zeile 3:
  Zeile 3 $-$ $(-15) dot$ neue Zeile 2:
  $ 0x_1 + 0x_2 - 77x_3 &= -154 $
  
  *Schritt 2:* Obere Dreiecksform erreicht:
  $ mat(1, 2, 3; 0, 1, -4; 0, 0, -77) vec(x_1, x_2, x_3) = vec(6, -8, -154) $
  
  *Schritt 3 - Rückwärts:*
  $ x_3 &= (-154) / (-77) = 2 $
  $ x_2 &= (-8 + 4 dot 2) / 1 = 0 $
  $ x_1 &= (6 - 2 dot 0 - 3 dot 2) / 1 = 0 $
  
  *Lösung:* $(x_1, x_2, x_3) = (0, 0, 2)$
]

=== Vorgehen: LR-Zerlegung

#steps[
  *Schritt 1:* Gauss-Elimination durchführen
  
  *Schritt 2:* Multiplikatoren in $bold(L)$ speichern
  
  *Schritt 3:* Resultat ist $bold(R)$
  
  *Schritt 4 - Lösen:* 
  - $bold(L) bold(y) = bold(b)$ (Vorwärts)
  - $bold(R) bold(x) = bold(y)$ (Rückwärts)
]

=== Beispiel 4.2: LR-Zerlegung

#example[
  *Gegeben:* System aus Beispiel 4.1
  
  *Schritt 1:* Gauss durchgeführt (siehe 4.1)
  
  *Schritt 2:* Multiplikatoren sammeln:
  - Zeile 2: Faktor war $2$
  - Zeile 3: Faktor war $6$, dann $-15$
  
  $ bold(L) = mat(1, 0, 0; 2, 1, 0; 6, -15, 1) $
  
  *Schritt 3:* Resultat nach Gauss:
  $ bold(R) = mat(1, 2, 3; 0, 1, -4; 0, 0, -77) $
  
  *Schritt 4:* Lösen (für $bold(b) = vec(6, 4, 2)$):
  
  *Vorwärts* ($bold(L) bold(y) = bold(b)$):
  $ y_1 &= 6 $
  $ 2y_1 + y_2 &= 4 arrow.r y_2 = -8 $
  $ 6y_1 - 15y_2 + y_3 &= 2 arrow.r y_3 = -154 $
  
  *Rückwärts* ($bold(R) bold(x) = bold(y)$): wie in 4.1
]

=== Vorgehen: QR (Gram-Schmidt)

#steps[
  *Schritt 1:* Spalten $bold(a)_1, bold(a)_2, ...$ von $bold(A)$
  
  *Schritt 2:* $bold(u)_1 = bold(a)_1 / (||bold(a)_1||)$
  
  *Schritt 3:* Für $i = 2, ..., n$:
  - $bold(v)_i = bold(a)_i - sum_(j=1)^(i-1) (bold(a)_i^T bold(u)_j) bold(u)_j$
  - $bold(u)_i = bold(v)_i / (||bold(v)_i||)$
  
  *Schritt 4:* $bold(Q) = [bold(u)_1 | ... | bold(u)_n]$
  
  *Schritt 5:* $bold(R) = bold(Q)^T bold(A)$
]

=== Beispiel 4.3: QR für 2×2

#example[
  *Gegeben:* $bold(A) = mat(3, 1; 4, 2)$
  
  *Schritt 1:* Spalten:
  $ bold(a)_1 = vec(3, 4), quad bold(a)_2 = vec(1, 2) $
  
  *Schritt 2:* Ersten orthonormalen Vektor:
  $ ||bold(a)_1|| = sqrt(3^2 + 4^2) = 5 $
  $ bold(u)_1 = 1/(5) vec(3, 4) = vec(0.6, 0.8) $
  
  *Schritt 3:* Zweiten Vektor orthogonalisieren:
  $ bold(a)_2^T bold(u)_1 = 1 dot 0.6 + 2 dot 0.8 = 2.2 $
  $ bold(v)_2 = vec(1, 2) - 2.2 vec(0.6, 0.8) = vec(1, 2) - vec(1.32, 1.76) $
  $ bold(v)_2 = vec(-0.32, 0.24) $
  $ ||bold(v)_2|| = sqrt(0.32^2 + 0.24^2) = 0.4 $
  $ bold(u)_2 = 1/(0.4) vec(-0.32, 0.24) = vec(-0.8, 0.6) $
  
  *Schritt 4:* $bold(Q) = mat(0.6, -0.8; 0.8, 0.6)$
  
  *Schritt 5:* 
  $ bold(R) = bold(Q)^T bold(A) = mat(0.6, 0.8; -0.8, 0.6) mat(3, 1; 4, 2) = mat(5, 2.2; 0, 0.4) $
]

=== Vorgehen: Jacobi-Verfahren

#steps[
  *Schritt 1:* Zerlegung: $bold(A) = bold(L) + bold(D) + bold(R)$
  
  *Schritt 2:* Startvektor $bold(x)^((0))$ wählen
  
  *Schritt 3:* Für jede Komponente $i$:
  $ x_i^((k+1)) = (b_i - sum_(j!=i) a_(i j) x_j^((k))) / (a_(i i)) $
  
  *Schritt 4:* Alle gleichzeitig berechnen
  
  *Schritt 5:* Konvergenz: Matrix diagonaldominant?
  
  *Schritt 6:* Abbruch: $||bold(x)^((k+1)) - bold(x)^((k))|| < epsilon$
]

=== Beispiel 4.4: Jacobi-Iteration

#example[
  *Gegeben:*
  $ 4x_1 + x_2 &= 5 \
    x_1 + 3x_2 &= 7 $
  Start: $bold(x)^((0)) = vec(0, 0)$
  
  *Schritt 1:* Zerlegung erkannt
  
  *Schritt 2:* Startwert: $bold(x)^((0)) = vec(0, 0)$
  
  *Schritt 3+4:* Erste Iteration ($k=0$):
  $ x_1^((1)) = (5 - 1 dot 0) / 4 = 1.25 $
  $ x_2^((1)) = (7 - 1 dot 0) / 3 = 2.33 $
  
  *Iteration 2* ($k=1$):
  $ x_1^((2)) = (5 - 1 dot 2.33) / 4 = 0.67 $
  $ x_2^((2)) = (7 - 1 dot 1.25) / 3 = 1.92 $
  
  *Iteration 3* ($k=2$):
  $ x_1^((3)) = (5 - 1 dot 1.92) / 4 = 0.77 $
  $ x_2^((3)) = (7 - 1 dot 0.67) / 3 = 2.11 $
  
  *Schritt 5:* Diagonaldominanz:
  $|4| > |1|$ ✓, $|3| > |1|$ ✓
  
  *Schritt 6:* Konvergiert gegen $(1, 2)$
]

=== Vorgehen: Gauß-Seidel

#steps[
  *Wie Jacobi, aber in Schritt 3:*
  
  Für Komponente $i$:
  - Nutze *neue* $x_j^((k+1))$ für $j < i$
  - Nutze *alte* $x_j^((k))$ für $j > i$
  
  Sequentiell von oben nach unten!
  
  Meist schnellere Konvergenz.
]

=== Beispiel 4.5: Gauß-Seidel

#example[
  *Gegeben:* System aus 4.4
  
  Start: $bold(x)^((0)) = vec(0, 0)$
  
  *Iteration 1* ($k=0$):
  $ x_1^((1)) = (5 - 1 dot 0) / 4 = 1.25 $
  $ x_2^((1)) = (7 - 1 dot 1.25) / 3 = 1.92 $ (nutzt neues $x_1^((1))$!)
  
  *Iteration 2* ($k=1$):
  $ x_1^((2)) = (5 - 1 dot 1.92) / 4 = 0.77 $
  $ x_2^((2)) = (7 - 1 dot 0.77) / 3 = 2.08 $
  
  *Iteration 3* ($k=2$):
  $ x_1^((3)) = (5 - 1 dot 2.08) / 4 = 0.73 $
  $ x_2^((3)) = (7 - 1 dot 0.73) / 3 = 2.09 $
  
  *Vergleich:* Schnellere Konvergenz als Jacobi!
  
  Lösung: $(1, 2)$
]

=== Definition 4.6: Eigenwert

#formula[
  $ bold(A) dot bold(v) = lambda dot bold(v) $
  
  $lambda in bb(C)$ = Eigenwert, $bold(v) != bold(0)$ = Eigenvektor
]

=== Vorgehen: Eigenwerte (2×2)

#steps[
  *Schritt 1:* $bold(A) = mat(a, b; c, d)$
  
  *Schritt 2:* Charakteristisches Polynom:
  $ p(lambda) = lambda^2 - (a+d)lambda + (a d - b c) $
  
  *Schritt 3:* Lösen: $lambda_(1,2) = ...$
  
  *Schritt 4:* Für jeden $lambda$: $(bold(A) - lambda bold(I)) bold(v) = bold(0)$
]

=== Beispiel 4.7: Eigenwerte 2×2

#example[
  *Gegeben:* $bold(A) = mat(4, 1; 2, 3)$
  
  *Schritt 1:* Matrix identifiziert: $a=4, b=1, c=2, d=3$
  
  *Schritt 2:* Charakteristisches Polynom:
  $ p(lambda) &= lambda^2 - (4+3)lambda + (4 dot 3 - 1 dot 2) \
              &= lambda^2 - 7lambda + 10 $
  
  *Schritt 3:* Nullstellen (pq-Formel):
  $ lambda_(1,2) = 7/(2) plus.minus sqrt((7/(2))^2 - 10) $
  $ lambda_(1,2) = 7/(2) plus.minus sqrt((2.25)) = 7/(2) plus.minus 3/(2) $
  $ lambda_1 = 5, quad lambda_2 = 2 $
  
  *Schritt 4:* Eigenvektor zu $lambda_1 = 5$:
  $ (bold(A) - 5 bold(I)) bold(v) = mat(-1, 1; 2, -2) vec(v_1, v_2) = vec(0, 0) $
  $ arrow.r -v_1 + v_2 = 0 arrow.r bold(v)_1 = vec(1, 1) $
  
  Eigenvektor zu $lambda_2 = 2$:
  $ (bold(A) - 2 bold(I)) bold(v) = mat(2, 1; 2, 1) vec(v_1, v_2) = vec(0, 0) $
  $ arrow.r 2v_1 + v_2 = 0 arrow.r bold(v)_2 = vec(1, -2) $
]

=== Vorgehen: Potenzmethode

#steps[
  *Schritt 1:* Startvektor $bold(v)^((0))$ wählen (zufällig)
  
  *Schritt 2:* Iteration:
  $ bold(w)^((k)) = bold(A) bold(v)^((k-1)) $
  
  *Schritt 3:* Normieren:
  $ bold(v)^((k)) = bold(w)^((k)) / ||bold(w)^((k))|| $
  
  *Schritt 4:* Eigenwert approximieren:
  $ lambda approx (bold(v)^((k)))^T bold(A) bold(v)^((k)) $
  
  Konvergiert zum betragsmäßig größten EW.
]

=== Beispiel 4.8: Potenzmethode

#example[
  *Gegeben:* $bold(A) = mat(4, 1; 2, 3)$, Start: $bold(v)^((0)) = vec(1, 0)$
  
  *Iteration 1:*
  
  *Schritt 2:* $bold(w)^((1)) = mat(4, 1; 2, 3) vec(1, 0) = vec(4, 2)$
  
  *Schritt 3:* $||bold(w)^((1))|| = sqrt(16+4) = sqrt(20) approx 4.47$
  $ bold(v)^((1)) = vec(4, 2) / 4.47 approx vec(0.89, 0.45) $
  
  *Iteration 2:*
  
  *Schritt 2:* $bold(w)^((2)) = mat(4, 1; 2, 3) vec(0.89, 0.45) = vec(4.01, 3.13)$
  
  *Schritt 3:* $||bold(w)^((2))|| approx 5.08$
  $ bold(v)^((2)) approx vec(0.79, 0.62) $
  
  *Iteration 3:* $bold(v)^((3)) approx vec(0.71, 0.71)$
  
  *Schritt 4:* Eigenwert (nach Konvergenz):
  $ lambda &= bold(v)^T bold(A) bold(v) \
          &= vec(0.71, 0.71)^T mat(4, 1; 2, 3) vec(0.71, 0.71) \
          &approx 5 $
  
  *Ergebnis:* Größter EW $lambda_1 = 5$ (vgl. 4.7)
  
 

]

#colbreak()
 = Ergänzung HM1-Formeln

== Ableitungen & Integrale

$ (x^n)' = n x^(n-1) , quad n in RR, n != 0 $

$ (a f(x) + b g(x))' = a f'(x) + b g'(x) $

$ (sin x)' = cos x, quad (cos x)' = -sin x $

$ (e^x)' = e^x, quad (ln x)' = 1/x, quad x > 0 $

$ #int x^n d x = x^(n+1)/(n+1) + C , quad n != -1 $

$ #int 1/x d x = ln(abs(x)) + C $

$ #int e^x d x = e^x + C $

$ #int sin x d x = -cos x + C, quad #int cos x d x = sin x + C $

== Polynome

$ p(x) = a_n x^n + dots + a_1 x + a_0 $

$ p'(x) = n a_n x^(n-1) + dots + 2 a_2 x + a_1 $

$ P(x) = #int p(x) "dx"
       = a_n x^(n+1)/(n+1) + dots + a_1 x^2/2 + a_0 x + C $

== Fakultät & Binomialkoeffizient

$ n! = 1 dot 2 dot 3 dot dots dot n, quad 0! = 1 $

$ binom(n, k) = n! / (k! (n-k)!) $

== Sekantenverfahren

$ x_(k+1) = x_k - f(x_k) dot frac(x_k - x_(k-1), f(x_k) - f(x_(k-1))) $

== Geometrie

$ V_"kugel" = frac(4, 3) pi r^3, quad A_"kreis" = pi r^2 $

$ V_"zyl" = pi r^2 l $

$ V_"kugelsegment" = pi h^2 (r - h/3) $

== Lineare Algebra Basics

$ op("tr")(A) = sum_i a_(i i) $

$ det! mat(a, b; c, d) = a d - b c $

$ p(\\lambda) = det(A - \\lambda I) $

$ p(\\lambda) = \\lambda^2 - (a+d) \\lambda + (a d - b c) quad "für" 2 times 2 $
]