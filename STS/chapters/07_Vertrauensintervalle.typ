#import "../../style.typ": default_style, formula, example, steps, variables, math

// Farben für die Vertrauensintervall-Tabelle
#let vi_farbe1 = rgb("#e8f5e9") // Grün - Normalverteilung σ bekannt
#let vi_farbe2 = rgb("#e3f2fd") // Blau - Normalverteilung σ unbekannt
#let vi_farbe3 = rgb("#fff3e0") // Orange - Chi-Quadrat
#let vi_farbe4 = rgb("#fce4ec") // Rosa - Bernoulli
#let vi_farbe5 = rgb("#f3e5f5") // Violett - beliebig n>30

#table(
  columns: 6,
  stroke: 0.5pt,
  
  // Header row
  [*Verteilung Grundgesamtheit*],
  [*Parameter*],
  [*Schätzfunktionen*],
  [*standardisierte Zufallsvariable*],
  [*Verteilung, benötigte Quantile*],
  [*Intervallgrenzen*],
  
  // Row 1: Normalverteilung (Varianz bekannt) - GRÜN
  table.cell(fill: vi_farbe1)[Normalverteilung (Varianz $sigma^2$ bekannt)],
  table.cell(fill: vi_farbe1)[$mu$],
  table.cell(fill: vi_farbe1)[$overline(X) = 1/n sum_(i=1)^n X_i$],
  table.cell(fill: vi_farbe1)[$U = (overline(X) - mu)/(sigma\/sqrt(n))$],
  table.cell(fill: vi_farbe1)[*Standardnormalverteilung* (Tabelle 2) \ $c = u_p$ mit $p = (1+gamma)/2$],
  table.cell(fill: vi_farbe1)[$theta_u = overline(X) - c dot sigma/sqrt(n)$ \ $theta_o = overline(X) + c dot sigma/sqrt(n)$],
  
  // Row 2: Normalverteilung (Varianz unbekannt) - BLAU
  table.cell(fill: vi_farbe2)[Normalverteilung (Varianz $sigma^2$ unbekannt und $n <= 30$; sonst Fall 1 mit $s$ als Schätzwert für $sigma$)],
  table.cell(fill: vi_farbe2)[$mu$],
  table.cell(fill: vi_farbe2)[$overline(X) = 1/n sum_(i=1)^n X_i$ \ $S^2 = 1/(n-1) dot sum_(i=1)^n (X_i - overline(X))^2$],
  table.cell(fill: vi_farbe2)[$T = (overline(X) - mu)/(S\/sqrt(n))$],
  table.cell(fill: vi_farbe2)[*$t$-Verteilung* (Tabelle 4) mit $f = n - 1$ \ $c = t_((p;f))$ mit $p = (1+gamma)/2$],
  table.cell(fill: vi_farbe2)[$theta_u = overline(X) - c dot S/sqrt(n)$ \ $theta_o = overline(X) + c dot S/sqrt(n)$],
  
  // Row 3: Normalverteilung (Chi-Quadrat) - ORANGE
  table.cell(fill: vi_farbe3)[Normalverteilung],
  table.cell(fill: vi_farbe3)[$sigma^2$],
  table.cell(fill: vi_farbe3)[$overline(X) = 1/n sum_(i=1)^n X_i$ \ $S^2 = 1/(n-1) dot sum_(i=1)^n (X_i - overline(X))^2$],
  table.cell(fill: vi_farbe3)[$Z = (n-1) S^2/sigma^2$],
  table.cell(fill: vi_farbe3)[*Chi-Quadrat-Verteilung* (Tabelle 3) mit $f = n - 1$ \ $c_1 = z_((p_1;f))$ mit $p_1 = (1-gamma)/2$ \ $c_2 = z_((p_2;f))$ mit $p_2 = (1+gamma)/2$],
  table.cell(fill: vi_farbe3)[$theta_u = ((n-1) dot S^2)/c_2$ \ $theta_o = ((n-1) dot S^2)/c_1$],
  
  // Row 4: Bernoulli-Verteilung - ROSA
  table.cell(fill: vi_farbe4)[Bernoulli-Verteilung Anteilsschätzung (mit $n hat(p)(1 - hat(p)) > 9$)],
  table.cell(fill: vi_farbe4)[$p$],
  table.cell(fill: vi_farbe4)[$overline(X) = 1/n sum_(i=1)^n X_i$ \ $X_i$ 0/1-wertig mit $P(X_i = 1) = p$],
  table.cell(fill: vi_farbe4)[$U = (overline(X) - p)/sqrt(p(1-p)\/n)$],
  table.cell(fill: vi_farbe4)[*Standardnormalverteilung* (näherungsweise), Tabelle 2 \ $c = u_q$ mit $q = (1+gamma)/2$],
  table.cell(fill: vi_farbe4)[$theta_u = overline(X) - c dot sqrt((overline(X) dot (1 - overline(X)))/n)$ \ $theta_o = overline(X) + c dot sqrt((overline(X) dot (1 - overline(X)))/n)$],
  
  // Row 5: beliebig mit n > 30 - Vertrauensintervall
  table.cell(fill: vi_farbe5)[beliebig mit $n > 30$],
  table.cell(fill: vi_farbe5)[$mu, sigma^2$],
  table.cell(fill: vi_farbe5)[Fall 1 ($s$ Schätzwert für $sigma$) bzw. Fall 3],
  table.cell(fill: vi_farbe5)[],
  table.cell(fill: vi_farbe5)[],
  table.cell(fill: vi_farbe5)[]
)

