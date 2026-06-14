#import "../../style.typ": formula, example, steps, math, definition, variables, remark


= Numerische Integration

#definition()[
*Ziel:* Für eine Funktion $f:[a,b] -> RR$ soll das bestimmte Integral
#formula[
*Bestimmtes Integral:*
#math()[$
I(f) = integral_a^b f(x) dif x
$]
]
numerisch angenähert werden.

Allgemein haben Quadraturverfahren die Form
#formula[
*Allgemeine Quadraturformel:*
#math()[$
I(f) approx sum_(i=1)^n a_i f(x_i)
$]
]
Dabei sind $x_i$ die *Stützstellen* (Knoten) und $a_i$ die *Gewichte*.
]

#variables()[
$[a,b]$: Integrationsintervall \
$f$: zu integrierende Funktion \
$I(f)$: exakter Integralwert \
$x_i$: Stützstellen \
$a_i$: Gewichte \
$n$: Anzahl Teilintervalle bzw. Stützstellen \
$h = (b-a)/n$: Schrittweite
]

== Rechteckregel und Trapezregel

#definition()[
Die einfachen Formeln zur Approximation von
$
integral_a^b f(x) dif x
$
sind:

#formula[
*Einfache Rechteckregel (Mittelpunktregel):*
#math()[$
R_f = f(frac(a+b, 2)) dot (b-a)
$]

*Einfache Trapezregel:*
#math()[$
T_f = frac(f(a)+f(b), 2) dot (b-a)
$]
]
]

#steps()[
*Vorgehen mit der einfachen Rechteck- oder Trapezregel:*
1. Intervallgrenzen $a,b$ einsetzen
2. Bei der Rechteckregel den Mittelpunkt $m = (a+b)/2$ berechnen
3. Funktionswerte auswerten
4. Formel anwenden
]

#example()[
*Beispiel:* Gegeben ist
$
f(x)=1/x, quad [a,b]=[2,4]
$

*Rechteckregel:* \
$x_m$ wählen:
$
x_m = frac(2+4, 2)=3
$

Funktionswert in der Mitte:
$
f(3)=1/3
$

Näherung berechnen:
$
R_f = (4-2) dot 1/3 = 2/3 approx 0.6667
$

*Trapezregel:* \
Randwerte einsetzen:
$
f(2)=1/2, quad f(4)=1/4
$

Näherung berechnen:
$
T_f = frac(1/2+1/4, 2) dot (4-2)=0.75
$

*Lösung:* \
$
integral_2^4 1/x dif x approx 0.6667 " bzw. " 0.75
$
Der exakte Wert ist
$
ln(4)-ln(2) approx 0.6931
$.
]

== Summierte Rechteckregel und summierte Trapezregel

#formula()[
Zur besseren Genauigkeit wird $[a,b]$ in $n$ Teilintervalle zerlegt mit
#math()[$
h = frac(b-a, n), quad x_i = a + i h
$
für $i=0,dots,n$.
]

Dann gilt:

*Summierte Rechteckregel:*
#math()[$
R_f(h) = h sum_(i=0)^(n-1) f(x_i + frac(h, 2))
$]

*Summierte Trapezregel:*
#math()[$
T_f(h) = h ( frac(f(a)+f(b), 2) + sum_(i=1)^(n-1) f(x_i) )
$]
]

#steps()[
*Vorgehen bei summierten Quadraturformeln:*
1. Anzahl Teilintervalle $n$ festlegen
2. Schrittweite $h=(b-a)/n$ berechnen
3. Stützstellen $x_i=a+i h$ bestimmen
4. Funktionswerte an Mittelpunkten bzw. Rand- und Innenpunkten berechnen
5. Mit der passenden Summenformel auswerten
]

#example()[
*Beispiel:* Gegeben ist
$
f(x)=1/x, quad [a,b]=[2,4], quad n=4
$

Schrittweite:
$
h = frac(4-2, 4)=0.5
$

*Summierte Rechteckregel:* \
Mittelpunkte der Teilintervalle:
$
2.25, 2.75, 3.25, 3.75
$

Formel anwenden:
$
R_f(h)=0.5 (1/2.25 + 1/2.75 + 1/3.25 + 1/3.75)
$
$
R_f(h) approx 0.6900072
$

*Summierte Trapezregel:* \
Stützstellen:
$
2, 2.5, 3, 3.5, 4
$

