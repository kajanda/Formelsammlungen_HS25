"""
Gauss-Algorithmus zur Lösung von Ax = b (ohne Spaltenpivotisierung)
"""
import numpy as np

def gauss_solve_simple(A, b):
    """
    Löse lineares Gleichungssystem Ax = b mit Gauss-Elimination.
    
    Args:
        A: Koeffizientenmatrix (n x n)
        b: Rechte-Seite-Vektor (n,)
    
    Returns:
        Tuple: (x, det)
            - x: Lösungsvektor
            - det: Determinante von A
    """
    R = np.copy(A, dtype=np.float64)
    v = np.copy(b, dtype=np.float64)
    
    n = R.shape[0]
    row_inv_count = 0
    
    # Forward elimination
    for col in range(n - 1):
        # Find non-zero pivot
        max_row = col
        for row in range(col + 1, n):
            if abs(R[row, col]) > abs(R[max_row, col]):
                max_row = row
        
        if abs(R[max_row, col]) < 1e-14:
            continue
        
        if max_row != col:
            R[[col, max_row]] = R[[max_row, col]]
            v[[col, max_row]] = v[[max_row, col]]
            row_inv_count += 1
        
        # Eliminate column
        for row in range(col + 1, n):
            factor = R[row, col] / R[col, col]
            R[row, col:] -= factor * R[col, col:]
            v[row] -= factor * v[col]
    
    # Back substitution
    x = np.zeros(n)
    for row in range(n - 1, -1, -1):
        x[row] = (v[row] - np.sum(R[row, row + 1:] * x[row + 1:])) / R[row, row]
    
    # Calculate determinant
    det = (-1) ** row_inv_count
    for i in range(n):
        det *= R[i, i]
    
    return x, det


A = np.array([[7, -2, -2],
              [-2, 7, -2],
              [-2, -2, 7]], dtype=np.float64)
b = np.array([5, -13, 14], dtype=np.float64)

x, det = gauss_solve_simple(A, b)
print(f"Lösungsvektor x: {x}")
print(f"Determinante: {det}")
