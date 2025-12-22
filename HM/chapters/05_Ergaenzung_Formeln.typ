#import "../../style.typ": default_style, formula, example, steps

== Ableitungen & Integrale

$ (x^n)' = n x^(n-1) , quad n in RR, n != 0 $

$ (a f(x) + b g(x))' = a f'(x) + b g'(x) $

$ (sin x)' = cos x, quad (cos x)' = -sin x $

$ (e^x)' = e^x, quad (ln x)' = 1/x, quad x > 0 $

$ #int x^n d x = x^(n+1)/(n+1) + C , quad n != -1 $

$ #int 1/x d x = ln(abs(x)) + C $

$ #int e^x d x = e^x + C $

$ #int sin x d x = -cos x + C, quad #int cos x d x = sin x + C $

== Polynome

$ p(x) = a_n x^n + dots + a_1 x + a_0 $

$ p'(x) = n a_n x^(n-1) + dots + 2 a_2 x + a_1 $

$ P(x) = #int p(x) "dx"
       = a_n x^(n+1)/(n+1) + dots + a_1 x^2/2 + a_0 x + C $

== Fakultät & Binomialkoeffizient

$ n! = 1 dot 2 dot 3 dot dots dot n, quad 0! = 1 $

$ binom(n, k) = n! / (k! (n-k)!) $

== Sekantenverfahren

$ x_(k+1) = x_k - f(x_k) dot frac(x_k - x_(k-1), f(x_k) - f(x_(k-1))) $

== Geometrie

$ V_"kugel" = frac(4, 3) pi r^3, quad A_"kreis" = pi r^2 $

$ V_"zyl" = pi r^2 l $

$ V_"kugelsegment" = pi h^2 (r - h/3) $

== Lineare Algebra Basics

$ op("tr")(A) = sum_i a_(i i) $

$ det! mat(a, b; c, d) = a d - b c $

$ p(\\lambda) = det(A - \\lambda I) $

$ p(\\lambda) = \\lambda^2 - (a+d) \\lambda + (a d - b c) quad "für" 2 times 2 $
