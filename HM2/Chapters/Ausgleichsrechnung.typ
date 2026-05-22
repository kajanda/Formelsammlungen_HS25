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

#steps()[
*Vorgehen bei linearer Regression:*
1. Ansatzfunktion wählen
2. Matrix $A$ aufstellen
3. Normalgleichungen bilden
4. Nach $lambda$ lösen
]

#example()[
*Beispiel:*

*Gegeben:*
$
(0,1), quad (1,2), quad (2,2)
$

*Ansatz:*
$
f(x)=lambda_1+lambda_2 x
$

*Matrix aufstellen:*
$
A=mat(
1,0;
1,1;
1,2
), quad
y=vec(1,2,2)
$

*Normalgleichungen berechnen:*
$
A^T A = mat(
3,3;
3,5
)
$
$
A^T y = vec(5,6)
$

*Gleichungssystem lösen:*
$
mat(
3,3;
3,5
)
vec(lambda_1,lambda_2)
=
vec(5,6)
$

Aus der 1. Zeile:
$
3lambda_1+3lambda_2=5
$

Aus der 2. Zeile:
$
3lambda_1+5lambda_2=6
$

*Subtrahieren:*
$
2lambda_2=1 -> lambda_2=0.5
$

*Einsetzen:*
$
3lambda_1+1.5=5 -> 3lambda_1=3.5 -> lambda_1=7/6
$

*Ausgleichsgerade:*
$
f(x)=7/6+frac(1,2)x
$

*Lösung:*
$
f(x)=frac(7,6)+frac(1,2)x
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