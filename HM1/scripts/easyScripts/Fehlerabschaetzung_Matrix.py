"""
Fehlerabschätzung für fehlerbehaftete Matrix und Vektor
Analysiert Fehlerfortpflanzung wenn Matrix A und Vektor b gestört sind.
"""
import numpy as np

def estimate_matrix_vector_error(A, b, db, dA):
    """
    Berechne Fehlerabschätzung für gestörte Matrix A und Vektor b.
    
    Args:
        A: Koeffizientenmatrix (n x n)
        b: Rechte-Seite-Vektor (n,)
        db: Maximaler relativer Fehler in b
        dA: Maximaler relativer Fehler in A
    
    Returns:
        Tuple: (cond_A, relative_error)
            - cond_A: Konditionszahl von A
            - relative_error: Maximaler relativer Fehler von x
    """
    niA = np.max([np.sum([abs(aij) for aij in A[i, :]]) for i in range(A.shape[0])])
    Ainv = np.linalg.inv(A)
    niAinv = np.max([np.sum([abs(aij) for aij in Ainv[i, :]]) for i in range(Ainv.shape[0])])
    condA = niA * niAinv
    
    dAtot = A.shape[1] * dA
    dArel = dAtot / niA
    
    nib = np.max([abs(bi) for bi in b])
    dbrel = db / nib
    
    dxrel = condA / (1 - condA * dArel) * (dArel + dbrel)
    
    return condA, dxrel


A = np.array([[7, -2, -2],
              [-2, 7, -2],
              [-2, -2, 7]], dtype=np.float64)
b = np.array([5, -13, 14], dtype=np.float64)
db = 0.1
dA = 0.01

cond_A, rel_error = estimate_matrix_vector_error(A, b, db, dA)
print(f"Konditionszahl: {cond_A}")
print(f"Relativer Fehler: {rel_error}")
