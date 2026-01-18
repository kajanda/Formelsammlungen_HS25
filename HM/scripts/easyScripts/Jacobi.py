"""
Jacobi-Verfahren für iterative Lösung von Ax = b
"""
import sys
import numpy as np

def jacobi_direct(A, b, x0, tolerance=1e-5, norm=np.inf, max_iterations=10000):
    """
    Löse Ax = b mit direktem Jacobi-Verfahren.
    
    Args:
        A: Koeffizientenmatrix (n x n)
        b: Rechte-Seite-Vektor (n,)
        x0: Startvektor
        tolerance: Abbruchgenauigkeit
        norm: Norm-Typ (1, 2, np.inf)
        max_iterations: Maximale Iterationen
    
    Returns:
        Tuple: (x, num_iterations)
            - x: Lösungsvektor
            - num_iterations: Benötigte Iterationen
    """
    n = A.shape[0]
    x = x0.copy()
    
    for iteration in range(max_iterations):
        x_new = np.zeros(n)
        for i in range(n):
            sum_val = np.sum(A[i, :i] * x[:i]) + np.sum(A[i, i+1:] * x[i+1:])
            x_new[i] = (b[i] - sum_val) / A[i, i]
        
        if np.linalg.norm(x_new - x, norm) < tolerance:
            return x_new, iteration + 1
        
        x = x_new
    
    return x, max_iterations


def jacobi_fixpoint(A, b, x0, tolerance=1e-5, norm=np.inf, max_iterations=10000):
    """
    Löse Ax = b mit Jacobi-Fixpunktiteration: x_(n+1) = B*x_n + c.
    
    Konvergenzkriterium: ||B||_norm < 1 ist notwendig für Konvergenz!
    
    Args:
        A: Koeffizientenmatrix (n x n)
        b: Rechte-Seite-Vektor (n,)
        x0: Startvektor
        tolerance: Abbruchgenauigkeit
        norm: Norm-Typ (1, 2, np.inf)
        max_iterations: Maximale Iterationen
    
    Returns:
        Tuple: (x, num_iterations, B, c, converges)
            - x: Lösungsvektor
            - num_iterations: Benötigte Iterationen
            - B: Iterationsmatrix
            - c: Konstanter Vektor
            - converges: True wenn ||B|| < 1 (Konvergenz theoretisch möglich)
    """
    D = np.diag(np.diag(A))
    L = np.tril(A, -1)
    R = np.triu(A, 1)
    
    B = -np.linalg.inv(D) @ (L + R)
    c = np.linalg.inv(D) @ b
    
    # Konvergenzkriterium überprüfen
    B_norm = np.linalg.norm(B, norm)
    converges = B_norm < 1.0
    
    if not converges:
        print(f"WARNUNG: ||B||_{norm} = {B_norm} >= 1.0 => Jacobi-Verfahren konvergiert NICHT!")
        sys.exit(1)
    
    x = x0.copy()
    
    for iteration in range(max_iterations):
        x_new = B @ x + c
        
        if np.linalg.norm(x_new - x, norm) < tolerance:
            return x_new, iteration + 1, B, c, converges
        
        x = x_new
    
    return x, max_iterations, B, c, converges


A = np.array([[7, -2, -2],
              [-2, 7, -2],
              [-2, -2, 7]], dtype=np.float64)
b = np.array([5, -13, 14], dtype=np.float64)
x0 = np.array([0, 0, 0], dtype=np.float64)

x_direct, iter_direct = jacobi_direct(A, b, x0, tolerance=1e-9, norm=np.inf, max_iterations=10000)
print(f"x (direktes Verfahren): {x_direct}")
print(f"Benötigte Iterationen: {iter_direct}")

result = jacobi_fixpoint(A, b, x0, 1e-9, max_iterations=10000, norm=1)
print(f"\nx (Fixpunktiteration): {result[0]}")
print(f"Benötigte Iterationen: {result[1]}")
print(f"||B||_1 = {np.linalg.norm(result[2], 1):.6f} (konvergiert: {result[4]})")
print(f"B:\n{result[2]}")
print(f"c: {result[3]}")
