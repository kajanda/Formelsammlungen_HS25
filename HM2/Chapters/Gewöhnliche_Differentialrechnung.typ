#import "../../style.typ": formula, example, steps, math, definition, variables, remark

= Einführung in gewöhnliche Differentialgleichungen

#definition()[
*Ziel:* Gesucht ist für ein Anfangswertproblem eine Funktion $y$, die eine gewöhnliche Differentialgleichung erfüllt und zusätzlich gegebene Anfangswerte annimmt.

Für eine DGL 1. Ordnung lautet das typische Problem:
#formula[
#math()[$
y'(x) = f(x, y(x)), quad y(x_0) = y_0
$]
]

Allgemeiner hat eine gewöhnliche Differentialgleichung $n$-ter Ordnung die Form
#formula[
#math()[$
y^(n)(x) = f(x, y(x), y'(x), dots, y^((n-1))(x))
$]
]
]
#variables()[
$x$: unabhängige Variable \
$y(x)$: gesuchte Lösungsfunktion \
$x_0$: Startstelle \
$y_0$: Anfangswert \
$h = (b-a)/n$: Schrittweite \
$x_i = a + i h$: Gitterpunkte \
$y_i$: numerische Näherung für $y(x_i)$ \
$f(x,y)$: rechte Seite der DGL
]

#remark()[
Im Kapitel werden vor allem Anfangswertprobleme behandelt. Analytische Lösungen sind oft nicht verfügbar, deshalb verwendet man numerische Verfahren.
]

== Anfangswertproblem und Grundidee

#definition()[
Bei einem Anfangswertproblem (AWP) für eine DGL $n$-ter Ordnung werden zusätzlich zur Differentialgleichung die Anfangswerte der Funktion und ihrer ersten Ableitungen an einer Stelle vorgegeben.

Für die hier wichtigsten Fälle gilt:

#formula[
#math()[$
y'(x) = f(x, y(x)), quad y(x_0) = y_0
$]

#math()[$
y''(x) = f(x, y(x), y'(x)), quad y(x_0) = y_0, quad y'(x_0)=m
$]
]
]

#definition()[
Zur numerischen Lösung wählt man ein Intervall $[a,b]$, unterteilt es in $n$ Teilintervalle und setzt
#formula[
#math()[$
h = frac(b-a, n), quad x_i = a + i h
$]
]

Bei Einschrittverfahren wird dann allgemein nach dem Muster gerechnet:
#formula[
#math()[$
x_(i+1) = x_i + h
$]

#math()[$
y_(i+1) = y_i + "Steigung" dot h
$]
]
]
#steps()[
*Grundidee für numerische Verfahren:*
1. Intervall $[a,b]$ und Anzahl Schritte $n$ festlegen
2. Schrittweite $h=(b-a)/n$ berechnen
3. Startwert $y_0 = y(x_0)$ einsetzen
4. Eine geeignete Näherung für die Steigung auf $[x_i, x_(i+1)]$ wählen
5. Damit Schritt für Schritt die Werte $y_1, y_2, dots$ berechnen
]

#remark()[
Der Unterschied der Verfahren liegt nur darin, wie die Steigung gewählt wird.
]

== Richtungsfeld

#definition()[
Ein Richtungsfeld visualisiert für jeden Punkt $(x,y)$ die Steigung
#formula[
#math()[$
y' = f(x,y)
$]
]
der Lösungskurve.

Dadurch kann man qualitativ erkennen, wie sich Lösungen verhalten und warum Einschrittverfahren Tangenteninformationen verwenden.
]

#remark()[
Prüfungsrelevant ist vor allem das Interpretieren: Wo steigen Lösungen? Wo fallen sie? Wo sind stationäre Bereiche?
]

#definition[
Ein *Richtungsfeld* visualisiert die Steigung einer Differentialgleichung
$
y' = f(t, y)
$
in vielen Punkten $(t, y)$.

An jedem Gitterpunkt wird ein kleines Linienstück mit Steigung
$
f(t, y)
$
eingezeichnet.
]

