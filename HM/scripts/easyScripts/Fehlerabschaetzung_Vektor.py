"""
Fehlerabschätzung für fehlerbehaftete Vektoren (rechte Seite b)
Analysiert Fehlerfortpflanzung wenn nur der Vektor b gestört wird.
"""
import numpy as np

def estimate_vector_error(A, b, db):
    """
    Berechne Fehlerabschätzung für gestörten Vektor b in Ax = b.
    
    Args:
        A: Koeffizientenmatrix (n x n)
        b: Rechte-Seite-Vektor (n,)
        db: Maximaler absoluter Fehler in jeder Komponente von b
    
    Returns:
        Tuple: (cond_A, absolute_error, relative_error)
            - cond_A: Konditionszahl von A (‖A‖∞ * ‖A⁻¹‖∞)
            - absolute_error: Maximaler absoluter Fehler ‖x - x~‖∞
            - relative_error: Maximaler relativer Fehler ‖x - x~‖∞ / ‖x‖∞
    """
    niA = np.max([np.sum([abs(aij) for aij in A[i, :]]) for i in range(A.shape[0])])
    Ainv = np.linalg.inv(A)
    niAinv = np.max([np.sum([abs(aij) for aij in Ainv[i, :]]) for i in range(Ainv.shape[0])])
    condA = niA * niAinv
    
    dxabs = niAinv * db
    
    nib = np.max([abs(bi) for bi in b])
    dxrel = condA * (db / nib)
    
    return condA, dxabs, dxrel


A = np.array([[7, -2, -2],
              [-2, 7, -2],
              [-2, -2, 7]], dtype=np.float64)
b = np.array([5, -13, 14], dtype=np.float64)
db = 0.1

cond_A, abs_error, rel_error = estimate_vector_error(A, b, db)
print(f"Konditionszahl: {cond_A}")
print(f"Absoluter Fehler: {abs_error}")
print(f"Relativer Fehler: {rel_error}")
