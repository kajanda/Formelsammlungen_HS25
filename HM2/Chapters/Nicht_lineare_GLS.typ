#import "../../style.typ": formula, example, steps, math, definition, variables, remark

= Nichtlineare Gleichungssysteme

#definition()[
Ein *nichtlineares Gleichungssystem* ist ein System der Form
$
f(x) = 0
$
mit
$
f: RR^n -> RR^n,
$
bei dem mindestens eine Komponente von $f$ nicht linear ist.

Gesucht ist ein Vektor
$
x^* in RR^n
$
mit
$
f(x^*) = 0.
$
]

#variables()[
- $x = (x_1, dots, x_n)^T$: Unbekannter Vektor
- $f(x) = (f_1(x), dots, f_n(x))^T$: vektorwertige Funktion
- $x^*$: gesuchte Nullstelle
]

#example()[
*Einleitendes Beispiel:*

*Gegeben:*
$
f(x_1, x_2) =
vec(
  x_1^2 + x_2 - 11,
  x_1 + x_2^2 - 7
)
$

*Gesucht:* Nullstellen von $f$, also Schnittpunkte der Kurven
$
x_1^2 + x_2 - 11 = 0
$
und
$
x_1 + x_2^2 - 7 = 0.
$

*Idee:* Eine Lösung des Systems ist genau ein Punkt, in dem beide Gleichungen gleichzeitig erfüllt sind.
]

== Funktionen mit mehreren Variablen

#formula()[

*Skalarwertige Funktion:*
$
f: RR^n -> RR
$

#math()[$
(x_1, x_2, dots, x_n) -> f(x_1, x_2, dots, x_n)
$]

*Vektorwertige Funktion:*
$
f: RR^n -> RR^m
$

#math()[$
f(x_1, dots, x_n) =
vec(
  f_1(x_1, dots, x_n),
  f_2(x_1, dots, x_n),
  dots.v,
  f_m(x_1, dots, x_n)
)
$]
]

#example()[
*Beispiel einer vektorwertigen Funktion:*

*Gegeben:*
$
f(x_1, x_2) =
vec(
  x_1^2 + x_2 - 11,
  x_1 + x_2^2 - 7
)
$

*Lösungsidee:* Jede Komponente $f_i$ ist eine skalare Funktion. Zusammen bilden sie eine Abbildung
$
RR^2 -> RR^2.
$
]

== Partielle Ableitungen

#definition()[
Die *partielle Ableitung* beschreibt die Änderung einer Funktion in Richtung einer Variablen, während alle anderen Variablen konstant gehalten werden.
]

#variables()[
- $f_x(x,y) = frac(partial f, partial x)(x,y)$
- $f_y(x,y) = frac(partial f, partial y)(x,y)$
]

#formula()[
#math()[$
frac(partial f, partial x)(x,y)
= lim_(Delta x -> 0)
frac(f(x + Delta x, y) - f(x,y), Delta x)
$]

#math()[$
frac(partial f, partial y)(x,y)
= lim_(Delta y -> 0)
frac(f(x, y + Delta y) - f(x,y), Delta y)
$]
]

#steps()[
*Vorgehen bei partiellen Ableitungen:*
1. Für $f_x$: nach $x$ ableiten, alle anderen Variablen konstant halten
2. Für $f_y$: nach $y$ ableiten, alle anderen Variablen konstant halten
3. Danach an der gefragten Stelle auswerten
]

#example()[
*Beispiel:*

*Gegeben:*
$
f(x,y) = 3x y^2 + ln(x^3 y^2)
$

*x-Ableitung wählen:*
$
f_x(x,y) = 3y^2 + frac(3, x)
$

*y-Ableitung wählen:*
$
f_y(x,y) = 6x y + frac(2, y)
$

*An der Stelle $(-1,1)$ auswerten:*
$
f_x(-1,1) = 3 - 3 = 0
$
$
f_y(-1,1) = -6 + 2 = -4
$

