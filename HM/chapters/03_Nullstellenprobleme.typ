#import "../../style.typ": formula, example, steps, remark

== Definition: Fixpunkt

#formula[
  $overline(x)$ heißt *Fixpunkt* von $F$, falls:
  $ F(overline(x)) = overline(x) $
]

=== Banachscher Fixpunktsatz

#formula[
  Sei $F: [a, b] arrow.r [a, b]$ (d.h. $F$ bildet $[a, b]$ auf sich selbst ab) und existiere eine Konstante $alpha$ mit $0 < alpha < 1$ und:
  $ |F(x) - F(y)| <= alpha |x - y| quad "für alle" quad x, y in [a, b] $
  (d.h. $F$ ist *Lipschitz-stetig* und *kontraktiv*, $alpha$ nennt man auch *Lipschitz-Konstante*).
]
  *Dann gilt:*
  
#remark[
  *Kontraktionsbedingung:* $|F(x) - F(y)| <= alpha |x - y|$ besagt, dass $F$ eine *Kontraktion* ist.
  
  *Lipschitz-Konstante:* $alpha < 1$ garantiert, dass Abstände verkleinert werden.
  
  *Ableitung:* Für differenzierbar $F$ gilt: $|F'(x)| <= alpha < 1$ für alle $x in [a, b]$.
  
  *Existenz und Eindeutigkeit:* Genau ein Fixpunkt existiert.
  
  *Globale Konvergenz:* Jeder Startwert führt zur Konvergenz.
]

=== Interpretationen der Abschätzungen

=== Abschätzungen der Fixpunktiteration
  #formula[
  *A-priori Abschätzung* (vor Iteration bekannt):
  $ |x_n - overline(x)| <= (alpha^n) / (1 - alpha) |x_1 - x_0| $

  $ n >= frac(ln(epsilon(1 - alpha) \/ |x_1 - x_0|), ln(alpha)) $
  
  *A-posteriori Abschätzung* (während Iteration berechenbar):
  $ |x_n - overline(x)| <= 1 / (1 - alpha) |x_n - x_(n-1)| $
]

#steps[
  *Schritt 1:* Banachscher Fixpunktsatz: Bedingungen prüfen
  
  - Abbildung $F: [a, b] arrow.r [a, b]$ verifizieren

  
  *Schritt 2:* Lipschitz-Konstante finden
  - Lipschitz-Konstante $alpha < 1$ finden: $alpha = max_(x in [a,b]) |F'(x)|$

  - *Schritt 2.1:* Ableitung $F'(x)$ berechnen

  - *Schritt 2.2:* Maximumvon $|F'(x)|$ im Intervall bestimmen

  *Schritt 3:* Konklusion
  
  - Eindeutiger Fixpunkt $overline(x)$ existiert (erfüllt $F(overline(x)) = overline(x)$)
  - Jeder Startwert in $[a, b]$ konvergiert gegen $overline(x)$
  
  *Fixpunkt genau:*
  #formula[
    $ overline(x) = lim_(n arrow.r infinity) x_n quad "wobei" quad x_(n+1) = F(x_n) $
  ]
]

=== Beispiel: Banachscher Fixpunktsatz für $x^3 + 0.3 = 0$

#example[
  *Gesucht:* Intervall $[a, b]$ und Konstante $alpha < 1$, so dass der Banachsche Fixpunktsatz auf die Fixpunktiteration $x_(n+1) = F(x_n) = x_n^3 + 0.3$ anwendbar ist.
  
  *Lösungsansatz:* Die Fixpunktiteration konvergiert in der Nähe von $overline(x) = 0.3389$. Wir suchen ein geeignetes Intervall und versuchen es mit $[a, b] = [0, 0.5]$.
  
  *Schritt 1:* Überprüfen, ob $F: [0, 0.5] arrow.r [0, 0.5]$:
  
  - Für alle $x in [0, 0.5]$: $F(x) = x^3 + 0.3 >= 0.3$ 
  - $F(0) = 0.3 in [0, 0.5]$ 
  - $F(0.5) = 0.125 + 0.3 = 0.425 in [0, 0.5]$ 
  
  *Schritt 2:* Finden einer Konstanten $alpha < 1$:
  
  Aus dem Satz wissen wir: $alpha = max_(x in [a,b]) |F'(x)|$
  
  *Schritt 2.1:* Ableitung berechnen:
  $ F'(x) = 3x^2 $
  
  *Schritt 2.2:*
  Die Ableitung ist monoton steigend, daher Maximum bei $x = 0.5$:
  $ |F'(0.5)| = 3 dot 0.5^2 = 0.75 < 1 $ 
  
  *Schritt 3:* Konklusion:
  
  Mit $alpha = 0.75 < 1$ sind alle Bedingungen des Banachschen Fixpunktsatzes erfüllt. Die Fixpunktiteration $x_(n+1) = x_n^3 + 0.3$ konvergiert gegen den eindeutigen Fixpunkt $overline(x) approx 0.3389$ für jeden Startwert in $[0, 0.5]$.
]


