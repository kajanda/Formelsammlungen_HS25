#import "../../style.typ": default_style, formula, example, steps, variables, math


  = lineare Interpolation Klassierte Daten

  #variables[
    *Neue Variablen:*
    
    $a_(k-1), a_k$: Klassenunter-/obergrenze \
    $F(a_k)$: CDF an rechter Klassengrenze
  ]

  #formula[
    Gegeben: Klasse $[a_(k-1), a_k]$ mit $F(a_(k-1)) < q <= F(a_k)$
    
    *Lineare Interpolation:*
    
    #math[$ Q_q = a_(k-1) + (a_k - a_(k-1))/(F(a_k) - F(a_(k-1))) dot (q - F(a_(k-1))) $]
  ]


  #steps[
    + Kumulierte Verteilung $F(a_k)$ aus Tabelle ablesen
    + Klasse finden, in der $F(a_(k-1)) < q <= F(a_k)$
    + Formel anwenden (lineare Interpolation)
  ]


  #example[
    *Mieten (0.7351-Quantil):*
    
    Klasse 1000–1500: $F(1000) = 0.47$, $F(1500) = 0.775$


    $ Q_(0.7351) &= 1000 + (1500 - 1000)/(0.775 - 0.47) dot (0.7351 - 0.47) \
                  &= 1000 + 500/0.305 dot 0.2651 \
                  &approx 1434.78 $
  ]

