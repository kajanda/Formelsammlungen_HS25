"""
Gauss-Seidel-Verfahren für iterative Lösung von Ax = b
"""
import numpy as np

def gauss_seidel(A, b, x0, tolerance=1e-5, norm=np.inf, max_iterations=10000):
    """
    Löse Ax = b mit Gauss-Seidel-Verfahren.
    
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
        x_new = x.copy()
        for i in range(n):
            sum_val = np.sum(A[i, :i] * x_new[:i]) + np.sum(A[i, i+1:] * x[i+1:])
            x_new[i] = (b[i] - sum_val) / A[i, i]
        
        if np.linalg.norm(x_new - x, norm) < tolerance:
            return x_new, iteration + 1
        
        x = x_new
    
    return x, max_iterations


def gauss_seidel_fixpoint(A, b, x0, tolerance=1e-5, norm=np.inf, max_iterations=10000):
    """
    Löse Ax = b mit Gauss-Seidel als Fixpunktiteration: x_(n+1) = M*x_n + c.
    
    Args:
        A: Koeffizientenmatrix (n x n)
        b: Rechte-Seite-Vektor (n,)
        x0: Startvektor
        tolerance: Abbruchgenauigkeit
        norm: Norm-Typ (1, 2, np.inf)
        max_iterations: Maximale Iterationen
    
    Returns:
        Tuple: (x, num_iterations, M, c)
            - x: Lösungsvektor
            - num_iterations: Benötigte Iterationen
            - M: Iterationsmatrix M = (D + L)^(-1) * R
            - c: Konstanter Vektor c = (D + L)^(-1) * b
    """
    D = np.diag(np.diag(A))
    L = np.tril(A, -1)
    R = np.triu(A, 1)
    
    DL_inv = np.linalg.inv(D + L)
    M = -DL_inv @ R
    c = DL_inv @ b
    
    x = x0.copy()
    
    for iteration in range(max_iterations):
        x_new = M @ x + c
        
        if np.linalg.norm(x_new - x, norm) < tolerance:
            return x_new, iteration + 1, M, c
        
        x = x_new
    
    return x, max_iterations, M, c


A = np.array([[7, -2, -2],
              [-2, 7, -2],
              [-2, -2, 7]], dtype=np.float64)
b = np.array([5, -13, 14], dtype=np.float64)
x0 = np.array([0, 0, 0], dtype=np.float64)

x, iterations = gauss_seidel(A, b, x0, tolerance=1e-9, norm=np.inf, max_iterations=10000)
print(f"Lösungsvektor x (direktes Verfahren): {x}")
print(f"Benötigte Iterationen: {iterations}")

result = gauss_seidel_fixpoint(A, b, x0, tolerance=1e-9, norm=np.inf, max_iterations=10000)
print(f"\nx (Fixpunktiteration): {result[0]}")
print(f"Benötigte Iterationen: {result[1]}")
print(f"M:\n{result[2]}")
print(f"c: {result[3]}")