=== Vorgehen: Fixpunktform

#steps[
  *Schritt 1:* Nullstellenproblem $f(x) = 0$ gegeben
  
  *Schritt 2:* Nach $x$ auflösen: $F(x) = x$
  
  *Schritt 3:* Mehrere Formen möglich!
  
  *Schritt 4:* Konvergenz prüfen: $|F'(overline(x))| < 1$
]

=== Beispiel 3.3: Fixpunktform

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
  Bei $overline(x) approx 0.339$: $|F'(0.339)| = 3 dot 0.339^2 approx 0.34 < 1$
]

=== Vorgehen: Fixpunktiteration

#steps[
  *Schritt 1:* Fixpunktform $x = F(x)$ aufstellen
  
  *Schritt 2:* Startwert $x_0$ wählen
  
  *Schritt 3:* Iterieren: $x_(n+1) = F(x_n)$
  
  *Schritt 4:* Konvergenz prüfen: $|F'(overline(x))| < 1$
  
  *Schritt 5:* Abbruch bei $|x_(n+1) - x_n| < epsilon$
]

=== Beispiel 3.4: Fixpunktiteration

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
  
  *Schritt 4:* Konvergenz (siehe Beispiel 3.3): 
  
  *Schritt 5:* $|x_5 - x_4| approx 0.001$ → Abbruch bei $epsilon = 0.01$
  
  *Fixpunkt:* $overline(x) approx 0.339$
]

== Newton-Verfahren

#formula[
  $ x_(n+1) = x_n - (f(x_n)) / (f'(x_n)) $
]

*Vereinfachtes Newton-Verfahren*

#formula[
  $ x_(n+1) = x_n - (f(x_n)) / (c) $
  mit konstanter Ableitung $c = f'(x_0)$
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

=== Beispiel 3.5: Newton für $x^2 = 2$

#example[
  *Gegeben:* $f(x) = x^2 - 2$, Startwert $x_0 = 1$, $epsilon = 10^(-4)$
  
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
  
  *Schritt 5:* Abbruchkriterium prüfen bei $epsilon = 10^(-4)$:
  $ |f(x_3)| = |1.4142^2 - 2| approx 0.00005 < 10^(-4) $
  
  *Schritt 6:* $sqrt(2) approx 1.4142$ (quadratische Konvergenz!)
]
== Sekantenverfahren

#formula[
  $ x_(n+1) = x_n -f(x_n) dot (f(x_n) - (x_n - x_(n-1))) / (f(x_n) - f(x_(n-1))) $
]

=== Vorgehen: Sekantenverfahren

#steps[
  *Schritt 1:* Funktion $f(x)$ bestimmen (keine Ableitung nötig!)
  
  *Schritt 2:* Zwei Startwerte $x_0$ und $x_1$ wählen (nahe Nullstelle)
  
  *Schritt 3:* Iterieren: $x_(n+1) = x_n - (f(x_n) dot (x_n - x_(n-1))) / (f(x_n) - f(x_(n-1)))$
  
  *Schritt 4:* Konvergenz: Superlinear (Ordnung ≈ 1.618, besser als linear, schlechter als quadratisch)
  
  *Schritt 5:* Abbruch bei $|f(x_n)| < epsilon$ oder $|x_(n+1) - x_n| < epsilon$
]

=== Beispiel 3.6: Sekantenverfahren für $x^2 = 2$

#example[
  *Gegeben:* $f(x) = x^2 - 2$, Startwerte $x_0 = 1$, $x_1 = 1.5$, $epsilon = 10^(-4)$
  
  *Schritt 1:* Funktion bestimmt: $f(x) = x^2 - 2$
  
  *Schritt 2:* Startwerte: $x_0 = 1$, $x_1 = 1.5$
  
  *Schritt 3:* Iteration:
  $ f(x_0) = 1^2 - 2 = -1 $
  $ f(x_1) = 1.5^2 - 2 = 0.25 $
  $ x_2 &= x_1 - (f(x_1) dot (x_1 - x_0)) / (f(x_1) - f(x_0)) $
  $ &= 1.5 - (0.25 dot (1.5 - 1)) / (0.25 - (-1)) $
  $ &= 1.5 - (0.25 dot 0.5) / (1.25) $
  $ &= 1.5 - 0.1 = 1.4 $
  
  $ f(x_2) = 1.4^2 - 2 = -0.04 $
  $ x_3 &= 1.4 - (-0.04 dot (1.4 - 1.5)) / (-0.04 - 0.25) $
  $ &= 1.4 - (-0.04 dot (-0.1)) / (-0.29) $
  $ &= 1.4 - 0.004 / (-0.29) approx 1.414 $
  
  *Schritt 4:* Konvergenz: Superlinear (besser als Fixpunktiteration, weniger Ableitungen als Newton)
  
  *Schritt 5:* $|f(x_3)| approx |1.414^2 - 2| approx 0$ → Konvergiert schnell
]