#formula[
Gegeben ist die Differentialgleichung
#math()[
$
"dy"/"dt" = -1/2 dot y dot t^2
$
]

Für jeden Punkt $(t_i, y_j)$ berechnet man also die Steigung mit
#math()[
$
m_("ij") = -1/2 dot y_j dot t_i^2.
$
]
]

#steps[
*Vorgehen beim Zeichnen eines Richtungsfelds:*
1. Gitterpunkte $(t_i, y_j)$ festlegen
2. An jedem Punkt die Steigung
   $
   m_("ij") = -1/2 dot y_j dot t_i^2
   $
   berechnen
3. In jeden Punkt ein kleines Linienstück mit dieser Steigung einzeichnen
4. Falls ein Anfangswert gegeben ist, die ungefähre Lösungskurve durch diesen Punkt skizzieren
]

#example[
*Beispiel:*

Gegeben ist
$
"dy"/"dt" = -1/2 dot y dot t^2,"   "y(0) = 3  
$
mit den Gitterpunkten
$
(t_i, y_j) = (i, j), quad i, j = 0, 1, 2, 3.
$

*Steigungen berechnen:*

Für $t = 0$ gilt immer:
$
"dy"/"dt" = -1/2 dot y dot 0^2 = 0.
$

Für $t = 1$ gilt:
$
"dy"/"dt" = -1/2 dot y.
$

Für $t = 2$ gilt:
$
"dy"/"dt" = -1/2 dot y dot 4 = -2y.
$

Für $t = 3$ gilt:
$
"dy"/"dt" = -1/2 dot y dot 9 = -9/2 dot y.
$

Daraus ergibt sich die Tabelle:

#table(
  columns: 5,
  align: center,
  stroke: 0.6pt,
  inset: 6pt,
  table.header(
    [*$"dy"/"dt"$*], [*$t_0 = 0$*], [*$t_1 = 1$*], [*$t_2 = 2$*], [*$t_3 = 3$*]
  ),

  [*$y_0 = 0$*], [$0$], [$0$], [$0$], [$0$],
  [*$y_1 = 1$*], [$0$], [$-1/2$], [$-2$], [$-9/2$],
  [*$y_2 = 2$*], [$0$], [$-1$], [$-4$], [$-9$],
  [*$y_3 = 3$*], [$0$], [$-3/2$], [$-6$], [$-27/2$],
)

*Interpretation:*
- Entlang der Linie $y = 0$ sind alle Steigungen $0$
- Bei $t = 0$ sind ebenfalls alle Steigungen $0$
- Für $t > 0$ und $y > 0$ sind die Steigungen negativ
- Je grösser $t$ und $y$, desto steiler fällt die Lösung

*Lösungskurve zum Anfangswert $y(0) = 3$:*

Die DGL ist trennbar:
$
1/y "dy" = -1/2 t^2 "dt".
$

Integrieren liefert:
$
ln abs(y) = -t^3/6 + C.
$

Also:
$
y(t) = C e^(-t^3/6).
$

Mit $y(0) = 3$ folgt:
$
y(t) = 3 e^(-t^3/6).
$

Das ist die Lösungskurve, die im Richtungsfeld durch den Punkt $(0, 3)$ verläuft.
]
#image("../Assets/image1.png")
#colbreak()
#colbreak()
== Klassisches Euler-Verfahren

#formula[
#math()[$
x_(i+1) = x_i + h
$]

#math()[$
y_(i+1) = y_i + h f(x_i, y_i)
$]
]

#steps()[
*Vorgehen beim Euler-Verfahren:*
1. Starte mit $(x_0, y_0)$
2. Berechne die Steigung $f(x_i, y_i)$
3. Gehe in $x$ um $h$ nach rechts
4. Addiere in $y$ den Wert $h f(x_i, y_i)$
5. Wiederhole den Schritt für alle Gitterpunkte
]

