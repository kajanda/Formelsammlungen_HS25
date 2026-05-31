#import "../../style.typ": formula, example, steps, math, definition, variables, remark

= Ausgleichsrechnung

#definition()[
Die *Ausgleichsrechnung* sucht zu gegebenen Datenpunkten eine Funktion, die die Werte möglichst gut annähert.

Im Unterschied zur Interpolation müssen die Punkte nicht exakt getroffen werden.
]

#variables()[
- $(x_i,y_i)$: gegebene Datenpunkte
- $f$: Ausgleichsfunktion
- $lambda$: Parameter der Ansatzfunktion
- $E(lambda)$: Fehlerfunktional
]

== Interpolation

#definition()[
Bei der *Interpolation* wird eine Funktion gesucht mit
$
f(x_i)=y_i
$
für alle gegebenen Stützpunkte.
]

#formula()[
*Interpolationsbedingung:*
#math()[$
f(x_i)=y_i, quad i=0,1,dots,n
$]
]

#formula()[
*Lagrange-Verfahren:*

*Interpolationspolynom:*
#math()[$
P_n(x)=sum_(i=0)^n y_i L_i(x)
$]

*Lagrange-Basisfunktion:*
#math()[$
L_i(x)=product_(j=0, j != i)^n frac(x-x_j, x_i-x_j)
$]

*Basisfunktionen für 1. Grad ($n=1$):*
#math()[$
L_0(x)=frac(x-x_1,x_0-x_1), quad L_1(x)=frac(x-x_0,x_1-x_0)
$]

*Polynom 1. Grades:*
#math()[$
P_1(x)=y_0 L_0(x)+y_1 L_1(x)
$]
]

#steps()[
*Vorgehen bei Interpolation 3. Grades (Lagrange) mit 4 Punkten:*
1. Stützpunkte $(x_0,y_0)$, $(x_1,y_1)$, $(x_2,y_2)$, $(x_3,y_3)$ identifizieren
2. Lagrange-Basisfunktionen aufstellen:
$
l_0=frac(x-x_1,x_0-x_1) dot frac(x-x_2,x_0-x_2) dot frac(x-x_3,x_0-x_3)
$
$
l_1=frac(x-x_0,x_1-x_0) dot frac(x-x_2,x_1-x_2) dot frac(x-x_3,x_1-x_3)
$
$
l_2=frac(x-x_0,x_2-x_0) dot frac(x-x_1,x_2-x_1) dot frac(x-x_3,x_2-x_3)
$
$
l_3=frac(x-x_0,x_3-x_0) dot frac(x-x_1,x_3-x_1) dot frac(x-x_2,x_3-x_2)
$
3. Polynom: $P_n(x)=sum_(i=0)^n l_i (x) dot y_i$
]

#example()[
*Beispiel:*

*Gegeben:* $x=[0,250,500,1000]$, $y=[1013,747,540,226]$

*Gesucht:* $y$-Wert bei $x=375$

*Basisfunktionen:*

#set text(size: 0.85em)
$
l_0 = frac(375-250,0-250) dot frac(375-500,0-500) dot frac(375-1000,0-1000) = -0.078
$
$
l_1 = frac(375-0,250-0) dot frac(375-500,250-500) dot frac(375-1000,250-1000) = 0.625
$
$
l_2 = frac(375-0,500-0) dot frac(375-250,500-250) dot frac(375-1000,500-1000) = 0.469
$
$
l_3 = frac(375-0,1000-0) dot frac(375-250,1000-250) dot frac(375-500,1000-500) = -0.016
$

#set text(size: 1em)
*Auswertung:*
$
P_n(375) = -0.078 dot 1013 + 0.625 dot 747 + 0.469 dot 540 + (-0.016) dot 226
$
$
P_n(375) = 637.328 "hPa"
$
]
=== Fehlerabschätzung

#definition[
Sind die Stützwerte $y_i$ Funktionswerte einer genügend oft stetig differenzierbaren Funktion $f$, also
$
y_i = f(x_i),
$
dann lässt sich der Fehler der Polynominterpolation an einer Stelle $x$ abschätzen.
]

#formula[
Für das Interpolationspolynom $P_n(x)$ gilt:
#math()[
$
abs(f(x) - P_n(x)) <=
$
$

abs((x - x_0)(x - x_1) dots (x - x_n)) / (n + 1)!
max_(x_0 <= xi <= x_n) abs(f^((n+1))(xi))
$
]
]

