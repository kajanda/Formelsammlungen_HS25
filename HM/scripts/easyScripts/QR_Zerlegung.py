"""
QR-Zerlegung mit Householder-Reflexionen
"""
import numpy as np

def qr_decomposition(A):
    """
    Berechne QR-Zerlegung von A mit Householder-Reflexionen.
    
    Args:
        A: Koeffizientenmatrix (n x n oder m x n)
    
    Returns:
        Tuple: (Q, R)
            - Q: Orthogonale Matrix
            - R: Obere Dreiecksmatrix
    """
    A = np.copy(A, dtype=np.float64)
    m, n = A.shape
    
    Q = np.eye(m)
    R = A.copy()
    
    for j in range(min(m - 1, n)):
        a = R[j:, j].reshape(-1, 1)
        e = np.eye(m - j)[:, 0].reshape(-1, 1)
        
        norm_a = np.linalg.norm(a)
        sig = np.sign(a[0, 0]) if a[0, 0] != 0 else 1
        v = a + sig * norm_a * e
        
        u = v / np.linalg.norm(v)
        H = np.eye(m - j) - 2 * u @ u.T
        
        # Create full Householder matrix
        Qi = np.eye(m)
        Qi[j:, j:] = H
        
        R = Qi @ R
        Q = Q @ Qi.T
    
    return Q, R


def qr_solve(A, b):
    """
    Löse Ax = b mit QR-Zerlegung.
    
    Args:
        A: Koeffizientenmatrix (n x n)
        b: Rechte-Seite-Vektor (n,)
    
    Returns:
        x: Lösungsvektor
    """
    Q, R = qr_decomposition(A)
    
    # Solve Rx = Q^T b
    QTb = Q.T @ b
    n = R.shape[0]
    x = np.zeros(n)
    
    for row in range(n - 1, -1, -1):
        x[row] = (QTb[row] - np.sum(R[row, row + 1:] * x[row + 1:])) / R[row, row]
    
    return x


A = np.array([[7, -2, -2],
              [-2, 7, -2],
              [-2, -2, 7]], dtype=np.float64)
b = np.array([5, -13, 14], dtype=np.float64)

Q, R = qr_decomposition(A)
print(f"Q:\n{Q}")
print(f"R:\n{R}")

x = qr_solve(A, b)
print(f"Lösungsvektor x: {x}")