Formel anwenden:
$
T_f(h)=0.5 (frac(1/2+1/4, 2)+1/2.5+1/3+1/3.5)
$
$
T_f(h) approx 0.6970238
$

*Lösung:* \
Die summierte Rechteckregel ist hier etwas kleiner, die summierte Trapezregel etwas grösser als der exakte Wert
$
ln 2 approx 0.6931472
$.
]

== Simpson-Regel

#definition()[
Die Simpson-Regel entsteht, indem $f$ auf $[a,b]$ durch ein Polynom 2. Grades approximiert wird.

Für die einfache Simpson-Regel gilt:
#formula[
*Einfache Simpson-Regel:*
#math()[$
S_f = frac(b-a, 6) (f(a)+4f(frac(a+b, 2))+f(b))
$]
]

Für die summierte Simpson-Regel gilt:
#formula[
*Summierte Simpson-Regel:*
#math()[$
S_f(h) = frac(h, 3)(
frac(1, 2)f(a)
+ sum_(i=1)^(n-1) f(x_i)
+ 2 sum_(i=1)^n f(frac(x_(i-1)+x_i, 2))
+ frac(1, 2)f(b)
)
$]
]

Zusammenhang:
#formula[
*Simpson als gewichtetes Mittel von Trapez- und Rechteckregel:*
#math()[$
S_f(h) = frac(1, 3)(T_f(h)+2R_f(h))
$]
]
]

#steps()[
*Vorgehen bei der summierten Simpson-Regel:*
1. Intervall in $n$ Teilintervalle mit Breite $h$ zerlegen
2. Randpunkte $x_i$ und Mittelpunkte der Teilintervalle bestimmen
3. Alle nötigen Funktionswerte berechnen
4. In die Simpson-Formel einsetzen
5. Alternativ als gewichtetes Mittel von Trapez- und Rechteckregel berechnen
]

#example()[
*Beispiel:* Gegeben ist
$
f(x)=1/x, quad [a,b]=[2,4], quad n=4
$

Berechnete Näherungen:
$
R_f(h) approx 0.6900072, quad T_f(h) approx 0.6970238
$

Simpson als gewichtetes Mittel:
$
S_f(h)=frac(1, 3)(T_f(h)+2R_f(h))
$

Einsetzen:
$
S_f(h)=frac(1, 3)(0.6970238 + 2 dot 0.6900072) approx 0.6923450
$

*Lösung:* \
$
integral_2^4 1/x dif x approx 0.6923450
$
Das ist bereits sehr nahe bei
$
ln 2 approx 0.6931472
$.
]

#remark()[
Rechteckregel basiert auf einem Polynom 0. Grades, Trapezregel auf einem Polynom 1. Grades und Simpson auf einem Polynom 2. Grades.
]

== Fehlerabschätzungen

#definition()[
Für die summierten Quadraturformeln gelten die Fehlerabschätzungen:

#formula[
*Fehlerabschätzung Rechteckregel ($O(h^2)$):*
#math()[$
abs(integral_a^b f(x) dif x - R_f(h))
<= frac(h^2, 24)(b-a) max_(x in [a,b]) abs(f''(x))
$]

*Fehlerabschätzung Trapezregel ($O(h^2)$):*
#math()[$
abs(integral_a^b f(x) dif x - T_f(h))
<= frac(h^2, 12)(b-a) max_(x in [a,b]) abs(f''(x))
$]

*Fehlerabschätzung Simpson-Regel ($O(h^4)$):*
#math()[$
abs(integral_a^b f(x) dif x - S_f(h))
<= frac(h^4, 2880)(b-a) max_(x in [a,b]) abs(f^(4)(x))
$]
]
]

#remark()[
Die Simpson-Regel hat Fehlerordnung $O(h^4)$ und ist damit bei glatten Funktionen deutlich genauer als Rechteck- und Trapezregel mit Fehlerordnung $O(h^2)$.
]

== Gauss-Formeln

#definition()[
Bei den Gauss-Formeln werden die Stützstellen *nicht* äquidistant gewählt, sondern so, dass die Genauigkeit möglichst hoch wird.

Für
$
integral_a^b f(x) dif x
$
gelten im Skript:

#formula[
*Gauss-Formel $G_1$ (1 Stützstelle):*
#math()[$
G_1 f = (b-a) f(frac(a+b, 2))
$]