#variables()[
  $f(x)$: ursprüngliche Funktion

  $P_n(x)$: Interpolationspolynom vom Grad $n$

  $x_0, x_1, dots, x_n$: Stützstellen

  $f^((n+1))(xi)$: $(n+1)$-te Ableitung von $f$ an der Stelle $xi$
]

#steps[
*Vorgehen bei der Fehlerabschätzung:*
1. Grad $n$ bestimmen (Anzahl Stützstellen $= n + 1$)
2. Knotenpolynom $abs((x - x_0)(x - x_1) dots (x - x_n))$ an der gesuchten Stelle $x$ auswerten
3. $(n+1)$-te Ableitung von $f$ bilden und das Maximum von $abs(f^((n+1)))$ auf $[x_0, x_n]$ abschätzen
4. Alles in die Fehlerformel einsetzen
]

#example[
*Beispiel:*

*Gegeben:* Die Funktion
$
f(x) = e^x
$
wird an den Stützstellen
$
x_0 = 0, quad x_1 = 1, quad x_2 = 2
$
durch ein Polynom $P_2(x)$ vom Grad $n = 2$ interpoliert.

*Gesucht:* Eine Fehlerschranke für die Stelle $x = 0.5$.

*1. Knotenpolynom auswerten:*
$
abs((x - x_0)(x - x_1)(x - x_2))
= abs((0.5)(0.5 - 1)(0.5 - 2))
$
$
= abs(0.5 dot (-0.5) dot (-1.5)) = 0.375
$

*2. $(n+1)$-te Ableitung und Maximum:*
$
f^((3))(x) = e^x, quad
max_(0 <= xi <= 2) abs(e^xi) = e^2 approx 7.389
$

*3. In die Fehlerformel einsetzen* ($(n+1)! = 3! = 6$):
$
abs(f(0.5) - P_2(0.5))
<= frac(0.375, 6) dot 7.389
approx 0.462
$

*Lösung:* Der Interpolationsfehler an der Stelle $x = 0.5$ ist betragsmässig höchstens
$
abs(f(0.5) - P_2(0.5)) <= 0.462.
$
]


=== Kubische Splinefunktion

#definition[
Eine Splinefunktion ist eine stückweise definierte Funktion, bei der auf jedem Intervall $[x_i, x_(i+1)]$ ein eigenes Polynom verwendet wird.

Bei der *kubischen Splinefunktion* ist auf jedem Teilintervall ein Polynom 3. Grades gegeben. Ziel ist es, die Stützpunkte zu interpolieren und dabei eine glatte Kurve ohne Knicke zu erhalten.
]

#remark()[
*Motivation:*
Interpolationspolynome hohen Grades oszillieren oft stark. Splines vermeiden diese Schwingungen, weil sie stückweise mit Polynomen kleinen Grades arbeiten und die Übergänge glatt machen.
]

#formula[
Für jedes Intervall $[x_i, x_(i+1)]$ mit $i = 0, 1, dots, n-1$ wird ein kubisches Polynom angesetzt:
#math()[
$
S_i(x) = a_i + b_i (x - x_i) + c_i (x - x_i)^2 + d_i (x - x_i)^3
$
]

Die gesamte Splinefunktion ist dann
#math()[
$
S(x) = S_i(x) quad "für" x in [x_i, x_(i+1)].
$
]
]

#variables()[
  $x_i$: Knoten bzw. Stützstellen mit $x_0 < x_1 < dots < x_n$

  $y_i$: zugehörige Funktionswerte

  $h_i = x_(i+1) - x_i$: Intervalllänge

  $a_i, b_i, c_i, d_i$: Koeffizienten des kubischen Polynoms auf dem $i$-ten Intervall
]

#definition[
Damit eine kubische Splinefunktion entsteht, müssen die Teilpolynome folgende Bedingungen erfüllen:

1. *Interpolation der Stützpunkte*  
   Die Splinefunktion geht durch alle gegebenen Punkte.

2. *Stetiger Übergang*  
   Die Funktionswerte passen an den Knoten zusammen.

3. *Stetigkeit der ersten Ableitung*  
   An den Übergängen entstehen keine Knicke.

4. *Stetigkeit der zweiten Ableitung*  
   Die Krümmung stimmt an den Übergängen überein.
]

#formula[
Die Bedingungen lauten allgemein:

#math()[
$
S_i(x_i) = y_i, quad S_i(x_(i+1)) = y_(i+1)
$
]

#math()[
$
S_i(x_(i+1)) = S_(i+1)(x_(i+1))
$
]

