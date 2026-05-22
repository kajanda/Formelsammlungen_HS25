"""
Easy Scripts - Index und zentrale Import-Verwaltung
Vereinfachte Implementationen numerischer Verfahren ohne Debug-Ausgaben
"""

# Fehlerabschätzung
from .Fehlerabschaetzung_Vektor import estimate_vector_error
from .Fehlerabschaetzung_Matrix import estimate_matrix_vector_error

# Wurzelfindung
from .Newtonverfahren import newton_method
from .Sekantenverfahren import secant_method
from .Fixpunktiteration import fixed_point_iteration

# Direkte Verfahren für lineare Gleichungssysteme
from .Gauss import gauss_solve_simple
from .Gauss_Pivotisierung import gauss_solve_pivoting
from .LR_Zerlegung import lr_decomposition, lr_solve
from .QR_Zerlegung import qr_decomposition, qr_solve

# Iterative Verfahren für lineare Gleichungssysteme
from .Jacobi import jacobi_direct, jacobi_fixpoint
from .Gauss_Seidel import gauss_seidel

# Matrizeneigenschaften
from .Matrixnormen import (
    vector_norms, matrix_norms, matrix_row_sum_norm,
    matrix_column_sum_norm, condition_number
)
from .Eigenwerte import (
    eigenvalues_eigenvectors, spectral_radius,
    eigenvalues_qr, von_mises_iteration
)

# Komplexe Zahlen
from .Komplexe_Zahlen import (
    complex_add, complex_multiply, complex_divide,
    complex_conjugate, complex_abs, complex_arg,
    complex_to_polar, polar_to_complex, polynomial_roots
)

# Maschinenzahlen
from .Maschinenzahlen import (
    machine_numbers_info, machine_epsilon_binary,
    machine_epsilon_decimal, compare_machine_precision,
    convert_to_machine_number
)

# Grundfunktionen
from .Grundfunktionen import (
    derivative_symbolic, integral_symbolic, definite_integral,
    factorial_recursive, factorial_iterative, factorial_builtin,
    condition_number_function
)

__all__ = [
    # Fehlerabschätzung
    'estimate_vector_error',
    'estimate_matrix_vector_error',
    
    # Wurzelfindung
    'newton_method',
    'secant_method',
    'fixed_point_iteration',
    
    # Direkte Verfahren
    'gauss_solve_simple',
    'gauss_solve_pivoting',
    'lr_decomposition',
    'lr_solve',
    'qr_decomposition',
    'qr_solve',
    
    # Iterative Verfahren
    'jacobi_direct',
    'jacobi_fixpoint',
    'gauss_seidel',
    
    # Matrizeneigenschaften
    'vector_norms',
    'matrix_norms',
    'matrix_row_sum_norm',
    'matrix_column_sum_norm',
    'condition_number',
    'eigenvalues_eigenvectors',
    'spectral_radius',
    'eigenvalues_qr',
    'von_mises_iteration',
    
    # Komplexe Zahlen
    'complex_add',
    'complex_multiply',
    'complex_divide',
    'complex_conjugate',
    'complex_abs',
    'complex_arg',
    'complex_to_polar',
    'polar_to_complex',
    'polynomial_roots',
    
    # Maschinenzahlen
    'machine_numbers_info',
    'machine_epsilon_binary',
    'machine_epsilon_decimal',
    'compare_machine_precision',
    'convert_to_machine_number',
    
    # Grundfunktionen
    'derivative_symbolic',
    'integral_symbolic',
    'definite_integral',
    'factorial_recursive',
    'factorial_iterative',
    'factorial_builtin',
    'condition_number_function',
]
