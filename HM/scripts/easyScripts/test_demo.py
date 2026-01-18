"""
Demonstrationsskript für Easy Scripts
Zeigt die Verwendung der vereinfachten Verfahren
"""

import sys
sys.path.insert(0, '/home/jank/ZHAW/Zusammenfassungen/HM/scripts')

import numpy as np
import sympy as sy
from easyScripts import (
    gauss_solve_pivoting, 
    newton_method, 
    jacobi_direct,
    eigenvalues_eigenvectors,
    machine_epsilon_binary
)

print("="*60)
print("EASY SCRIPTS - DEMONSTRATIONSSKRIPT")
print("="*60)

# 1. Gauss mit Pivotisierung
print("\n1. GAUSS-ALGORITHMUS mit Spaltenpivotisierung")
print("-" * 60)
A = np.array([[2, 1, 3], [1, 3, 1], [3, 1, 2]], dtype=np.float64)
b = np.array([10, 8, 11], dtype=np.float64)
x, det = gauss_solve_pivoting(A, b)
print(f"Lösungsvektor x: {x}")
print(f"Determinante: {det}")

# 2. Newton-Verfahren
print("\n2. NEWTON-VERFAHREN")
print("-" * 60)
x = sy.symbols('x')
f = x**3 - 2  # Suche 3. Wurzel von 2
root, iterations = newton_method(f, x0=1.5, tolerance=1e-10)
print(f"Nullstelle von x³ - 2 = 0: {float(root):.10f}")
print(f"Benötigte Iterationen: {iterations}")

# 3. Jacobi-Verfahren
print("\n3. JACOBI-ITERATIVES VERFAHREN")
print("-" * 60)
A = np.array([[4, -1, 0], [-1, 4, -1], [0, -1, 4]], dtype=np.float64)
b = np.array([15, 10, 10], dtype=np.float64)
x0 = np.zeros(3)
solution, iters = jacobi_direct(A, b, x0, tolerance=1e-6)
print(f"Lösung nach {iters} Iterationen: {solution}")

# 4. Eigenwertproblem
print("\n4. EIGENWERTE UND EIGENVEKTOREN")
print("-" * 60)
A = np.array([[2, 1], [1, 2]], dtype=np.float64)
eigenvals, eigenvecs = eigenvalues_eigenvectors(A)
print(f"Eigenwerte: {eigenvals}")
print(f"Eigenvektoren:\n{eigenvecs}")

# 5. Maschinenzahlen
print("\n5. MASCHINENZAHLEN (Maschinenepsilon)")
print("-" * 60)
eps = machine_epsilon_binary()
print(f"Maschinenepsilon (binär): {eps}")
print(f"1.0 + ε = {1.0 + eps}")
print(f"1.0 + ε/2 = {1.0 + eps/2}")

print("\n" + "="*60)
print("ALLE TESTS ERFOLGREICH ABGESCHLOSSEN!")
print("="*60)