#math()[
$
S_i'(x_(i+1)) = S_(i+1)'(x_(i+1))
$
]

#math()[
$
S_i''(x_(i+1)) = S_(i+1)''(x_(i+1))
$
]
]

#remark()[
*Wichtig:*
Diese Bedingungen allein reichen noch nicht aus. Es werden zusätzlich zwei Randbedingungen benötigt.
]

=== Natürliche kubische Splinefunktion

#definition[
Bei der *natürlichen kubischen Splinefunktion* werden die Randbedingungen
#math()[
$
S''(x_0) = 0, quad S''(x_n) = 0
$
]
verwendet.

Im Skript bedeutet das:
#math()[
$
c_0 = 0, quad c_n = 0.
$
]
]

#formula[
Für die natürliche kubische Splinefunktion gelten die Koeffizienten:

#math()[
$
a_i = y_i
$
]

#math()[
$
h_i = x_(i+1) - x_i
$
]

#math()[
$
c_0 = 0, quad c_n = 0
$
]

Die inneren Koeffizienten $c_1, c_2, dots, c_(n-1)$ erhält man aus einem linearen Gleichungssystem.

Für $i = 1$:
#math()[
$
2(h_0 + h_1)c_1 + h_1 c_2
= 3 frac(y_2 - y_1, h_1) - 3 frac(y_1 - y_0, h_0)
$
]

Für $i = 2, dots, n-2$:
#math()[
$
h_(i-1) c_(i-1) + 2(h_(i-1) + h_i)c_i + h_i c_(i+1)
= 3 frac(y_(i+1) - y_i, h_i) - 3 frac(y_i - y_(i-1), h_(i-1))
$
]

Für $i = n-1$:
#math()[
$
h_(n-2)c_(n-2) + 2(h_(n-2) + h_(n-1))c_(n-1)
= 3 frac(y_n - y_(n-1), h_(n-1)) - 3 frac(y_(n-1) - y_(n-2), h_(n-2))
$
]

Danach berechnet man
#math()[
$
b_i = frac(y_(i+1) - y_i, h_i) - frac(h_i, 3)(c_(i+1) + 2c_i)
$
]

#math()[
$
d_i = frac(c_(i+1) - c_i, 3h_i)
$
]
]
 
#steps[
*Vorgehen bei der natürlichen kubischen Splinefunktion:*
1. Stützpunkte $(x_i, y_i)$ sortiert übernehmen
2. Intervalllängen $h_i = x_(i+1) - x_i$ berechnen
3. $a_i = y_i$ setzen
4. Randbedingungen $c_0 = 0$ und $c_n = 0$ setzen
5. Das tridiagonale lineare Gleichungssystem für $c_1, dots, c_(n-1)$ aufstellen und lösen
6. Danach mit den Formeln $b_i$ und $d_i$ berechnen
7. Für jedes Intervall das Polynom
   $
   S_i(x) = a_i + b_i (x - x_i) + c_i (x - x_i)^2 + d_i (x - x_i)^3
   $
   angeben
]

#example[
*Beispiel: natürliche kubische Splinefunktion mit Zahlen*

Gegeben sind die Stützpunkte
$
(x_0, y_0) = (0, 2), quad
(x_1, y_1) = (1, 1), quad
$
$
(x_2, y_2) = (2, 2), quad
(x_3, y_3) = (3, 2).
$

Gesucht ist die natürliche kubische Splinefunktion $S(x)$.

*1. Teilintervalle und Ansatz:*

Wir haben die drei Intervalle
$
[0, 1], quad [1, 2], quad [2, 3].
$

Auf jedem Intervall verwenden wir ein kubisches Polynom:
$
S_0(x) = a_0 + b_0 (x - 0) + c_0 (x - 0)^2 + d_0 (x - 0)^3
$
für $x in [0, 1]$,

$
S_1(x) = a_1 + b_1 (x - 1) + c_1 (x - 1)^2 + d_1 (x - 1)^3
$
für $x in [1, 2]$,

$
S_2(x) = a_2 + b_2 (x - 2) + c_2 (x - 2)^2 + d_2 (x - 2)^3
$
für $x in [2, 3]$.

*2. Intervalllängen berechnen:*

$
h_0 = 1 - 0 = 1, quad
h_1 = 2 - 1 = 1, quad
h_2 = 3 - 2 = 1
$

*3. Koeffizienten $a_i$ setzen:*