#example()[
*Beispiel:* Gegeben ist das Anfangswertproblem
$
f(t,y(t))= y'(t) = t^2 + 0.1 y(t), quad y(-1.5)=0
$
auf dem Intervall $[-1.5, 1.5]$ mit $n=5$.

Schrittweite:
$
h = frac(1.5 - (-1.5), 5) = 0.6
$

Startwert:
$
t_0 = -1.5, quad y_0 = 0
$

*Erster Euler-Schritt:* \
Steigung am Startpunkt:
$
f(t_0, y_0) = (-1.5)^2 + 0.1 dot 0 = 2.25
$

Neuer Wert:
$
y_1 = y_0 + h f(t_0, y_0) = 0 + 0.6 dot 2.25 = 1.35
$

Neue Stelle:
$
t_1 = t_0 + h  = -0.9
$

*Lösung nach dem ersten Schritt:* \
$
(t_1, y_1) = (-0.9, 1.35)
$
]

#colbreak()
== Mittelpunkt-Verfahren

#definition()[
Das Mittelpunkt-Verfahren benutzt zuerst einen halben Euler-Schritt zum Mittelpunkt und verwendet dortige Steigung.

#formula[
#math()[$
x_(h/2) = x_i + frac(h, 2)"        " y_(h/2) = y_i + frac(h, 2) f(x_i, y_i)
$]

#math()[$
x_(i+1) = x_i + h"        "y_(i+1) = y_i + h f(x_(h/2), y_(h/2))
$]
]
]

#steps()[
*Vorgehen beim Mittelpunkt-Verfahren:*
1. Steigung am Startpunkt $(x_i, y_i)$ berechnen
2. Damit einen halben Euler-Schritt zum Mittelpunkt machen
3. Dort die neue Steigung berechnen
4. Diese Mittelpunkt-Steigung für den ganzen Schritt verwenden
]

#example()[
*Beispiel:* Gegeben ist wieder
$
y'(t) = t^2 + 0.1 y(t), quad y(-1.5)=0, quad h=0.6
$

*Halbschritt zum Mittelpunkt:* \
$
t_(h/2) = -1.5 + 0.3 = -1.2
$

$
y_(h/2) = 0 + 0.3 dot ( (-1.5)^2 + 0.1 dot 0 ) = 0.675
$

*Steigung im Mittelpunkt:* \
$
f(t_(h/2), y_(h/2)) = (-1.2)^2 + 0.1 dot 0.675 = 1.5075
$

*Ganzer Schritt:* \
$
y_1 = 0 + 0.6 dot 1.5075 = 0.9045
$

*Lösung nach dem ersten Schritt:* \
$
(t_1, y_1) = (-0.9, 0.9045)
$
]

#remark()[
Das Mittelpunkt-Verfahren ist genauer als Euler und hat Ordnung $p=2$.
]

#colbreak()
== Modifiziertes Euler-Verfahren

#definition()[
Beim modifizierten Euler mittelt man zwei Steigungen: am *Startpunkt* und nach einem *ganzen Euler-Prognoseschritt*.

#formula[
#math()[$
k_1 = f(x_i, y_i)
$]

#math()[$
y_("Euler", i+1) = y_i + h k_1
$]

#math()[$
k_2 = f(x_(i+1), y_("Euler", i+1))
$]

#math()[$
y_(i+1) = y_i + h frac(k_1 + k_2, 2)
$]
]
]

#steps()[
*Vorgehen beim modifizierten Euler-Verfahren:*
1. Erste Steigung $k_1 = f(x_i, y_i)$ berechnen
2. Mit Euler einen Prognosewert $y_("Euler", i+1)$ bestimmen
3. Zweite Steigung $k_2$ am Prognosepunkt berechnen
4. Den Mittelwert der beiden Steigungen verwenden
]

#example()[
*Beispiel:* Gegeben ist wieder
$
y'(t) = t^2 + 0.1 y(t), quad y(-1.5)=0, quad h=0.6
$

Erste Steigung:
$
k_1 = (-1.5)^2 + 0.1 dot 0 = 2.25
$