*Lösung:*
$
f_x(-1,1) = 0, quad f_y(-1,1) = -4
$
]

#remark()[
Partielle Ableitungen geben die lokale Änderungsrate in Richtung der jeweiligen Variablen an.
]

== Jacobi-Matrix und Linearisierung

#definition()[
Die *Jacobi-Matrix* einer Funktion
$
f: RR^n -> RR^m
$
ist die Matrix aller partiellen Ableitungen erster Ordnung.
]

#formula()[
*Jacobi-Matrix:*
#math()[$
D f(x) =
mat(
  frac(partial f_1, partial x_1)(x), frac(partial f_1, partial x_2)(x), dots, frac(partial f_1, partial x_n)(x);
  frac(partial f_2, partial x_1)(x), frac(partial f_2, partial x_2)(x), dots, frac(partial f_2, partial x_n)(x);
  dots, dots, dots, dots;
  frac(partial f_m, partial x_1)(x), frac(partial f_m, partial x_2)(x), dots, frac(partial f_m, partial x_n)(x)
)
$]

*Linearisierung in $x^(0)$:*
#math()[$
g(x) = f(x^(0)) + D f(x^(0)) (x - x^(0))
$]
]

#steps()[
*Vorgehen für die Jacobi-Matrix:*
1. Jede Komponente $f_i$ einzeln betrachten
2. Nach jeder Variablen $x_j$ partiell ableiten
3. Alle Ableitungen in Matrixform anordnen
4. Für die Linearisierung alles in $x^(0)$ einsetzen
]

#example()[
*Beispiel zur Jacobi-Matrix:*

*Gegeben:*
$
f(x_1, x_2) = vec(
  x_1^2 + x_2 - 11,
  x_1 + x_2^2 - 7
)
$

*Partielle Ableitungen bestimmen:*
$
D f(x_1, x_2) = mat(
  2x_1, 1;
  1, 2x_2
)
$

*In $x^(0) = vec(1,1)$ einsetzen:*
$
f(x^(0)) = vec(-9,-5)
$
$
D f(x^(0)) = mat(
  2, 1;
  1, 2
)
$

*Linearisierung aufstellen:*
$
g(x) = f(x^(0)) + D f(x^(0))(x - x^(0))
$

*Ausmultiplizieren:*
$
g(x_1, x_2) = vec(
  2x_1 + x_2 - 12,
  x_1 + 2x_2 - 8
)
$

*Lösung:* Die linearisierte Funktion ist
$
g(x_1, x_2) = vec(
  2x_1 + x_2 - 12,
  x_1 + 2x_2 - 8
).
$
]

#remark()[
Nahe bei $x^(0)$ gilt:
$
f(x) approx g(x).
$
]

== Problemstellung

#definition()[
Gesucht ist eine Nullstelle von
$
f: RR^n -> RR^n,
$
also ein Vektor
$
x^* in RR^n
$
mit
$
f(x^*) = 0.
$
]

#formula()[
#math()[$
f(x^*) = 0
quad <=> quad
f_i(x^*) = 0
quad "für alle" quad i = 1, dots, n
$]
]

#remark()[
Nichtlineare Systeme können mehrere Nullstellen besitzen. Welche Nullstelle gefunden wird, hängt oft stark vom Startvektor ab.
]

== Newton-Verfahren für Systeme

#definition()[
Das *Newton-Verfahren für Systeme* ersetzt $f$ in der Umgebung von $x^(n)$ durch seine Linearisierung und bestimmt daraus den nächsten Näherungsvektor.
]

#formula()[
Aus
#math()[$
0 approx f(x^(n)) + D f(x^(n))(x^(n+1) - x^(n))
$]

folgt mit
#math()[$
delta^(n) = x^(n+1) - x^(n)
$]

die Newton-Gleichung
#math()[$
D f(x^(n)) delta^(n) = -f(x^(n))
$]

