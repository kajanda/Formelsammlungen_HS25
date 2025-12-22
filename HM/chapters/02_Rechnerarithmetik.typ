#import "../../style.typ": formula, example, steps

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
