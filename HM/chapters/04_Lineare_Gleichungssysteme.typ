#import "../../style.typ": formula, example, steps, remark

/**
 * 
 * Gauss algorithmus (mit und ohne pivotisierung)
 * LR Zerlegung
 * QR Zerlegung (Gram-Schmidt)
 * Fehler für gestörte lieneare Gleichungssysteme
 * Jacobi Verfahren
 * Gauß-Seidel Verfahren
 * Fehlerabschätzung für iterative Verfahren
 * Eigenwerte und Eigenvektoren
 * komplexe Zahlen
 * 
 */






== Definition 4.1: Dreiecksmatrizen

*Untere Dreiecksmatrix:* Alle Einträge oberhalb der Diagonale sind $0$.
$ bold(L) = mat(
  1, 0, 0, dots.c, 0;
  l_(21), 1, 0, dots.c, 0;
  l_(31), l_(32), 1, dots.down, 0;
  dots.v, dots.v, dots.down, dots.down, 0;
  l_(n 1), l_(n 2), dots.c, l_(n\,n-1), 1
) $

*Obere Dreiecksmatrix*: Alle Einträge unterhalb der Diagonale sind $0$.

$ bold(R) = mat(
  r_(11), r_(12), r_(13), dots.c, r_(1 n);
  0, r_(22), r_(23), dots.c, r_(2 n);
  0, 0, r_(33), dots.c, r_(3 n);
  dots.v, dots.v, dots.down, dots.down, dots.v;
  0, 0, dots.c, 0, r_(n n)
) $

#remark[*Normiert:* Diagonale = 1]


== Gauss Algorithmus

#formula[
  $ x_i = frac(b_i - sum_(j=i+1)^n a_(i j) x_j, a_(i i)), quad i = n, n-1, ..., 1 $
]

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


=== Beispiel 3x3 Gauss Elimination

#example[
  *Gegeben:*
  $ bold(A) = mat(-1, 1, 1; 1, -3, -2; 5, 1, 4) , bold(b) = vec(0, 5, 3) $
  
  *Erweiterte Matrix:* $(bold(A) | bold(b)) = mat(-1, 1, 1, |, 0; 1, -3, -2, |, 5; 5, 1, 4, |, 3)$
  
  *Schritt 1 a: Eliminiere $a_(21)$*
  $ i = 1, j = 2 => z_2 = z_2 - frac(1, -1) z_1 = (bold(A)_1 | bold(b)_1) $
  $ (bold(A)_1 | bold(b)_1) = mat(-1, 1, 1, |, 0; 0, -2, -1, |, 5; 5, 1, 4, |, 3) $
  
  *Schritt 1b: Eliminiere $a_(31)$*
  $ i = 1, j = 3 => z_3 = z_3 - frac(5, -1) z_1 = (bold(A)_2 | bold(b)_2) $
  $ (bold(A)_2 | bold(b)_2) = mat(-1, 1, 1, |, 0; 0, -2, -1, |, 5; 0, 6, 9, |, 3) $
  
  *Schritt 1c: Eliminiere $a_(32)$*
  $ i = 2, j = 3 => z_3 = z_3 - frac(6, -2) z_2 = (bold(A)_3 | bold(b)_3) $
  $ (bold(A)_3 | bold(b)_3) = mat(-1, 1, 1, |, 0; 0, -2, -1, |, 5; 0, 0, 6, |, 18) $
  
  *Schritt 2: Obere Dreiecksform erreicht:*
  $ mat(-1, 1, 1; 0, -2, -1; 0, 0, 6) vec(x_1, x_2, x_3) = vec(0, 5, 18) $
  
  *Schritt 3: Rückwärtseinsetzen:*
  $ x_3 &= 18 / 6 = 3 $
  $ x_2 &= (5 - (-1) dot 3) / (-2) = 8 / (-2) = -4 $
  $ x_1 &= (0 - 1 dot (-4) - 1 dot 3) / (-1) = 1 / (-1) = -1 $
  
  *Lösung:* $(x_1, x_2, x_3) = (-1, -4, 3)$
]


== LR Zerlegung

Folgende Aussagen sind äquivalent:

#formula[
  $ A = L R $

  $ L y = b <=> y = (L|b) $
  $R x = y <=> (R|y) = x$


  mit Permutationsmatrix $P$:
  $ P A = L R $
  $  L y = P b $


]

=== Vorgehen: LR-Zerlegung

#steps[
  *Schritt 1:* Gauss-Elimination durchführen
  
  *Schritt 2:* Faktoren in $bold(L)$ eintragen
  
  *Schritt 3:* Resultat ist $bold(R)$
  
  *Schritt 4 - Lösen:* 
  - $bold(L) bold(y) = bold(b)$ (Vorwärts)
  - $bold(R) bold(x) = bold(y)$ (Rückwärts)
]