Euler-Prognose:
$
y_("Euler",1) = 0 + 0.6 dot 2.25 = 1.35
$

Zweite Steigung am Prognosepunkt:
$
k_2 = (-0.9)^2 + 0.1 dot 1.35 = 0.945
$

Mittelwert bilden:
$
y_1 = 0 + 0.6 frac(2.25 + 0.945, 2) = 0.9585
$

*Lösung nach dem ersten Schritt:* \
$
(t_1, y_1) = (-0.9, 0.9585)
$
]

== Fehlerordnung: Konsistenz und Konvergenz

#variables()[
  $h$: Schrittweite

  $p$: Konsistenz- bzw. Konvergenzordnung

  $C$: Konstante, die nicht von $h$ abhängt
]

#definition()[
Ein Verfahren hat Konsistenzordnung bzw. Konvergenzordnung $p$, wenn der Fehler sich wie eine Konstante mal $h^p$ verhält.

Anschaulich:
#formula[
#math()[$
"Fehler" approx C h^p
$]
]

Je grösser $p$, desto schneller sinkt der Fehler bei kleiner werdendem $h$.
]


#definition()[
Für das Euler-Verfahren gilt laut Skript für den lokalen Fehler:
#formula[
#math()[$
phi(x_n, h) = h^2 / 2 dot y''(z)
$]
]
wobei $z in [x_n, x_n+h]$.

Für den globalen Fehler gilt:
#formula[
#math()[$
abs(y(x_n)-y_n) <= h / 2 dot max_(x in [x_0, x_n]) abs(y''(x)) dot C~
$]
]
]

Daraus folgt:
#formula[
#math()[$
p = 1 " für Euler"
$]

#math()[$
p = 2 " für Mittelpunkt und modifiziertes Euler"
$]

#math()[$
p = 4 " für klassisches Runge-Kutta"
$]
]

#colbreak()

== Klassisches vierstufiges Runge-Kutta-Verfahren

#definition()[
Das klassische Runge-Kutta-Verfahren 4. Ordnung benutzt vier Steigungen und bildet daraus ein gewichtetes Mittel.

#formula[
#math()[$
k_1 = f(x_i, y_i)
$]

#math()[$
k_2 = f(x_i + frac(h, 2), y_i + frac(h, 2) k_1)
$]

#math()[$
k_3 = f(x_i + frac(h, 2), y_i + frac(h, 2) k_2)
$]

#math()[$
k_4 = f(x_i + h, y_i + h k_3)
$]

#math()[$
x_(i+1) = x_i + h
$]

#math()[$
y_(i+1) = y_i + h frac(k_1 + 2k_2 + 2k_3 + k_4, 6)
$]
]
]

#steps()[
*Vorgehen bei RK4:*
1. $k_1$ am Startpunkt berechnen
2. $k_2$ mit einem halben Schritt und $k_1$ berechnen
3. $k_3$ nochmals mit halbem Schritt und $k_2$ berechnen
4. $k_4$ mit ganzem Schritt und $k_3$ berechnen
5. Alle vier Steigungen gewichtet mitteln
]

#example()[
*Beispiel:* Gegeben ist wieder
$
y'(t) = t^2 + 0.1 y(t), quad y(-1.5)=0, quad h=0.6
$

Start:
$
t_0=-1.5, quad y_0=0
$

Steigungen:
$
k_1 = 2.25
$

$
k_2 = (-1.2)^2 + 0.1 (0 + 0.3 dot 2.25) = 1.5075
$

$
k_3 = (-1.2)^2 + 0.1 (0 + 0.3 dot 1.5075) = 1.485225
$

$
k_4 = (-0.9)^2 + 0.1 (0 + 0.6 dot 1.485225) = 0.8991135
$

Einsetzen:
$
y_1 = 0 + 0.6 frac(k_1 + 2 k_2 + 2 k_3 + k_4, 6)
$

$
y_1 approx 0.913456
$

