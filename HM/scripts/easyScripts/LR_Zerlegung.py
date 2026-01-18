"""
LR-Zerlegung (LU-Decomposition) mit optionaler Spaltenpivotisierung
"""
import numpy as np

def lr_decomposition(A, use_pivoting=True):
    """
    Berechne LR-Zerlegung von A (A = P^T * L * R).
    
    Args:
        A: Koeffizientenmatrix (n x n)
        use_pivoting: Ob Spaltenpivotisierung verwendet werden soll
    
    Returns:
        Tuple: (R, L, P)
            - R: Obere Dreiecksmatrix
            - L: Normierte untere Dreiecksmatrix
            - P: Permutationsmatrix
    """
    n = A.shape[0]
    R = np.copy(A, dtype=np.float64)
    L = np.eye(n)
    P = np.eye(n)
    
    for col in range(n):
        # Find pivot
        pivot_row = col
        for row in range(col + 1, n):
            if use_pivoting and abs(R[row, col]) > abs(R[pivot_row, col]):
                pivot_row = row
            elif not use_pivoting and abs(R[row, col]) > 0:
                pivot_row = row
                break
        
        # Swap rows
        if pivot_row != col:
            R[[col, pivot_row]] = R[[pivot_row, col]]
            P[[col, pivot_row]] = P[[pivot_row, col]]
            L[[col, pivot_row], :col] = L[[pivot_row, col], :col]
        
        # LR factorization
        for row in range(col + 1, n):
            factor = R[row, col] / R[col, col]
            L[row, col] = factor
            R[row, col:] -= factor * R[col, col:]
    
    return R, L, P


def lr_solve(A, b, use_pivoting=True):
    """
    Löse Ax = b mit LR-Zerlegung.
    
    Args:
        A: Koeffizientenmatrix (n x n)
        b: Rechte-Seite-Vektor (n,)
        use_pivoting: Ob Spaltenpivotisierung verwendet werden soll
    
    Returns:
        x: Lösungsvektor
    """
    R, L, P = lr_decomposition(A, use_pivoting)
    Pb = P @ b
    
    # Forward substitution: Ly = Pb
    n = L.shape[0]
    y = np.zeros(n)
    for row in range(n):
        y[row] = (Pb[row] - np.sum(L[row, :row] * y[:row])) / L[row, row]
    
    # Back substitution: Rx = y
    x = np.zeros(n)
    for row in range(n - 1, -1, -1):
        x[row] = (y[row] - np.sum(R[row, row + 1:] * x[row + 1:])) / R[row, row]
    
    return x


A = np.array([[7, -2, -2],
              [-2, 7, -2],
              [-2, -2, 7]], dtype=np.float64)
b = np.array([5, -13, 14], dtype=np.float64)

R, L, P = lr_decomposition(A, use_pivoting=True)
print(f"R:\n{R}")
print(f"L:\n{L}")
print(f"P:\n{P}")

x = lr_solve(A, b, use_pivoting=True)
print(f"Lösungsvektor x: {x}")
