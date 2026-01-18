"""
Vektor- und Matrixnormen, Konditionszahl
"""
import numpy as np

def vector_norms(v):
    """
    Berechne wichtige Vektornormen.
    
    Args:
        v: Vektor (n,)
    
    Returns:
        Dict mit norm1, norm2, norm_inf
    """
    return {
        'norm1': np.linalg.norm(v, 1),
        'norm2': np.linalg.norm(v, 2),
        'norm_inf': np.linalg.norm(v, np.inf)
    }


def matrix_norms(A):
    """
    Berechne wichtige Matrixnormen.
    
    Args:
        A: Matrix (n x n)
    
    Returns:
        Dict mit norm1, norm2, norm_inf
    """
    return {
        'norm1': np.linalg.norm(A, 1),           # Spaltensummennorm
        'norm2': np.linalg.norm(A, 2),           # Spektralnorm
        'norm_inf': np.linalg.norm(A, np.inf),   # Zeilensummennorm
        'frobenius': np.linalg.norm(A, 'fro')    # Frobenius-Norm
    }


def matrix_row_sum_norm(A):
    """Zeilensummennorm ‖A‖∞ = max_i Σ_j |a_ij|"""
    return np.max([np.sum([abs(aij) for aij in A[i, :]]) for i in range(A.shape[0])])


def matrix_column_sum_norm(A):
    """Spaltensummennorm ‖A‖₁ = max_j Σ_i |a_ij|"""
    return np.max([np.sum([abs(A[i, j]) for i in range(A.shape[0])]) for j in range(A.shape[1])])


def condition_number(A, norm_type='inf'):
    """
    Berechne Konditionszahl cond(A) = ‖A‖ * ‖A⁻¹‖.
    
    Args:
        A: Koeffizientenmatrix (n x n)
        norm_type: 'inf', 1, 2 oder 'fro'
    
    Returns:
        Konditionszahl
    """
    Ainv = np.linalg.inv(A)
    nA = np.linalg.norm(A, norm_type)
    nAinv = np.linalg.norm(Ainv, norm_type)
    return nA * nAinv


v = np.array([1, 2, 3], dtype=np.float64)
vn = vector_norms(v)
print(f"Vektornormen: {vn}")

A = np.array([[7, -2, -2],
              [-2, 7, -2],
              [-2, -2, 7]], dtype=np.float64)
an = matrix_norms(A)
print(f"Matrixnormen: {an}")

row_sum = matrix_row_sum_norm(A)
print(f"Zeilensummennorm: {row_sum}")

col_sum = matrix_column_sum_norm(A)
print(f"Spaltensummennorm: {col_sum}")

cond = condition_number(A, norm_type='inf')
print(f"Konditionszahl: {cond}")