*Lösung nach dem ersten Schritt:* \
$
(t_1, y_1) approx (-0.9, 0.9135)
$
]

#remark()[
RK4 hat die Konsistenz- und Konvergenzordnung $p=4$ und ist deutlich genauer als Euler bei gleicher Schrittweite.
]

== Allgemeines $s$-stufiges Runge-Kutta-Verfahren

#definition()[
Ein allgemeines explizites $s$-stufiges Runge-Kutta-Verfahren ist gegeben durch

#formula[
#math()[$
k_n = f( x_i + c_n h, y_i + h sum_(m=1)^(n-1) a_(n m) k_m ) quad "für " n=1,dots,s
$]

#math()[$
y_(i+1) = y_i + h sum_(n=1)^s b_n k_n
$]
]

Hier sind $a_(n m)$, $b_n$ und $c_n$ Konstanten.
]

#remark()[
Euler, Mittelpunkt, modifiziertes Euler und RK4 sind Spezialfälle dieses allgemeinen Schemas. Die Koeffizienten werden oft als Butcher-Schema notiert.
]

== DGL höherer Ordnung auf ein System 1. Ordnung zurückführen

#definition()[
Eine DGL $k$-ter Ordnung kann durch Einführung von Hilfsfunktionen in ein System von $k$ DGL 1. Ordnung umgeschrieben werden.

Beispielhaft:
#formula[
#math()[$
z_1(x) = y(x), quad z_2(x)=y'(x), quad dots, quad z_k(x)=y^((k-1))(x)
$]
]

Dann gilt
#formula[
#math()[$
z_1' = z_2, quad z_2' = z_3, quad dots
$]
]
und die höchste Ableitung liefert die letzte Gleichung.
]

#steps()[
*Rezept zum Zurückführen:*
1. Nach der höchsten Ableitung auflösen
2. Neue Hilfsfunktionen für $y, y', y'', dots$ einführen
3. Diese Hilfsfunktionen ableiten
4. Alles als Vektorsystem 1. Ordnung aufschreiben
]

#example()[
*Beispiel:* Gegeben ist
$
y''' + 5y'' + 8y' + 6y = 10 e^(-x)
$
mit
$
y(0)=2, quad y'(0)=0, quad y''(0)=0
$.

*Schritt 1: nach der höchsten Ableitung auflösen* \
$
y''' = 10 e^(-x) - 5y'' - 8y' - 6y
$

*Schritt 2: Hilfsfunktionen einführen* \
$
z_1 = y, quad z_2 = y', quad z_3 = y''
$

*Schritt 3: System aufstellen* \
$
z_1' = z_2
$

$
z_2' = z_3
$

$
z_3' = 10 e^(-x) - 5z_3 - 8z_2 - 6z_1
$

*Schritt 4: Anfangswerte umschreiben* \
$
z_1(0)=2, quad z_2(0)=0, quad z_3(0)=0
$

*Vektorielle Form:* \
$
bold(z)' = vec(z_1', z_2', z_3') = vec(z_2, z_3, 10 e^(-x) - 5z_3 - 8z_2 - 6z_1), quad
bold(z)(0) = vec(2, 0, 0)
$

*Lösung:* \
Damit wurde die DGL 3. Ordnung in ein System von drei DGL 1. Ordnung überführt.
]

#remark()[
Dieses Umschreiben ist zentral, weil die numerischen Verfahren direkt für Systeme 1. Ordnung formuliert werden.
]

== Systeme von Differentialgleichungen 1. Ordnung

#definition()[
Ein System von $k$ DGL 1. Ordnung hat die Form
#formula[
#math()[$
y'(x) = f(x, y(x)), quad y(x_0)=y_0
$]
]
wobei $y(x)$ jetzt ein Vektor ist:
#formula[
#math()[$
y(x) = mat(
y_1(x);
y_2(x);
dots;
y_k(x)
)
$]
]
]

In Komponentenform:
#formula[
#math()[$
y_1'(x) = f_1(x, y_1(x), dots, y_k(x))
$]

