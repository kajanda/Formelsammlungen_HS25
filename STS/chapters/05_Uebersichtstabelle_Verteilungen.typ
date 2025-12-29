#import "../../style.typ": default_style, formula, example, steps, variables, math


  = Übersichtstabelle Verteilungen

  #table(
    columns: 4,
    [*Verteilung*], [*PMF/PDF*], [*E(X)*], [*Var(X)*],
    
    [Bernoulli], [$p^x (1-p)^(1-x)$], [$p$], [$p(1-p)$],
    
    [Binomial], [$binom(n,k) p^k (1-p)^(n-k)$], [$n p$], [$n p(1-p)$],
    
    [Poisson], [$(lambda^k e^(-lambda))/k!$], [$lambda$], [$lambda$],
    
    [Hypergeom.], [$(binom(M,k) binom(N-M,n-k))/binom(N,n)$], [$n M/N$], [$dots$],
    
    [Normal], [$1/(sqrt(2pi)sigma) e^(-(x-mu)^2\/(2sigma^2))$], [$mu$], [$sigma^2$]
  )

