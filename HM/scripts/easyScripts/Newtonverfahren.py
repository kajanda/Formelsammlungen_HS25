"""
Newton-Verfahren für Nullstellensuche
"""
import sympy as sy

def newton_method(f_expr, x0, tolerance=1e-7, max_iterations=10000):
    """
    Finde Nullstelle von f(x) mit Newton-Verfahren.
    
    Args:
        f_expr: Sympy-Expression der Funktion (z.B. 'x**2 - 2')
        x0: Startwert
        tolerance: Abbruchgenauigkeit
        max_iterations: Maximale Anzahl Iterationen
    
    Returns:
        Tuple: (root, num_iterations)
            - root: Gefundene Nullstelle
            - num_iterations: Benötigte Iterationen
    """
    x = sy.symbols('x')
    
    df = sy.diff(f_expr, x)
    fl = sy.lambdify(x, f_expr)
    dfl = sy.lambdify(x, df)
    
    xn = [x0]
    n = 0
    
    while n < max_iterations:
        xn.append(xn[n] - fl(xn[n]) / dfl(xn[n]))
        n += 1
        
        if n > 0 and abs(xn[n] - xn[n-1]) <= tolerance:
            break
    
    return xn[-1], n


x = sy.symbols('x')
f = x**2 - 2
x0 = 1.0

root, iterations = newton_method(f, x0, tolerance=1e-7, max_iterations=10000)
print(f"Nullstelle: {root}")
print(f"Benötigte Iterationen: {iterations}")