und der Schritt
#math()[$
x^(n+1) = x^(n) + delta^(n)
$]
]

#steps()[
*Algorithmus:*
1. Startvektor $x^(0)$ wählen
2. $f(x^(n))$ berechnen
3. $D f(x^(n))$ berechnen
4. Das lineare Gleichungssystem
   $ D f(x^(n)) delta^(n) = -f(x^(n)) $
   lösen
5. Mit
   $ x^(n+1) = x^(n) + delta^(n) $
   aktualisieren
]

#example()[
*Erster Newton-Schritt:*

*Gegeben:*
$
f(x_1, x_2) = vec(
  2x_1 + 4x_2,
  4x_1 + 8x_2^3
)
$
und
$
x^(0) = vec(4,2).
$

*Jacobi-Matrix bestimmen:*
$
D f(x_1, x_2) = mat(
  2, 4;
  4, 24x_2^2
)
$

*Am Startpunkt auswerten:*
$
f(4,2) = vec(16,80)
$
$
D f(4,2) = mat(
  2, 4;
  4, 96
)
$

*Newton-Gleichung lösen:*
$
mat(
  2, 4;
  4, 96
) delta^(0) = -vec(16,80)
$

$
delta^(0) = -vec(frac(76,11), frac(6,11))
$

*Schritt berechnen:*
$
x^(1) = x^(0) + delta^(0)
= vec(-frac(32,11), frac(16,11))
approx vec(-2.909, 1.455)
$

*Lösung:* Nach dem ersten Newton-Schritt erhält man
$
x^(1) = vec(-frac(32,11), frac(16,11)).
$
]

=== Quadratisch-konvergentes Newton-Verfahren

#definition()[
Liegt der Startvektor nahe genug bei einer Nullstelle $x^*$, ist $D f(x^*)$ regulär und ist $f$ genügend glatt, dann konvergiert das Newton-Verfahren lokal *quadratisch*.
]

#variables()[
*Mögliche Abbruchkriterien:*
- $n >= n_"max"$
- $norm(x^(n+1) - x^(n)) <= epsilon$
- $norm(x^(n+1) - x^(n)) <= norm(x^(n+1)) epsilon$
- $norm(f(x^(n+1))) <= epsilon$
]

=== Vereinfachtes Newton-Verfahren

#definition()[
Beim *vereinfachten Newton-Verfahren* wird die Jacobi-Matrix nur einmal am Startpunkt berechnet und danach in allen Iterationen weiterverwendet.
]

#formula()[
#math()[$
D f(x^(0)) delta^(n) = -f(x^(n))
$]

#math()[$
x^(n+1) = x^(n) + delta^(n)
$]
]

#steps()[
*Vorgehen beim vereinfachten Newton:*
1. Einmalig $D f(x^(0))$ berechnen
2. In jeder Iteration
   $D f(x^(0)) delta^(n) = -f(x^(n))$
   lösen
3. Danach wie üblich Schritt berechnen
]

#remark()[
Das vereinfachte Newton-Verfahren ist pro Schritt billiger, konvergiert aber im Allgemeinen nur noch linear.
]

#example()[
*Beispiel:*

*Gegeben:* Dasselbe System wie oben
$
f(x_1, x_2) = vec(
  2x_1 + 4x_2,
  4x_1 + 8x_2^3
)
$
mit festgehaltener Jacobi-Matrix
$
D f(x^(0)).
$

*Idee:* Man ersetzt in jeder Iteration
$
D f(x^(n)) "durch" D f(x^(0)).
$


*Folge:* Weniger Rechenaufwand pro Iteration, aber typischerweise langsamere Konvergenz.
]

=== Gedämpftes Newton-Verfahren

#definition()[
Beim *gedämpften Newton-Verfahren* wird der Newton-Schritt verkleinert, falls der volle Schritt keine Verbesserung liefert. Dadurch wird das Verfahren robuster.
]

#formula()[
#math()[$
D f(x^(n)) delta^(n) = -f(x^(n))
$]

