"""
Eigenwerte und Eigenvektoren
"""
import numpy as np

def eigenvalues_eigenvectors(A):
    """
    Berechne Eigenwerte und Eigenvektoren von A.
    
    Args:
        A: Koeffizientenmatrix (n x n)
    
    Returns:
        Tuple: (eigenvalues, eigenvectors)
            - eigenvalues: Array von Eigenwerten
            - eigenvectors: Matrix von Eigenvektoren (Spalten)
    """
    eigenvalues, eigenvectors = np.linalg.eig(A)
    return eigenvalues, eigenvectors


def spectral_radius(A):
    """
    Berechne Spektralradius (größter Eigenwert nach Betrag).
    
    Args:
        A: Koeffizientenmatrix (n x n)
    
    Returns:
        Spektralradius (größter Eigenwert nach Betrag)
    """
    eigenvalues = np.linalg.eigvals(A)
    return np.max(np.abs(eigenvalues))


def eigenvalues_qr(A, tolerance=1e-10, norm=2, max_iterations=10000):
    """
    Berechne Eigenwerte mit QR-Verfahren.
    
    Das QR-Verfahren konvergiert für alle Matrizen, aber die Konvergenzgeschwindigkeit
    hängt ab von den Eigenwertabständen.
    
    Args:
        A: Koeffizientenmatrix (n x n)
        tolerance: Konvergenztoleranz
        norm: Norm-Typ (1, 2, np.inf)
        max_iterations: Maximale Iterationen
    
    Returns:
        Tuple: (eigenvalues, num_iterations, converged)
            - eigenvalues: Diagonale der Schur-Form (Näherung der Eigenwerte)
            - num_iterations: Benötigte Iterationen
            - converged: True wenn Konvergenz erreicht wurde
    """
    A_k = np.copy(A, dtype=np.float64)
    
    for iteration in range(max_iterations):
        Q, R = np.linalg.qr(A_k)
        A_k_new = R @ Q
        
        if np.linalg.norm(A_k_new - A_k, norm) < tolerance:
            return np.diag(A_k_new), iteration + 1, True
        A_k = A_k_new
    
    print(f"WARNUNG: QR-Verfahren hat maximale Iterationen ({max_iterations}) erreicht!")
    return np.diag(A_k), max_iterations, False


def von_mises_iteration(A, v0, tolerance=1e-10, norm=2, max_iterations=10000):
    """
    Berechne größten Eigenwert und Eigenvektor mit von Mises-Iteration.
    
    Konvergiert für Matrizen mit einem dominanten Eigenwert (|λ1| > |λ2|).
    
    Args:
        A: Koeffizientenmatrix (n x n)
        v0: Startvektor
        tolerance: Konvergenztoleranz
        norm: Norm-Typ (1, 2, np.inf)
        max_iterations: Maximale Iterationen
    
    Returns:
        Tuple: (eigenvalue, eigenvector, num_iterations, converged)
            - eigenvalue: Größter Eigenwert
            - eigenvector: Zugehöriger Eigenvektor
            - num_iterations: Benötigte Iterationen
            - converged: True wenn Konvergenz erreicht wurde
    """
    v = v0 / np.linalg.norm(v0, norm)
    lambda_old = 0
    
    for iteration in range(max_iterations):
        w = A @ v
        lambda_new = np.linalg.norm(w, norm)
        v = w / lambda_new
        
        if abs(lambda_new - lambda_old) < tolerance:
            return lambda_new, v, iteration + 1, True
        
        lambda_old = lambda_new
    
    print(f"WARNUNG: von Mises-Verfahren hat maximale Iterationen ({max_iterations}) erreicht!")
    return lambda_new, v, max_iterations, False


A = np.array([[7, -2, -2],
              [-2, 7, -2],
              [-2, -2, 7]], dtype=np.float64)

eigenvalues, eigenvectors = eigenvalues_eigenvectors(A)
print(f"Eigenwerte: {eigenvalues}")
print(f"Eigenvektoren:\n{eigenvectors}")

radius = spectral_radius(A)
print(f"Spektralradius: {radius}")

eigenvalues_qr_result, qr_iterations, qr_converged = eigenvalues_qr(A, tolerance=1e-10)
print(f"Eigenwerte (QR-Verfahren): {eigenvalues_qr_result}")
print(f"Benötigte Iterationen (QR): {qr_iterations}, konvergiert: {qr_converged}")

v0 = np.array([1, 0, 0], dtype=np.float64)
eigenvalue_vm, eigenvector_vm, vm_iterations, vm_converged = von_mises_iteration(A, v0)
print(f"Größter Eigenwert (von Mises): {eigenvalue_vm}")
print(f"Eigenvektor: {eigenvector_vm}")
print(f"Benötigte Iterationen (von Mises): {vm_iterations}, konvergiert: {vm_converged}")
