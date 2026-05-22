"""
Jacobi-Verfahren für iterative Lösung von Ax = b
"""
import numpy as np

def jacobi_fixpoint(A, b, x0, omega = 1.15, tolerance=1e-5, max_iterations=10000, norm = np.inf):

    D = np.diag(np.diag(A))
    L = np.tril(A, -1)
    R = np.triu(A, 1)
    
    B = np.linalg.inv(D)*omega @ - (((omega-1)/omega) *D + L + R)
    c = omega * (np.linalg.inv(D) @ b)
    
    x = x0
    x1=0
    
    for iteration in range(max_iterations):
        x_new = B @ x + c
        
        if np.linalg.norm(B,norm)/(1-np.linalg.norm(B,norm))  * np.linalg.norm(x_new-x, norm) < tolerance:
            return x_new, iteration + 1, B, c
        
        x = x_new
    
    return x, max_iterations, B, c


A = np.array([[7,-2,-2],
              [-2,7,-2],
              [-2, -2, 7]], dtype=np.float64)
b = np.array([5,-13,14], dtype=np.float64)
x0 = np.array([0, 0, 0], dtype=np.float64)


result = jacobi_fixpoint(A, b, x0, omega=1.15, tolerance=1e-9, norm=1)


print(f"x: {result[0]}")
print(f"Benötigte Iterationen: {result[1]}")
print(f"B:\n{result[2]}")
print(f"c: {result[3]}")