Bei der natürlichen kubischen Splinefunktion gilt
$
a_i = y_i.
$

Also:
$
a_0 = 2, quad a_1 = 1, quad a_2 = 2.
$

*4. Randbedingungen verwenden:*

Für die natürliche kubische Splinefunktion gilt
$
c_0 = 0, quad c_3 = 0.
$

*5. Gleichungssystem für $c_1$ und $c_2$:*

Es gilt
$
2 (h_0 + h_1) c_1 + h_1 c_2
= 3 (y_2 - y_1) / h_1 - 3 (y_1 - y_0) / h_0
$

und
$
h_1 c_1 + 2 (h_1 + h_2) c_2
= 3 (y_3 - y_2) / h_2 - 3 (y_2 - y_1) / h_1.
$

Zahlen einsetzen:

$
2 (1 + 1) c_1 + 1 c_2
= 3 (2 - 1) / 1 - 3 (1 - 2) / 1
$

$
1 c_1 + 2 (1 + 1) c_2
= 3 (2 - 2) / 1 - 3 (2 - 1) / 1
$

also

$
4 c_1 + c_2 = 6
$

$
c_1 + 4 c_2 = -3.
$

Lösen ergibt
$
c_1 = 9 / 5, quad c_2 = -6 / 5.
$

Damit insgesamt:
$
c_0 = 0, quad c_1 = 9 / 5, quad c_2 = -6 / 5, quad c_3 = 0.
$

*6. Koeffizienten $b_i$ berechnen:*

Es gilt
$
b_i = (y_(i+1) - y_i) / h_i - h_i / 3 dot (c_(i+1) + 2 c_i).
$

Für $i = 0$:
$
b_0 = (1 - 2) / 1 - 1 / 3 dot (9 / 5 + 2 dot 0)
= -1 - 3 / 5
= -8 / 5
$

Für $i = 1$:
$
b_1 = (2 - 1) / 1 - 1 / 3 dot (-6 / 5 + 2 dot 9 / 5)
= 1 - 1 / 3 dot 12 / 5
= 1 / 5
$

Für $i = 2$:
$
b_2 = (2 - 2) / 1 - 1 / 3 dot (0 + 2 dot (-6 / 5))
= 4 / 5.
$

*7. Koeffizienten $d_i$ berechnen:*

Es gilt
$
d_i = (c_(i+1) - c_i) / (3 h_i).
$

Für $i = 0$:
$
d_0 = (9 / 5 - 0) / 3
= 3 / 5
$

Für $i = 1$:
$
d_1 = (-6 / 5 - 9 / 5) / 3
= -1
$

Für $i = 2$:
$
d_2 = (0 - (-6 / 5)) / 3
= 2 / 5.
$

*8. Splinefunktion hinschreiben:*

Damit erhält man

$
S_0(x) = 2 - 8 / 5 x + 3 / 5 x^3, quad x in [0, 1]
$

$
S_1(x) = 1 + 1 / 5 (x - 1) + 9 / 5 (x - 1)^2 - (x - 1)^3, quad x in [1, 2]
$

$
S_2(x) = 2 + 4 / 5 (x - 2) - 6 / 5 (x - 2)^2 + 2 / 5 (x - 2)^3, quad x in [2, 3].
$

Also ist die natürliche kubische Splinefunktion

$
S(x) = cases(
  2 - 8 / 5 x + 3 / 5 x^3 "if" x in [0, 1],
  1 + 1 / 5 (x - 1) + 9 / 5 (x - 1)^2 - (x - 1)^3 "if" x in [1, 2],
  2 + 4 / 5 (x - 2) - 6 / 5 (x - 2)^2 + 2 / 5 (x - 2)^3 "if" x in [2, 3],
)
$

*9. Kontrolle:*

Die Funktion erfüllt
$
S(0) = 2, quad S(1) = 1, quad S(2) = 2, quad S(3) = 2
$
sowie die natürlichen Randbedingungen
$
S''(0) = 0, quad S''(3) = 0.
$
]

== Lineare Ausgleichsprobleme

#definition()[
Ein *lineares Ausgleichsproblem* liegt vor, wenn die Ansatzfunktion linear von den Parametern abhängt.
]

#formula()[
*Lineare Ansatzfunktion:*
#math()[$
f(x)=lambda_1 + lambda_2 x
$]

*Fehlerfunktional (Summe der Fehlerquadrate):*
#math()[$
E(lambda_1,lambda_2)=sum_(i=1)^n (y_i-lambda_1-lambda_2 x_i)^2
$]