#math()[$
y_2'(x) = f_2(x, y_1(x), dots, y_k(x))
$]

#math()[$
dots
$]

#math()[$
y_k'(x) = f_k(x, y_1(x), dots, y_k(x))
$]
]


Die bekannten Verfahren werden komponentenweise ganz analog angewendet.


#remark()[
Man ersetzt also lediglich Skalare durch Vektoren; das Rechenschema bleibt gleich.
]

== Stabilität

#definition()[
Stabilität beschreibt, ob numerische Fehler während der Iteration kontrolliert bleiben oder anwachsen.

Ein Standardtest im Skript ist das Anfangswertproblem
#formula[
#math()[$
y' = -alpha y, quad y(0)=1, quad alpha > 0
$]
]
mit exakter Lösung
#formula[
#math()[$
y(x)=e^(-alpha x)
$]
]
]

Für das Euler-Verfahren gilt:
#formula[
#math()[$
y_(i+1) = y_i - h alpha y_i = y_i (1 - h alpha)
$]
]

Durch Einsetzen ergibt sich:
#formula[
#math()[$
y_(i+1) = (1 - h alpha)^(i+1)
$]
]

Damit die numerische Lösung stabil bleibt, fordert man
#formula[
#math()[$
abs(1 - h alpha) < 1
$]

#math()[$
0 < h alpha < 2
$]

#math()[$
0 < h < frac(2, alpha)
$]
]

#definition()[
Kann ein Verfahren bei $y'=-alpha y$ in der Form
#formula[
#math()[$
y_(i+1) = g(h alpha) y_i
$]
]
geschrieben werden, so heisst $g(z)$ die *Stabilitätsfunktion*.

Das offene Intervall, in dem
#formula[
#math()[$
abs(g(z)) < 1
$]
]
gilt, heisst *Stabilitätsintervall*.
]

#example()[
*Beispiel:* Gegeben sei
$
y' = -2.5 y, quad y(0)=1
$

Hier ist
$
alpha = 2.5
$

Für Euler gilt als Stabilitätsbedingung:
$
0 < h < frac(2, 2.5)=0.8
$

*Folgerung:* \
Eine Schrittweite wie $h=0.2$ ist stabil, eine Schrittweite wie $h=0.85$ ist instabil.
]

#remark()[
Im Skript wird betont: Stabilität hängt vom Verfahren, von der Schrittweite $h$ und vom konkreten Anfangswertproblem ab.
]

== Weitere Merkpunkte

#definition()[
*Explizite vs. implizite Verfahren*

Explizite Verfahren berechnen $y_(i+1)$ direkt, zum Beispiel:
#formula[
#math()[$
y_(i+1) = y_i + h f(x_i, y_i)
$]
]

Implizite Verfahren enthalten $y_(i+1)$ auf beiden Seiten, zum Beispiel:
#formula[
#math()[$
y_(i+1) = y_i + h f(x_(i+1), y_(i+1))
$]
]

Implizite Verfahren sind aufwendiger, aber oft stabiler.
]

#remark()[
Für steife DGL sind implizite Verfahren meist besser geeignet. Bei stark schwankenden Lösungen ist zudem eine variable Schrittweite effizienter als konstantes $h$. Im Skript wird dafür auch `scipy.integrate.solve_ivp()` erwähnt.
]

== Merkpunkte

#steps()[
*Was du für Prüfungen sicher können solltest:*
1. Ein Anfangswertproblem korrekt formulieren
2. Euler-, Mittelpunkt- und modifiziertes Euler-Verfahren anwenden
3. RK4 mit $k_1, k_2, k_3, k_4$ sauber berechnen
4. Die Ordnungen $p=1$, $p=2$ und $p=4$ zuordnen
5. Eine DGL höherer Ordnung in ein System 1. Ordnung umschreiben
6. Die Stabilitätsbedingung für das Euler-Verfahren bei $y'=-alpha y$ herleiten bzw. anwenden
]
