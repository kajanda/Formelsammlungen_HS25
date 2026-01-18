#import "../../style.typ": formula, example, steps, remark, math

/**
 * 
 * Done
 * Gauss algorithmus (mit und ohne pivotisierung)
 * LR Zerlegung
 * QR Zerlegung (Gram-Schmidt)
 * Jacobi Verfahren
 * Gauß-Seidel Verfahren
 * B-Matritzen
 * Fehlerabschätzung für iterative Verfahren
 * Konvergenzkriterien
 * Fehler für gestörte lieneare Gleichungssysteme
 * 
 * todo
 * Determinanten
 * QR Householder
 * Mises iteration
 * komplexe Zahlen
 * Eigenwerte und Eigenvektoren
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

  *Schritt 2:* Iterationsformel aufstellen
  
  *Schritt 3:* Startvektor $bold(x)^((0))$ wählen

  *Schritt 4:* Konvergenz prüfen.
]

#formula[
  *Interationsformel:*

  $ bold(A) = bold(D) + bold(L) + bold(R) $

  $ bold(D) bold(x)^((k+1)) = -(bold(L) + bold(R)) bold(x)^((k)) + bold(b) $
  
  $ bold(x)^((k+1)) = -bold(D)^(-1)(bold(L) + bold(R)) bold(x)^((k)) + bold(D)^(-1) bold(b) $




  *Konvergenz Prüfen Formel*
  $ B = -D^(-1)(L + R) $
  $ c = D^(-1) b $
  Somit ist $ bold(x)^((n+1)) = bold(B) bold(x)^((n)) + bold(c) =: bold(F)(bold(x)^((n))) $


  Falls $||B|| < 1$ -> konvergiert für jeden Startvektor $x^((0))$.
  Falls $||B|| >= 1$ -> keine Konvergenz garantiert.

  *Diagonaldominanz:*\
  Zeilenweise
  $ |a_(i i)| > sum_(j=1, j != i)^n |a_(i j)| , quad forall i = 1, ..., n $

  Spaltenweise :\
  $ |a_(i i)| > sum_(j=1, j != i)^n |a_(j i)| , quad forall i = 1, ..., n $


]


#example[
  *Gegeben:*
  $ bold(A) x = bold(b) quad "mit" quad bold(A) = mat(4, -1, 1; -2, 5, 1; 1, -2, 5) quad "und" quad bold(b) = vec(5, 11, 12) $
  
  *Schritt 1 Zerlegung:*
  $ bold(L) = mat(0, 0, 0; -2, 0, 0; 1, -2, 0), quad bold(D) = mat(4, 0, 0; 0, 5, 0; 0, 0, 5), quad bold(R) = mat(0, -1, 1; 0, 0, 1; 0, 0, 0) $
  
  *Schritt 2 Iterationsformel:*
  $ bold(x)^((n+1)) &= -bold(D)^(-1) ((bold(L) + bold(R)) bold(x)^((n)) - bold(b)) $
  $ &= -mat(0.25, 0, 0; 0, 0.2, 0; 0, 0, 0.2) mat(0, -1, 1; -2, 0, 1; 1, -2, 0) bold(x)^((n)) + mat(0.25, 0, 0; 0, 0.2, 0; 0, 0, 0.2) vec(5, 11, 12) $
  $ &= mat(0, 0.25, -0.25; 0.4, 0, -0.2; -0.2, 0.4, 0) bold(x)^((n)) + vec(1.25, 2.2, 2.4) $


  *Schritt 3 Startwert:* $ bold(x)^((0)) = vec(0, 0, 0) $
  $bold(x)^((1)) = vec(1.25, 2.2, 2.4) $, $bold(x)^((2)) = vec(0.5125, 2.03, 2.295)$, $bold(x)^((3)) = vec(0.80125, 2.059, 2.282) $
]

== Gauß-Seidel

Das Gauß-Seidel Verfahren ist eine Modifikation des Jacobi-Verfahrens. Vorteile sind schnellere Konvergenz und weniger Speicherbedarf (da kein Zwischenspeicher für den alten Vektor benötigt wird).

#steps[
  *Schritt 1:* Zerlegung: $bold(A) = bold(L) + bold(D) + bold(R)$ (wie Jacobi)
  
  *Schritt 2:* Startvektor $bold(x)^((0))$ wählen
  
  *Schritt 3:* Für jede Komponente $i$ *sequentiell* von oben nach unten:
  - Nutze *neue* $x_j^((k+1))$ für $j < i$ (bereits berechnet!)
  - Nutze *alte* $x_j^((k))$ für $j > i$ (noch nicht berechnet)
  
  *Schritt 4:* Alle Komponenten in dieser Iteration berechnen
  
  *Schritt 5:* Konvergenz: Matrix diagonaldominant?
  
  *Schritt 6:* Abbruch: $||bold(x)^((k+1)) - bold(x)^((k))|| < epsilon$
]

#formula[
  $ (bold(D) + bold(L)) bold(x)^((k+1)) = -bold(R) bold(x)^((k)) + bold(b) $
  
  $ bold(x)^((k+1)) = -(bold(D) + bold(L))^(-1) bold(R) bold(x)^((k)) + (bold(D) + bold(L))^(-1) bold(b) $

  *Allgemein für Komponente $i$:*

  $ x_i^((k+1)) = frac(1, a_(i i)) ( b_i - sum_(j=1)^(i-1) a_(i j) x_j^((k+1)) - sum_(j=i+1)^n a_(i j) x_j^((k))) $
]

=== Beispiel 4.5: Gauß-Seidel

#example[
  *Schritt 1:* Zerlegung:
  $ bold(L) = mat(0, 0, 0; -2, 0, 0; 1, -2, 0), quad bold(D) = mat(4, 0, 0; 0, 5, 0; 0, 0, 5), quad bold(R) = mat(0, -1, 1; 0, 0, 1; 0, 0, 0) $
  
  *Schritt 2:* Startvektor:
  $ bold(x)^((0)) = vec(0, 0, 0) $
  
  *Schritt 3+4:* Iteration 1 ($k=0$) - für jede Komponente sequentiell:
  
  *Komponente 1:*
  $ x_1^((1)) = frac(1, 4)(5 - 0 - 0) = 1.25 $
  
  *Komponente 2* (nutze neues $x_1^((1)) = 1.25$):
  $ x_2^((1)) = frac(1, 5)(11 - (-2) dot 1.25 - 0) = frac(1, 5)(13.5) = 2.7 $
  
  *Komponente 3* (nutze neue $x_1^((1)) = 1.25, x_2^((1)) = 2.7$):
  $ x_3^((1)) = frac(1, 5)(12 - 1 dot 1.25 - (-2) dot 2.7) = frac(1, 5)(16.15) = 3.23 $
  
  $ bold(x)^((1)) = vec(1.25, 2.7, 3.23) $
  
  *Iteration 2* ($k=1$):
  
  *Komponente 1:*
  $ x_1^((2)) = frac(1, 4)(5 - (-1) dot 2.7 - 1 dot 3.23) = frac(1, 4)(3.47) = 0.87 $
  
  *Komponente 2* (nutze neues $x_1^((2)) = 0.87$):
  $ x_2^((2)) = frac(1, 5)(11 - (-2) dot 0.87 - 1 dot 3.23) = frac(1, 5)(9.51) = 1.90 $
  
  *Komponente 3* (nutze neue $x_1^((2)), x_2^((2))$):
  $ x_3^((2)) = frac(1, 5)(12 - 1 dot 0.87 - (-2) dot 1.90) = frac(1, 5)(13.93) = 2.79 $
  
  $ bold(x)^((2)) = vec(0.87, 1.90, 2.79) $
  
  *Schritt 5:* Diagonaldominanz:
  $|4| > |-1| + |1| = 2$ ✓, $|5| > |-2| + |1| = 3$ ✓, $|5| > |1| + |-2| = 3$ ✓
  
  *Schritt 6:* Konvergiert schneller als Jacobi zum gleichen Vektor!
]


== Fehlerabschätzung



#formula[
  Von Jacobi: $B = D^(-1)(L + R) $\
  Von Gauss-Seidel: $B =-(D + L)^(-1) R $

  $ bold(x)^((n+1)) = bold(B) bold(x)^((n)) + bold(c) =: bold(F)(bold(x)^((n))) $

  
  *A-priori Abschätzung:*
  $ ||bold(x)^((n)) - bold(overline(x))|| <= frac(||bold(B)||^n, 1 - ||bold(B)||) ||bold(x)^((1)) - bold(x)^((0))|| $

  $ n >= (log(||bold(x)^((n)) - bold(overline(x))||) + log(1 - ||bold(B)||) - log(||bold(x)^((1)) - bold(x)^((0))||)) / log(||bold(B)||) $

  
  *A-posteriori Abschätzung:*
  $ ||bold(x)^((n)) - bold(overline(x))|| <= frac(||bold(B)||, 1 - ||bold(B)||) ||bold(x)^((n)) - bold(x)^((n-1))|| $
]



== Fehler für gestörte LGS

#remark[
  Die Unedndlichnorm einer Matrix ist das Maximum der absoluten Zeilensummen einer Matrix.
  $ ||bold(A)||_infinity = max_(1 <= i <= n) sum_(j=1)^n |a_(i j)| $

  Die Unedndlichnorm eines Vektors ist das Maximum der absoluten Einträge eines Vektors.
  $ ||bold(b)||_infinity = max_(1 <= i <= n) | $
]

#formula[

#math[
$ tilde(A)= Delta bold(A) + bold(A) $
]

*Konditionszahl*
#math[
  $ kappa_infinity (bold(A)) = ||bold(A)||_infinity ||bold(A)^(-1)||_infinity $
]

*Nur $b$ gestört:*
absoluter Fehler:
#math[
$ ||tilde(bold(x))||_infinity <= ||bold(A)^(-1)||_infinity ||tilde(bold(b))||_infinity $
]

relativer Fehler:\
#math[
  $ (||tilde(bold(x))||_infinity)/(||bold(x)||_infinity)  <= (||bold(A)^(-1)||_infinity ||tilde(bold(b))||_infinity)/(||bold(x)||_infinity) \ "oder:" quad
  kappa_infinity (bold(A)) (||tilde(bold(b))||_infinity)/(||bold(b)||_infinity). $
]

- Nur $bold(A)$ gestört:

#math[
$ (||tilde(bold(x))||_infinity)/(||bold(x)||_infinity) <= (kappa_infinity (bold(A)) (||Delta bold(A)||_infinity)/(||bold(A)||_infinity))/(1 - kappa_infinity (bold(A)) (||Delta bold(A)||_infinity)/(||bold(A)||_infinity)). $
]

- $bold(A)$ und $b$ gestört:

#math[
$ (||bold(x) - tilde(bold(x))||_infinity)/(||bold(x)||_infinity) <= (kappa_infinity (bold(A)))/(1 - kappa_infinity (bold(A)) (||Delta bold(A)||_infinity)/(||bold(A)||_infinity)) ((||Delta bold(A)||_infinity) / (||bold(A)||_infinity) + (||tilde(bold(b))||_infinity) / (||bold(b)||_infinity)). $
]
- Direkter Weg:
#math[
$ bold(x) = bold(A)^(-1) bold(b), quad tilde(bold(x)) = tilde(bold(A))^(-1) tilde(bold(b)), quad "Fehler" = (||bold(x) - tilde(bold(x))||_infinity)/(||bold(x)||_infinity). $
]
]

#steps[
  *Schritt 1:* Berechne $kappa_infinity (bold(A))$
  
  *Schritt 2:* Wähle die passende Formel (nur $b$, nur $A$, oder beides gestört)
  
  *Schritt 3:* Setze die Werte ein und berechne den Fehler
]

#example[
  *Gegeben:* Lineares Gleichungssystem $A x = b$ mit gestörtem $b$:
  
  $ A = mat(2, 0, 3; 1, -2, 1; 0, 3, 1), quad bold(b) = vec(4, 2 epsilon, 2 + epsilon) $
  
  Dabei ist $epsilon$ eine kleine Störung (z.B. Rundungsfehler).
  
  *Schritt 1:* Berechne $kappa_infinity (bold(A))$
  
  Zeilensummen von $A$:
  - Zeile 1: $|2| + |0| + |3| = 5$
  - Zeile 2: $|1| + |-2| + |1| = 4$
  - Zeile 3: $|0| + |3| + |1| = 4$
  
  $ ||A||_infinity = max(5, 4, 4) = 5 $
  
  Zeilensummen von $A^(-1)$:
  - Zeile 1: $|5| + |-9| + |-6| = 5 + 9 + 6 = 20$
  - Zeile 2: $|1| + |-2| + |-1| = 1 + 2 + 1 = 4$
  - Zeile 3: $|-3| + |6| + |4| = 3 + 6 + 4 = 13$
  
  $ ||A^(-1)||_infinity = max(20, 4, 13) = 20 $
  
  $ kappa_infinity(A) = ||A||_infinity dot ||A^(-1)||_infinity = 5 dot 20 = 100 $
  
  *Schritt 2:* Wähle die passende Formel
  
  Da nur $b$ gestört ist (mit Störung $epsilon$), verwenden wir:
  
  $ (||tilde(x) - x||_infinity) / (||x||_infinity) <= kappa_infinity(A) (||Delta b||_infinity) / (||b||_infinity) $
  
  *Schritt 3:* Setze die Werte ein und berechne den Fehler
  
  - Originales $b = vec(4, 2epsilon, 2+epsilon)$ (eigentlich sollte dies $vec(4, 2, 2)$ sein, Störung ist $epsilon$)
  - Gestörtes $tilde(b) = vec(0, 2epsilon, epsilon)$
  - $||b||_infinity = 4$
  
  $ (||tilde(x) - x||_infinity) / (||x||_infinity) approx kappa_infinity(A) dot frac(epsilon, 4) $
  
  *Interpretation:* 
  - Wenn $kappa_infinity(A)$ klein ist: kleine Störungen führen zu kleinen Fehlern (gut konditioniert)
  - Wenn $kappa_infinity(A)$ groß ist: kleine Störungen können zu großen Fehlern führen (schlecht konditioniert)
]


=== Definition 4.6: Eigenwert

#formula[
  $ bold(A) dot bold(v) = lambda dot bold(v) $
  
  $lambda in bb(C)$ = Eigenwert, $bold(v) != bold(0)$ = Eigenvektor
]

=== Vorgehen: Eigenwerte

#steps[
  *Schritt 1:* bilde $A - lambda I$
  
  *Schritt 2:* finde Charakteristisches Polynom (char).
  
  *Schritt 3:* löse $"char" = 0$ (finde $lambda$)
  
  *Schritt 4:* Für jeden $lambda$: $(bold(A) - lambda bold(I)) bold(v) = bold(0)$
]

=== Beispiel 4.7: Eigenwerte 2×2

#example[
  *Gegeben:* $bold(A) = mat(4, 1; 2, 3)$
  
  *Schritt 1:* Bilde $bold(A) - lambda bold(I)$:
  $ bold(A) - lambda bold(I) = mat(4 - lambda, 1; 2, 3 - lambda) $
  
  *Schritt 2:* Charakteristisches Polynom (Determinante):
  $ det(bold(A) - lambda bold(I)) = (4 - lambda)(3 - lambda) - 1 dot 2 $
  $ = lambda^2 - 7lambda + 12 - 2 $
  $ p(lambda) = lambda^2 - 7lambda + 10 $
  
  *Schritt 3:* Löse $p(lambda) = 0$ (pq-Formel):
  $ lambda_(1,2) = 7/(2) plus.minus sqrt((7/(2))^2 - 10) $
  $ lambda_(1,2) = 7/(2) plus.minus sqrt(49/4 - 10) = 7/(2) plus.minus sqrt(9/4) = 7/(2) plus.minus 3/(2) $
  $ lambda_1 = 5, quad lambda_2 = 2 $
  
  *Schritt 4:* Eigenvektor zu $lambda_1 = 5$:
  $ (bold(A) - 5 bold(I)) bold(v) = vec(0) $
  $ mat(4 - 5, 1; 2, 3 - 5) vec(v_1, v_2) = vec(0, 0) $
  $ mat(-1, 1; 2, -2) vec(v_1, v_2) = vec(0, 0) $
  
  *Beobachtung:* Zeile 2 ist $-2$ mal Zeile 1:
  $ mat(-1, 1; 2, -2) = mat(-1, 1; -2 dot (-1), -2 dot 1) $
  
  Dies führt zur Zeilenreduktion:
  $ mat(-1, 1; 0, 0) vec(v_1, v_2) = vec(0, 0) $
  
  Aus der (einzigen unabhängigen) Gleichung: $-v_1 + v_2 = 0 => v_2 = v_1$
  
  $ bold(v)_1 = bold(v)_2 = u dot vec(1, 1), quad u in RR quad text("(Eigenvektor zu") lambda_1 = 5 text(")") $
  
  Eigenvektor zu $lambda_2 = 2$:
  $ (bold(A) - 2 bold(I)) bold(v) = vec(0) $
  $ mat(4 - 2, 1; 2, 3 - 2) vec(v_1, v_2) = vec(0, 0) $
  $ mat(2, 1; 2, 1) vec(v_1, v_2) = vec(0, 0) $
  
  Erste Gleichung: $2v_1 + v_2 = 0 => v_2 = -2v_1$
  
  $ bold(v)_2 = vec(1, -2) quad text("(Eigenvektor zu") lambda_2 = 2 text(")") $
]

=== Vorgehen: Potenzmethode

#steps[
  *Schritt 1:* Startvektor $bold(v)^((0))$ wählen (zufällig)
  
  *Schritt 2:* Iteration:
  $ bold(w)^((k)) = bold(A) bold(v)^((k-1)) $
  
  *Schritt 3:* Normieren:
  $ bold(v)^((k)) = bold(w)^((k)) / (||bold(w)^((k))||) $
  
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


== komplexe Zahlen


=== Darstellungen


#formula[
*Normalform (kartesisch):*
$ z = x + i y $

*Trigonometrische Form (polar):*
$ z = r (cos(phi) + i sin(phi)) $

*Exponentialform:*
$ z = r e^(i phi) $

Dabei gilt: $r >= 0$ und $phi$ ist der Winkel.
]

=== Umrechnen: Normalform -> Polar/Expo


#example[

Gegeben $z = x + i y$:

*Betrag:*
$ r = |z| = sqrt(x^2 + y^2) $

*Winkel:*
$ phi = arg(z) $


Praktisch rechnet man zuerst
$ phi_0 = arctan(y/x) $
und korrigiert dann den Quadranten:

- falls $x > 0$: $ phi = phi_0 $
- falls $x < 0$ und $y >= 0$: $ phi = phi_0 + pi $
- falls $x < 0$ und $y < 0$: $ phi = phi_0 - pi $
- falls $x = 0$ und $y > 0$: $ phi = pi/2 $
- falls $x = 0$ und $y < 0$: $ phi = -pi/2 $

Hinweis: Viele Taschenrechner/Programmiersprachen haben `atan2(y, x)`,
das liefert direkt den richtigen Winkel:
$ phi = a t a n 2(y, x) $.

Dann:
$ z = r (cos(phi) + i sin(phi)) = r e^(i phi) $.

]

=== Umrechnen: Polar/Expo -> Normalform

#example[


Gegeben $z = r (cos(phi) + i sin(phi))$ oder $z = r e^(i phi)$:

*Realteil und Imaginärteil:*
$ x = r cos(phi) $
$ y = r sin(phi) $

Also:
$ z = x + i y = r cos(phi) + i r sin(phi) $.
]

#colbreak()

=== algebraische Operationen

*Konjugation:* $z^* = x - i y $ \
*Betrag:* $|z| = sqrt(x^2 + y^2) $

=== Grundrechenarten komplexer Zahlen
Gegeben seien zwei komplexe Zahlen in der Normalform:\
$z_1 = x_1 + i y_1 quad$,$quad z_2 = x_2 + i y_2.$



*Summe*

$ z_1 + z_2 = (x_1 + x_2) + i (y_1 + y_2) $

*Differenz*

$ z_1 - z_2 = (x_1 - x_2) + i (y_1 - y_2) $

*Produkt*
$ z_1 z_2 = (x_1 + i y_1)(x_2 + i y_2) $

Ausmultiplizieren und $i^2=-1$ benutzen:
$ z_1 z_2 = (x_1 x_2 - y_1 y_2) + i (x_1 y_2 + x_2 y_1) $

$ z_1 z_2
= (r_1 e^(i phi_1))(r_2 e^(i phi_2))
= (r_1 r_2) e^(i (phi_1 + phi_2)). $

*Division*

Für $z_2 != 0$ gilt:
$ (z_1)/(z_2) = (x_1 + i y_1)/(x_2 + i y_2). $

Mit dem konjugiert Komplexen $z_2^* = x_2 - i y_2$:

$ (z_1)/(z_2)
= (z_1 z_2^*)/(z_2 z_2^*)
= ((x_1 + i y_1)(x_2 - i y_2))/((x_2 + i y_2)(x_2 - i y_2)) $

Nenner:
$ (x_2 + i y_2)(x_2 - i y_2) = x_2^2 + y_2^2 $

Zähler:
$ (x_1 + i y_1)(x_2 - i y_2)
= (x_1 x_2 + y_1 y_2) + i (y_1 x_2 - x_1 y_2) $

Damit:
$ (z_1)/(z_2)
= (x_1 x_2 + y_1 y_2)/(x_2^2 + y_2^2)
  + i (y_1 x_2 - x_1 y_2)/(x_2^2 + y_2^2) $

In Exponentialform:\
Für $z_2 != 0$ (also $r_2 > 0$):
$ (z_1)/(z_2)
= (r_1 e^(i phi_1))/(r_2 e^(i phi_2))
= (r_1/r_2) e^(i (phi_1 - phi_2)). $

*Wurzel*
#formula[
Die $n$-ten Wurzeln von $z = r e^(i phi)$ sind:
$ z_k = r^(1/n) e^(i (phi + 2 k pi)/n) quad "für" quad "k = 0,1, ... , n-1" $ 
]

#example[
  *Gegeben:* $z = 4$ (reelle Zahl), gesucht: kubische Wurzeln ($n=3$)
  
  *Schritt 1:* In Exponentialform umwandeln:
  $ r = |4| = 4, quad phi = 0 $
  $ z = 4 e^(i dot 0) $
  
  *Schritt 2:* Wurzeln berechnen mit Formel:
  $ z_k = 4^(1/3) e^(i (0 + 2 k pi)/3) quad "für" quad k = 0, 1, 2 $
  
  *Schritt 3:* Die drei Wurzeln:
  
  $ z_0 = 4^(1/3) e^(i dot 0) = 4^(1/3) approx 1.587 $
  
  $ z_1  = 4^(1/3) (-0.5 + i 0.866) $
  
  $ z_2  = 4^(1/3) (-0.5 - i 0.866) $
  
  *Geometrisch:* Die drei Wurzeln liegen gleichmäßig auf einem Kreis mit Radius $4^(1/3) approx 1.587$, verteilt um $120°$ auseinander.
]