#columns(4, gutter: 1em)[

  #block(fill: rgb("#e8f5e9"), inset: 4pt, radius: 3pt)[
    *Vertrauensintervall für $mu$ ($sigma$ bekannt)*
  ]

  #example[
    *Gewichte ($sigma = 2$ kg, $n = 100$, $overline(x) = 75$ kg, 95%-Niveau):*
    
    + *Vertrauensniveau festlegen:* 95% → $alpha = 0.05$
    + *Quantil aus Tabelle 2:* $z_(1-alpha\/2) = z_(0.975) = 1.960$
    + *Halbbreite berechnen:*
      $ h = z dot sigma/sqrt(n) = 1.960 dot 2/sqrt(100) = 0.392 $
    + *Intervallgrenzen:*
      $ theta_u = overline(x) - h = 75 - 0.392 = 74.608 $
      $ theta_o = overline(x) + h = 75 + 0.392 = 75.392 $
    
    *Vertrauensintervall:* $[74.608, 75.392]$
  ]

  #colbreak()
  #block(fill: rgb("#e3f2fd"), inset: 4pt, radius: 3pt)[
    *Vertrauensintervall für $mu$ ($sigma$ unbekannt)*
  ]

  #example[
    *Marroni ($n = 8$, $overline(x) = 18$, $s = 2.39$, 95%-Niveau):*
    
    + *Vertrauensniveau:* 95% → $alpha = 0.05$
    + *Freiheitsgrade:* $f = n - 1 = 7$
    + *t-Quantil aus Tabelle 4:* $t_(7\; 0.975) = 2.365$
    + *Halbbreite berechnen:*
      $ h = t dot s/sqrt(n) = 2.365 dot 2.39/sqrt(8) approx 2.0 $
    + *Intervallgrenzen:*
      $ theta_u = 18 - 2.0 = 16.0 $
      $ theta_o = 18 + 2.0 = 20.0 $
    
    *Vertrauensintervall:* $[16.0, 20.0]$
  ]

  #colbreak()
  #block(fill: rgb("#fff3e0"), inset: 4pt, radius: 3pt)[
    *Vertrauensintervall für $sigma^2$*
  ]

  #example[
    *Marroni ($n = 8$, $s^2 = 5.71$, 95%-Niveau):*
    
    + *Vertrauensniveau:* 95% → $alpha = 0.05$
    + *Freiheitsgrade:* $f = n - 1 = 7$
    + *$chi^2$-Quantile aus Tabelle 3:*
      - $chi^2_(7\; 0.975) = 16.01$ (für untere Grenze)
      - $chi^2_(7\; 0.025) = 1.69$ (für obere Grenze)
    + *Intervallgrenzen:*
      $ theta_u = ((n-1) dot s^2)/chi^2_(0.975) = (7 dot 5.71)/16.01 = 2.50 $
      $ theta_o = ((n-1) dot s^2)/chi^2_(0.025) = (7 dot 5.71)/1.69 = 23.66 $
    
    *Vertrauensintervall:* $[2.50, 23.66]$
  ]

  #colbreak()
  #block(fill: rgb("#fce4ec"), inset: 4pt, radius: 3pt)[
    *Vertrauensintervall für Anteilswert $p$*
  ]

  #example[
    *Umfrage ($n = 1200$, $k = 473$ Ja, 99%-Niveau):*
    
    + *Anteil berechnen:*
      $ hat(p) = k/n = 473/1200 = 0.394 $
    + *Faustregel prüfen:*
      $ n hat(p)(1-hat(p)) = 1200 dot 0.394 dot 0.606 = 286.5 >= 9 $
    + *Quantil (Tabelle 2):* $z_(0.995) = 2.576$
    + *Halbbreite:*
      $ h = z sqrt((hat(p)(1-hat(p)))/n) = 2.576 sqrt((0.394 dot 0.606)/1200) approx 0.036 $
    + *Intervallgrenzen:*
      $ theta_u = 0.394 - 0.036 = 0.358 $
      $ theta_o = 0.394 + 0.036 = 0.430 $

    *Vertrauensintervall:* $[0.358, 0.430]$
  ]

]

#image("../assets/image-2.png", height: 110%)

#image("../assets/image-3.png")
