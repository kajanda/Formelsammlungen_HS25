import numpy as np


# a)

def von_mises_iteration(A, v0, tolerance, norm=2, max_iterations=10000):
    v = v0 / np.linalg.norm(v0, norm)
    lambda_old = 0
    
    for iteration in range(max_iterations):
        v_prev = v
        w = A @ v
        lambda_new = np.linalg.norm(w, norm)
        v = w / lambda_new
        
        if abs(np.linalg.norm(v - v_prev, norm)) < tolerance:
            return lambda_new, v, iteration + 1
        
        lambda_old = lambda_new
    
    return lambda_new, v, max_iterations


A = np.array([[30, -3],
              [-13, 4]], dtype=np.float64)

v0 = np.array([1, 0], dtype=np.float64).T

eigenvalue_vm, eigenvector_vm, vm_iterations = von_mises_iteration(A, v0, tolerance=1e-15)
print(f"Größter Eigenwert (von Mises): {eigenvalue_vm}")
print(f"Eigenvektor: {eigenvector_vm}")
print(f"Benötigte Iterationen (von Mises): {vm_iterations}")
