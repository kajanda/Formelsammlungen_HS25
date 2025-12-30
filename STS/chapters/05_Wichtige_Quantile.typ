#import "../../style.typ": default_style, formula, example, steps, variables, math


  = Wichtige Quantile

  #variables[
    *Neue Begriffe:*
    
    $z_p$: p-Quantil der Standardnormalverteilung \
    $t_("df"\; p)$: p-Quantil der t-Verteilung mit df Freiheitsgraden
  ]

  #set text(size: 12pt)
  #table(
    columns: 3,
    stroke: 0.5pt,
    inset: 8pt,
    [*Niveau*], [*z-Wert*], [*Verwendung*],
    [90%], [1.645], [Normalvert.],
    [95%], [1.960], [Normalvert.],
    [99%], [2.576], [Normalvert.],
    [95% (n=7)], [2.365], [t-Vert. (df=7)],
    [95% (n=10)], [2.262], [t-Vert. (df=9)]
  )

