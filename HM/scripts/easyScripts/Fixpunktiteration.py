"""
Fixpunktiteration mit Abbruchbedingung
"""
import numpy as np

def fixed_point_iteration(F, x0, tolerance=1e-6, max_iterations=10000):
    """
    Löse Fixpunktgleichung F(x) = x durch Iteration.
    
    Args:
        F: Funktion F(x) (callables)
        x0: Startwert
        tolerance: Abbruchgenauigkeit
        max_iterations: Maximale Anzahl Iterationen
    
    Returns:
        Tuple: (result, num_iterations)
            - result: Gefundener Fixpunkt
            - num_iterations: Benötigte Iterationen
    """
    xn = [x0, F(x0)]
    n = 1
    
    while n < max_iterations and abs(xn[n] - xn[n-1]) > tolerance:
        n += 1
        xn.append(F(xn[n-1]))
    
    return xn[-1], n


F = lambda x: (x + 2 / x) / 2
x0 = 1.0
result, iterations = fixed_point_iteration(F, x0, tolerance=1e-9, max_iterations=10000)
print(f"Fixpunkt: {result}")
print(f"Benötigte Iterationen: {iterations}")
