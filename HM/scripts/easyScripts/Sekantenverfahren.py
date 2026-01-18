"""
Sekantenverfahren für Nullstellensuche
"""

def secant_method(f, x0, x1, tolerance=1e-8, max_iterations=10000):
    """
    Finde Nullstelle von f(x) mit Sekantenverfahren.
    
    Args:
        f: Callable Funktion f(x)
        x0, x1: Zwei Startwerte
        tolerance: Abbruchgenauigkeit
        max_iterations: Maximale Anzahl Iterationen
    
    Returns:
        Tuple: (root, num_iterations)
            - root: Gefundene Nullstelle
            - num_iterations: Benötigte Iterationen
    """
    xn = [x0, x1]
    n = 1
    
    while n < max_iterations and abs(xn[n] - xn[n-1]) > tolerance:
        xn.append(xn[n] - ((xn[n] - xn[n-1]) / (f(xn[n]) - f(xn[n-1]))) * f(xn[n]))
        n += 1
    
    return xn[-1], n


f = lambda x: x**2 - 2
x0 = 1.0
x1 = 2.0

root, iterations = secant_method(f, x0, x1, tolerance=1e-8, max_iterations=10000)
print(f"Nullstelle: {root}")
print(f"Benötigte Iterationen: {iterations}")
