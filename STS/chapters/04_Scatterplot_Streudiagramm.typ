#import "../../style.typ": default_style, formula, example, steps, variables, math


  = Scatterplot & Streudiagramm

  #variables[evaluieren ob irgendwo gebraucht ]


  *Verwendung:* Visualisierung zweier *metrischer* Merkmale
  
  *Interpretation:*
  - *Form*: linear, gekrümmt, mehrere Cluster
  - *Richtung*: positiv (steigend), negativ (fallend)
  - *Stärke*: eng um Kurve → stark, weit gestreut → schwach
  
  *Warnung:* Korrelation ≠ Kausalität (Scheinkorrelation möglich)

  #steps[
    + Wertepaare $(x_i, y_i)$ als Punkte in Koordinatensystem eintragen
    + Visuelle Inspektion: Form, Richtung, Stärke erkennen
    + Ausreißer identifizieren
    + Korrelationskoeffizient berechnen (Pearson oder Spearman)
    + Immer Scatterplot + Korrelationskoeffizient zusammen angeben!
  ]