#math()[$
x^(n+1) = x^(n) + frac(1, 2^k) delta^(n)
$]
]

#steps()[
*Vorgehen beim gedämpften Newton:*
1. Zuerst den Newton-Schritt $delta^(n)$ berechnen
2. $k = 0, 1, 2, dots, k_"max"$ testen
3. Das kleinste $k$ wählen mit
   $ norm(f(x^(n) + delta^(n) / 2^k))_2 < norm(f(x^(n)))_2 $
4. Falls kein solches $k$ gefunden wird, mit $k = 0$ weiterrechnen
5. Dann
   $ x^(n+1) = x^(n) + delta^(n) / 2^k $
   setzen
]

#remark()[
Wenn kein sinnvoller Wert bekannt ist, wird im Skript oft mit
$
k_"max" = 4
$
gestartet.
]

#example()[
*Erster gedämpfter Newton-Schritt:*

*Gegeben:*
$
f(x) = arctan(x)
$
und
$
x^(0) = 2.
$

*Ableitung bestimmen:*
$
f'(x) = frac(1, 1 + x^2)
$

*Am Startpunkt auswerten:*
$
f(2) = arctan(2) approx 1.1071
$
$
f'(2) = frac(1, 5) = 0.2
$

*Newton-Gleichung lösen:*
$
0.2 dot delta^(0) = -1.1071
$

$
delta^(0) = -5 arctan(2) approx -5.5357
$

*Dämpfung testen* ($k_"max" = 4$):
- $k = 0$: $x^(0) + delta^(0) approx -3.5357$, $|f| approx 1.2952 > 1.1071$ ✗
- $k = 1$: $x^(0) + delta^(0) \/ 2 approx -0.7679$, $|f| approx 0.6550 < 1.1071$ ✓

Das kleinste passende $k$ ist also $k = 1$.

*Schritt berechnen:*
$
x^(1) = x^(0) + frac(delta^(0), 2^1)
approx -0.7679
$

*Lösung:* Nach dem ersten gedämpften Newton-Schritt erhält man
$
x^(1) approx -0.7679.
$
]

#remark()[

#table(
  columns: 3, rows:3,

  // Kopfzeile
  [*Jacobi-Matrix*], [*konvergiert*], [*divergiert / keine Konvergenz*],

  // Zeile 1
  [*invertierbar*],
  [⇒ Grenzwert ist Nullstelle ($F(x^*) = 0$)],
  [⇒ keine sichere Aussage],

  // Zeile 2
  [*singulär*],
  [⇒ Nullstelle ODER keine Nullstelle (z. B. Minimum von ‖F‖²)],
  [⇒ keine sichere Aussage],
)

 Konvergenz einer Newton-Folge allein genügt nicht. Der Grenzpunkt muss zusätzlich wirklich eine Nullstelle sein, und eine singuläre Jacobi-Matrix am Grenzpunkt ist ein Warnsignal.

]


== Prüfungsblock

#formula()[
*Die 4 Kernformeln:*

#math()[$
D f(x) = (frac(partial f_i, partial x_j)(x))_(i,j)
$]

#math()[$
g(x) = f(x^(0)) + D f(x^(0))(x - x^(0))
$]

#math()[$
D f(x^(n)) delta^(n) = -f(x^(n))
$]

#math()[$
x^(n+1) = x^(n) + delta^(n)
$]
]

#steps()[
*Prüfungsroutine:*
1. Funktion $f$ sauber aufschreiben
2. Jacobi-Matrix bestimmen
3. Newton-Gleichung aufstellen
4. lineares Gleichungssystem lösen
5. Schritt berechnen
6. Abbruchkriterium prüfen
]

#remark()[
*Unterschiede der Verfahren:*
- Newton: schnell, aber pro Schritt teurer
- vereinfacht: billiger, aber langsamer
- gedämpft: robuster bei schwierigen Startwerten
]