*Gauss-Formel $G_2$ (2 Stützstellen):*
#math()[$
G_2 f = frac(b-a, 2) [
f(-frac(1, sqrt(3)) frac(b-a, 2) + frac(a+b, 2))
+
f(frac(1, sqrt(3)) frac(b-a, 2) + frac(a+b, 2))
]
$]

*Gauss-Formel $G_3$ (3 Stützstellen):*
#math()[$
G_3 f = frac(b-a, 2) [
frac(5, 9) f(-sqrt(0.6) frac(b-a, 2) +
frac(a+b, 2)) \ + frac(8, 9) f(frac(a+b, 2))
+ frac(5, 9) f(sqrt(0.6) frac(b-a, 2) + frac(a+b, 2))
]
$]
]
]

#steps()[
*Vorgehen mit einer Gauss-Formel:*
1. Gewünschte Ordnung $n=1,2,3$ wählen
2. Die dazugehörigen speziellen Stützstellen bestimmen
3. Funktionswerte an diesen Stützstellen auswerten
4. Mit den Gewichten aufsummieren
]

#remark()[
Gauss-Formeln erreichen mit wenigen Funktionsauswertungen oft eine sehr hohe Genauigkeit.
]

== Romberg-Extrapolation

#definition()[
Die Romberg-Extrapolation verbessert Werte der summierten Trapezregel systematisch.

Ausgehend von
#formula[
*Startspalte (summierte Trapezregel):*
#math()[$
T_(j 0) = T_f (frac(b-a, 2^j)), quad j=0,1,dots,m
$]
]
werden die weiteren Einträge rekursiv berechnet durch
#formula[
*Romberg-Rekursion:*
#math()[$
T_(j k) = frac(4^k T_(j+1,k-1) - T_(j,k-1), 4^k-1)
$]
]
für $k=1,2,dots,m$ und $j=0,1,dots,m-k$.
]

#image("../Assets/image.png")

#variables()[
$T_(j 0)$: Werte der summierten Trapezregel \
$T_(j k)$: extrapolierte Werte \
$h_j = (b-a)/2^j$: Romberg-Folge \
$k$: Extrapolationsstufe
]

#steps()[
*Vorgehen bei der Romberg-Extrapolation:*
1. Schrittweiten $h, h/2, h/4, dots$ wählen
2. Erste Spalte $T_(j 0)$ mit der summierten Trapezregel berechnen
3. Extrapolationsformel rekursiv auf die weiteren Spalten anwenden
4. Rechts oben stehender Wert ist die beste Näherung
]

#example()[
*Beispiel:* Gegeben ist
$
f(x)=1/x, quad [a,b]=[2,4]
$

Erste Spalte aus der summierten Trapezregel $T_(j 0)=T_f (h_j)$ mit den Schrittweiten $h_j=(b-a)/2^j$:
$
h_0=2, quad h_1=1, quad h_2=0.5, quad h_3=0.25
$

Dabei gilt allgemein
$
T_f (h_j)=h_j (frac(f(a) + f(b), 2) + sum_(i=1)^(2^j-1) f(a+i h_j) )
$

und damit
$
T_(00)=T_f (2)=0.75, quad
T_(10)=T_f (1)=0.7083333, quad\
T_(20)=T_f (0.5)=0.6970238, quad
T_(30)=T_f (0.25)=0.6941218
$

Nun extrapolieren:

$
T_(01)=frac(4T_(10)-T_(00), 3)=0.6944444
$

$
T_(11)=frac(4T_(20)-T_(10), 3)=0.69325397
$

$
T_(21)=frac(4T_(30)-T_(20), 3)=0.69315453
$

$
T_(02)=frac(16T_(11)-T_(01), 15)=0.69317463
$

$
T_(12)=frac(16T_(21)-T_(11), 15)=0.69314790
$

$
T_(03)=frac(64T_(12)-T_(02), 63)=0.69314748
$

*Lösung:* \
Der extrapolierte Wert
$
T_(03) approx 0.69314748
$
liegt praktisch auf dem exakten Wert
$
ln 2 approx 0.69314718
$.
]

#remark()[
Die zweite Spalte der Romberg-Tafel entspricht der Simpson-Regel. Insbesondere gilt
$
T_(01)=S_f
$.
]