*Allgemeine Ansatzfunktion:*
#math()[$
f(x)=lambda_1 phi_1(x)+lambda_2 phi_2(x)+dots+lambda_m phi_m(x)
$]

*Aufbau der Matrix $A$ (Basisfunktionen an Stützstellen):*
#math()[$
A=mat(
phi_1(x_1), phi_2(x_1), dots, phi_m(x_1);
phi_1(x_2), phi_2(x_2), dots, phi_m(x_2);
dots.v, dots.v, dots.down, dots.v;
phi_1(x_n), phi_2(x_n), dots, phi_m(x_n)
)
$]

*Matrix $A$ und Messvektor $y$ für $f(x)=lambda_1+lambda_2 x$:*
#math()[$
A=mat(
1, x_1;
1, x_2;
dots.v, dots.v;
1, x_n
), quad
y=vec(y_1, y_2, dots.v, y_n)
$]

*Normalgleichung:*
#math()[$
A^T A lambda = A^T y
$]
]

#definition()[
*Gewichtete Ausgleichsrechnung:*
Sind die Messpunkte unterschiedlich genau (zuverlässig), gewichtet man jeden Punkt mit $w_i > 0$. Genauere Werte erhalten ein grösseres Gewicht.
]

#formula()[
*Gewichtetes Fehlerfunktional:*
#math()[$
E(lambda)=sum_(i=1)^n w_i (y_i-f(x_i,lambda))^2
$]

*Gewichtsmatrix (Diagonalmatrix):*
#math()[$
W=mat(
w_1, 0, dots, 0;
0, w_2, dots, 0;
dots.v, dots.v, dots.down, dots.v;
0, 0, dots, w_n
)
$]

*Gewichtete Normalgleichung:*
#math()[$
A^T W A lambda = A^T W y
$]
]

#variables()[
- $w_i > 0$: Gewicht des $i$-ten Messpunktes
- $W$: Diagonale Gewichtsmatrix
]

#remark()[
Mit $w_i = 1$ für alle $i$ (bzw. $W = I$) erhält man wieder die ungewichtete Normalgleichung $A^T A lambda = A^T y$.

Oft wählt man $w_i = 1 / sigma_i^2$, wobei $sigma_i$ die Messunsicherheit des $i$-ten Punktes ist.
]

#steps()[
*Vorgehen bei linearer Regression:*
1. Ansatzfunktion wählen
2. Matrix $A$ aufstellen
3. Normalgleichungen bilden (bei Gewichten mit $W$)
4. Nach $lambda$ lösen
]

#example()[
*Beispiel (gewichtet):*

*Gegeben:* Datenpunkte mit Gewichten $w_i$ (mittlerer Punkt zuverlässiger)
$
(0,1), quad (1,2), quad (2,2), quad w=(1,2,1)
$

*Ansatz:*
$
f(x)=lambda_1+lambda_2 x
$

*Matrix, Messvektor und Gewichtsmatrix aufstellen:*
$
A=mat(
1,0;
1,1;
1,2
), quad
y=vec(1,2,2), quad
W=mat(
1,0,0;
0,2,0;
0,0,1
)
$

*Gewichtete Normalgleichungen berechnen:*
$
A^T W A = mat(
4,4;
4,6
)
$
$
A^T W y = vec(7,8)
$

*Gleichungssystem lösen:*
$
mat(
4,4;
4,6
)
vec(lambda_1,lambda_2)
=
vec(7,8)
$

Aus der 1. Zeile:
$
4lambda_1+4lambda_2=7
$

Aus der 2. Zeile:
$
4lambda_1+6lambda_2=8
$

*Subtrahieren:*
$
2lambda_2=1 -> lambda_2=0.5
$

*Einsetzen:*
$
4lambda_1+2=7 -> 4lambda_1=5 -> lambda_1=5/4
$

*Ausgleichsgerade:*
$
f(x)=5/4+frac(1,2)x
$

*Lösung:*
$
f(x)=frac(5,4)+frac(1,2)x
$
]

#remark()[
Hier gehen die Punkte im Allgemeinen nicht exakt durch die Gerade.
]

== Nichtlineare Ausgleichsprobleme

#definition()[
Ein *nichtlineares Ausgleichsproblem* liegt vor, wenn die Parameter nicht linear in der Ansatzfunktion auftreten.
]

#formula()[
*Fehlerfunktional (nichtlinear):*
#math()[$
E(lambda)=sum_(i=1)^n (y_i-f(x_i,lambda))^2
$]
]

