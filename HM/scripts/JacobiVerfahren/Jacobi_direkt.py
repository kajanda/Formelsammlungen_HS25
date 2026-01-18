"""
    Iteratives Lösen eines LGS Ax = b mit Jacobi-Verfahren
"""

import numpy as np

"""==================== INPUT ===================="""
A = np.array([[4.0, -1, 0, 0, 0, 0],
              [-1, 4.0, -1, 0, 0, 0],
              [0, -1, 4.0, -1, 0, 0],
              [0, 0, -1, 4.0, -1, 0],
              [0, 0, 0, -1, 4.0, -1],
              [0, 0, 0, 0, -1, 4.0]], dtype=np.float64)
b = np.array([4.0, 0, 0, 0, 0, 4.0], dtype=np.float64)
x0 = np.array([0, 0, 0, 0, 0, 0], dtype=np.float64)
tol = 1e-3  # Maximaler a-posteriori Fehler
norm = 1 # Norm für Fehlerabschätzung (np.inf, 1, 2)

use_fixpunkt = True  # True = Fixpunktiteration x_(n+1) = Bx_n + c, False = direkte Methode
show_steps = True
"""==============================================="""


def solve_jacobi(A, b, x0, tol):
    if not (A.shape[0] == A.shape[1]):
        raise Exception('A is misshaped.')

    if not (A.shape[0] == b.shape[0]):
        raise Exception('The shape of b does not match the size of A.')

    if not (A.shape[0] == x0.shape[0]):
        raise Exception('The shape of x0 does not match the size of A.')

    if show_steps:
        print("========== EINGABEPARAMETER ==========")
        print("Vektor b (rechte Seite):\n" + str(b))
        print("\nStartvektor x0:\n" + str(x0))
        print("Toleranz (Fehlergrenze): " + str(tol))
        print("Ausführungsmethode: " + ("Fixpunktiteration" if use_fixpunkt else "Direkte Methode"))
        print("======================================\n")

    B = get_b(A)
    c = None
    if use_fixpunkt:
        c = np.linalg.inv(np.diag(np.diag(A))) @ b

    if not (is_converging(B)):
        raise Exception('Iteration will not converge.')
    elif show_steps:
        print("Iteration konvergiert!")

    if use_fixpunkt:
        if show_steps and c is not None:
            print("\nVektor c berechnen. c = D⁻¹ * b =\n" + str(c))
            print("Fixpunktiteration: x_(n+1) = Bx_n + c\n")
        x = iterate_jacobi_fixpunkt(B, c, x0, tol)
    else:
        x = iterate_jacobi(A, B, b, x0, tol)
    err = calculate_error_a_posteriori(B, x[-1], x[-2])

    n2 = calculate_required_steps_a_priori(B, x0, x[1], tol)

    return x[-1], len(x) - 1, n2, err


def get_b(A):
    D = np.diag(np.diag(A))
    L = np.tril(A, -1)
    R = np.triu(A, 1)

    if show_steps:
        print("\n========== MATRIX-ZERLEGUNG ==========")
        print("Matrix A (Koeffizientenmatrix):\n" + str(A))
        print("\nDiagonalmatrix D:\n" + str(D))
        print("\nUntere Dreiecksmatrix L (ohne Diagonale):\n" + str(L))
        print("\nObere Dreiecksmatrix R (ohne Diagonale):\n" + str(R))

    B = -np.linalg.inv(D) @ (L + R)

    if show_steps:
        print("\nMatrix B berechnen. B = -D⁻¹ * (L + R) = \n" + str(B))
        print("=====================================\n")

    return B


def is_converging(B):
    nb = np.linalg.norm(B, norm)

    if show_steps:
        print("Iteration auf Konvergenz prüfen. Iteration konvergiert, wenn ‖B‖ < 1. ‖B‖ = " + str(nb))

    return nb < 1


def iterate_jacobi(A, B, b, x0, tol):
    dim = b.shape[0]  # matrix size
    x = [x0]  # array of all step results x0, x1, ... xn
    err = 'N/A'

    while len(x) < 2 or err > tol:
        x_curr = np.zeros(dim)
        for i in range(dim):
            sum_ = 0
            for j in range(dim):
                if i == j: continue
                sum_ += A[i, j] * x[-1][j]

            x_curr[i] = (1 / A[i, i]) * (b[i] - sum_)

        x.append(x_curr)
        err = calculate_error_a_posteriori(B, x[-1], x[-2])

        if show_steps:
            print("n = " + str(len(x) - 1) + ": x" + str(len(x) - 1) + " = " + str(
                x_curr) + ", a-posteriori Fehler: " + str(err))

    return x


def iterate_jacobi_fixpunkt(B, c, x0, tol):
    """
    Führe Fixpunktiteration durch: x_(n+1) = Bx_n + c
    """
    x = [x0]  # array of all step results x0, x1, ... xn
    err = 'N/A'

    while len(x) < 2 or err > tol:
        x_curr = B @ x[-1] + c
        x.append(x_curr)
        err = calculate_error_a_posteriori(B, x[-1], x[-2])

        if show_steps:
            print("n = " + str(len(x) - 1) + ": x" + str(len(x) - 1) + " = " + str(
                x_curr) + ", a-posteriori Fehler: " + str(err))

    return x


def calculate_error_a_posteriori(B, xn, xnm1):
    norm_b = np.linalg.norm(B, norm)

    err = (norm_b / (1 - norm_b)) * np.linalg.norm((xn - xnm1), norm)
    return err


def calculate_required_steps_a_priori(B, x0, x1, tol):
    norm_b = np.linalg.norm(B, norm)
    n_min = np.log((-(norm_b - 1) * tol) / (np.linalg.norm(x1 - x0, norm))) / np.log(norm_b)
    return n_min


xn, n, n2, err = solve_jacobi(A, b, x0, tol)

print("\n==========================")
method = "Jacobi (Fixpunktiteration)" if use_fixpunkt else "Jacobi (direkte Methode)"
print('Lösung des Gleichungssystems durch ' + method + ':')
print('x = ' + str(xn))
print('Genautigkeit a-posteriori: ' + str(err))
print('Benötigte Iterationen: n = ' + str(n))
print('Theoretisch min. benötigte Iterationen gem. a-priori-Abschätzung: n2 = ' + str(n2))
print('')
