#import "../../style.typ": formula, example, steps

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
