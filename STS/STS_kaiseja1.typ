#import "../style.typ": default_style, formula, example, steps, variables, math
#show: default_style

#columns(3, gutter: 10pt)[
// PMF PDF CMF CDF Grundbegriffe 
#include "./chapters/01_Grundbegriffe.typ"
#include "./chapters/01_Diagramtypen.typ"
#include "./chapters/01_Haeufigkeiten_Verteilungen.typ"

// Median Quantile Boxplot Kennwerte
#include "./chapters/02_Median_Quantile.typ"
#include "./chapters/02_Quantile_klassierte_Daten.typ"
#include "./chapters/02_Boxplot_Kennwerte.typ"

// Mittelwert Varianz Korrelation Regression
#include "./chapters/03_Mittelwert_Varianz.typ"
#include "./chapters/03_Bivariate_Daten_Kovarianz.typ"
#include "./chapters/03_Korrelation_Bravais_Pearson.typ"
#include "./chapters/03_Lineare_Regression.typ"
#include "./chapters/03_Spearman_Rangkorrelation.typ"

// Wahrscheinlichkeitsrechnung
#include "./chapters/04_Diskreter_Wahrscheinlichkeitsraum.typ"
#include "./chapters/04_Laplace_Experiment.typ"
#include "./chapters/04_Rechnen_Zufallsvariablen.typ"
#include "./chapters/04_Kombinatorik.typ"
#include "./chapters/04_Scatterplot_Streudiagramm.typ"
#include "./chapters/04_Bedingte_Wahrscheinlichkeit.typ"
#include "./chapters/04_Ereignisbaeum_Satz_Bayes.typ"

// Verteilungen und Schätzwerte
#include "./chapters/05_Uebersichtstabelle_Verteilungen.typ"
#include "./chapters/05_Wichtige_Quantile.typ"
#include "./chapters/05_Binomialverteilung.typ"
#include "./chapters/05_Poissonverteilung.typ"
#include "./chapters/05_Hypergeometrische_Verteilung.typ"
#include "./chapters/05_Normalverteilung.typ"
#include "./chapters/05_Normalapproximation_Binomial.typ"
#include "./chapters/05_Zentraler_Grenzwertsatz.typ"

// Schätzwerte
#include "./chapters/06_Schaetzwerte.typ"
]
#pagebreak()
#include "./chapters/07_Vertrauensintervalle.typ"
