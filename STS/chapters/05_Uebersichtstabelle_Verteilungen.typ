#import "../../style.typ": default_style, formula, example, steps, variables, math


  = Übersichtstabelle Verteilungen

  #set text(size: 10pt)
  #table(
    columns: 4,
    stroke: 0.5pt,
    inset: 6pt,
    [*Art*], [*PMF/PDF*], [*E(X)*], [*Var(X)*],
    
    [Bernoulli], [$p^x (1-p)^(1-x)$], [$p$], [$p(1-p)$],
    
    [Binomial], [$binom(n,k) p^k (1-p)^(n-k)$], [$n p$], [$n p(1-p)$],
    
    [Poisson], [$(lambda^k e^(-lambda))/k!$], [$lambda$], [$lambda$],
    
    [Hyperg.], [$(binom(M,k) binom(N-M,n-k))/binom(N,n)$], [$n M/N$], [$dots$],
    
    [Normal], [$1/(sqrt(2pi)sigma) exp(-(x-mu)^2/(2sigma^2))$], [$mu$], [$sigma^2$]
  )