=== Beispiel 4.3: LR-Zerlegung

#example[
  *Gegeben:* System aus Beispiel 4.2
  $ bold(A) = mat(-1, 1, 1; 1, -3, -2; 5, 1, 4) , bold(b) = vec(0, 5, 3) $
  
  *Schritt 1:* Gauss-Elimination durchgeführt (siehe 4.2)
  
  *Schritt 2:* Multiplikatoren sammeln:
  - Zeile 2: Faktor war $frac(1, -1) = -1$
  - Zeile 3: Faktor war $frac(5, -1) = -5$, dann $frac(6, -2) = -3$
  
  $ bold(L) = mat(1, 0, 0; -1, 1, 0; -5, -3, 1) $
  
  *Schritt 3:* Resultat nach Gauss (obere Dreiecksmatrix):
  $ bold(R) = mat(-1, 1, 1; 0, -2, -1; 0, 0, 6) $
  
  *Schritt 4:* Lösen (für $bold(b) = vec(0, 5, 3)$):
  
  *Vorwärts* ($bold(L) bold(y) = bold(b)$):
  
  Erweiterte Matrix: $(bold(L) | bold(b)) = mat(1, 0, 0, |, 0; -1, 1, 0, |, 5; -5, -3, 1, |, 3)$
  
  *Schritt 1:* Eliminiere $L_(21)$:
  $ z_2 = z_2 - (-1) dot z_1 arrow.r mat(1, 0, 0, |, 0; 0, 1, 0, |, 5; -5, -3, 1, |, 3) $
  
  *Schritt 2:* Eliminiere $L_(31)$:
  $ z_3 = z_3 - (-5) dot z_1 arrow.r mat(1, 0, 0, |, 0; 0, 1, 0, |, 5; 0, -3, 1, |, 3) $
  
  *Schritt 3:* Eliminiere $L_(32)$:
  $ z_3 = z_3 - (-3) dot z_2 arrow.r mat(1, 0, 0, |, 0; 0, 1, 0, |, 5; 0, 0, 1, |, 18) $
  
*Vereinfacht*

  $ y_1 &= 0 $
  $ -1 dot y_1 + y_2 &= 5 arrow.r y_2 = 5 $
  $ -5 dot y_1 - 3 dot y_2 + y_3 &= 3 arrow.r y_3 = 3 - 0 + 15 = 18 $


  *Resultat:* $ y = vec(0, 5, 18) $
  


  *Rückwärts* ($bold(R) bold(x) = bold(y)$): wie in 4.2
  $ x_3 &= 18 / 6 = 3 $
  $ x_2 &= (5 - (-1) dot 3) / (-2) = -4 $
  $ x_1 &= (0 - 1 dot (-4) - 1 dot 3) / (-1) = -1 $
  
  *Lösung:* $(x_1, x_2, x_3) = (-1, -4, 3)$ 
]

== QR Zerlegung
#formula[
  Eine Matrix $bold(Q) in RR^(n times n)$ heisst *orthogonal*, wenn ihre Spaltenvektoren paarweise orthogonal sind:
  $ bold(Q)^T bold(Q) = bold(I_n) <=> bold(Q)^T = bold(Q)^(-1) $

  Die QR-Zerlegung einer Matrix $bold(A) in RR^(m times n)$ ist die Darstellung:
  $ bold(A) = bold(Q) bold(R) $

  *Gram-Schmidt-Verfahren:*
  
  
  $ bold(v)_i = bold(a)_i - sum_(j=1)^(i-1) (bold(a)_i^T bold(u)_j) bold(u)_j quad text("(orthogonal)") $
  $ bold(u)_i = frac(bold(v)_i, ||bold(v)_i||) quad text("(normalisiert)") $
  
  
  Finden von $bold(R)$:
  $ bold(R) = bold(Q)^T bold(A) $
]

=== Vorgehen: QR (Gram-Schmidt)

#steps[
  *Schritt 1:* Spalten $bold(a)_1, bold(a)_2, ...$ von $bold(A)$
  
  *Schritt 2:* $bold(u)_1 = bold(a)_1 / (||bold(a)_1||)$
  
  *Schritt 3:* Für $i = 2, ..., n$:
  - $bold(v)_i$ berechnen (orthogonalisieren)
  - $bold(u)_i = bold(v)_i / (||bold(v)_i||)$ berechnen
  
  *Schritt 4:* $bold(Q) = [bold(u)_1 | ... | bold(u)_n]$
  
  *Schritt 5:* $bold(R) = bold(Q)^T bold(A)$
]

=== Beispiel 4.3: QR für 2×2

#example[
  *Gegeben:* $ bold(A) = mat(3, 1; 4, 2) $
  
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