#example()[
*Beispiel:*

*Gegeben:*
$
f(x)=a e^(b x)
$
mit Messpunkten
$
(0,2), quad (1,4), quad (2,7.9)
$

*Einsetzen in den Ansatz:*
$
f(0)=a
$
$
f(1)=a e^b
$
$
f(2)=a e^(2b)
$

*Beobachtung:* Die Parameter $a$ und $b$ treten nicht linear auf.

*Lösung:* Es handelt sich um ein nichtlineares Ausgleichsproblem.
]

== Gauss-Newton-Verfahren

#definition()[
Das *Gauss-Newton-Verfahren* löst nichtlineare Ausgleichsprobleme iterativ.
]

#variables()[
- $g(lambda)=y-f(lambda)$: Residuenvektor
- $D g(lambda)$: Jacobi-Matrix
- $delta^(k)$: Korrektur
]

#formula()[
*Residuenvektor:*
#math()[$
g(lambda)=y-f(lambda)
$]

*Linearisiertes Ausgleichsproblem (Normalgleichung):*
#math()[$
D g(lambda^(k)) delta^(k) approx -g(lambda^(k))
$]

*Update der Parameter:*
#math()[$
lambda^(k+1)=lambda^(k)+delta^(k)
$]
]

#steps()[
*Gauss-Newton-Schritt:*
1. Startwert wählen
2. Residuen berechnen
3. Jacobi-Matrix berechnen
4. lineares Ausgleichsproblem für $delta^(k)$ lösen
5. Update berechnen
]

#example()[
*Beispiel:*

*Gegeben:* Messdaten
$
(0,1), quad (1,2)
$
und Ansatz
$
f(x)=a e^(b x)
$

Startwert:
$
lambda^(0)=vec(1,1)
$

*Funktionswerte am Startwert:*
$
f(0)=1 \cdot e^0=1
$
$
f(1)=1 \cdot e^1=e
$

*Residuenvektor:*
$
g(lambda^(0))=
vec(
1-1,
2-e
)
=
vec(
0,
2-e
)
$

*Jacobi-Matrix bestimmen:*
$
g_1(a,b)=1-a
$
$
g_2(a,b)=2-a e^b
$

$
D g(a,b)=mat(
-1,0;
-e^b,-a e^b
)
$

*Am Startwert auswerten:*
$
D g(1,1)=mat(
-1,0;
-e,-e
)
$

*Gauss-Newton-Gleichung:*
$
mat(
-1,0;
-e,-e
)
delta^(0)
approx
-vec(
0,
2-e
)
$

*Lösen des Systems:*

Aus Zeile 1: $-delta_a^(0)=0 -> delta_a^(0)=0$

Aus Zeile 2: $-e dot delta_a^(0)-e dot delta_b^(0)=-(2-e)=e-2$

Mit $delta_a^(0)=0$:
$
-e dot delta_b^(0)=e-2 -> delta_b^(0)=frac(2-e,e)=frac(2,e)-1 approx -0.2642
$

*Korrektur:*
$
delta^(0)=vec(0,-0.2642)
$

*Nächster Parametervektor:*
$
lambda^(1)=lambda^(0)+delta^(0)=vec(1,1)+vec(0,-0.2642)=vec(1,0.7358)
$

Also $a^(1)=1$ und $b^(1) approx 0.7358$.
]

#remark()[
Gauss-Newton linearisiert das Problem in jedem Schritt neu.
]

== Prüfungsblock

#formula()[
*Lagrange-Interpolationspolynom:*
#math()[$
P_n(x)=sum_(i=0)^n y_i L_i(x)
$]

*Lagrange-Basisfunktion:*
#math()[$
L_i(x)=product_(j=0, j != i)^n frac(x-x_j, x_i-x_j)
$]

*Fehlerfunktional:*
#math()[$
E(lambda)=sum_(i=1)^n (y_i-f(x_i,lambda))^2
$]

*Normalgleichung (linear):*
#math()[$
A^T A lambda=A^T y
$]

*Gauss-Newton-Update:*
#math()[$
lambda^(k+1)=lambda^(k)+delta^(k)
$]
]

#steps()[
*Prüfungsroutine:*
1. Interpolation oder Ausgleich erkennen
2. Ansatzfunktion aufstellen
3. linear oder nichtlinear unterscheiden
4. bei linear: Normalgleichungen lösen
5. bei nichtlinear: Gauss-Newton-Schritt aufstellen
]