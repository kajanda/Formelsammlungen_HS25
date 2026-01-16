"""
    Iteratives Lösen eines LGS Ax = b mit Jacobi-Verfahren
    Als Fixpunktiteration der Form x = Bx + c mit B = -D⁻¹(L + R) und c = D⁻¹b
"""

import numpy as np

"""==================== INPUT ===================="""

#A = np.array([[4.0, -1, 0, 0, 0, 0],
#              [-1, 4.0, -1, 0, 0, 0],
#              [0, -1, 4.0, -1, 0, 0],
#              [0, 0, -1, 4.0, -1, 0],
#              [0, 0, 0, -1, 4.0, -1],
#              [0, 0, 0, 0, -1, 4.0]], dtype=np.float64)

A = np.array([
    [7, -2, -2],
    [-2, 7, -2],
    [-2, -2, 7]
])

#b = np.array([4.0, 0, 0, 0, 0, 4.0], dtype=np.float64)
b = np.array([5, -13, 14], dtype=np.float64)

#x0 = np.array([0, 0, 0, 0, 0, 0], dtype=np.float64)
x0 = np.array([0, 0, 0], dtype=np.float64)

tol = 1e-9  # Maximaler a-posteriori Fehler

show_steps = False
"""==============================================="""

def solve_jacobi(A, b, x0, tol):
    if not (A.shape[0] == A.shape[1]):
        raise Exception('A is misshaped.')

    if not (A.shape[0] == b.shape[0]):
        raise Exception('The shape of b does not match the size of A.')

    if not (A.shape[0] == x0.shape[0]):
        raise Exception('The shape of x0 does not match the size of A.')

    B = get_b(A)

    if not (is_converging(B)):
        raise Exception('Iteration will not converge.')
    elif show_steps:
        print("Iteration konvergiert!")

    x = iterate_jacobi(A, B, b, x0, tol)
    err = calculate_error_a_posteriori(B, x[-1], x[-2])

    n2 = calculate_required_steps_a_priori(B, x0, x[1], tol)

    return x[-1], len(x) - 1, n2, err


def get_b(A):
    D = np.diag(np.diag(A))
    L = np.tril(A, -1)
    R = np.triu(A, 1)

    B = -np.linalg.inv(D) @ (L + R)

    if show_steps:
        print("Matrix B berechnen. B = -D⁻¹ * (L + R) = \n" + str(B))

    return B


def is_converging(B):
    nb = np.linalg.norm(B, 1)

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


def calculate_error_a_posteriori(B, xn, xnm1):
    norm_b = np.linalg.norm(B, 1)

    err = (norm_b / (1 - norm_b)) * np.linalg.norm((xn - xnm1), 1)
    return err


def calculate_required_steps_a_priori(B, x0, x1, tol):
    norm_b = np.linalg.norm(B, 1)
    n_min = np.log((-(norm_b - 1) * tol) / (np.linalg.norm(x1 - x0, 1))) / np.log(norm_b)
    return n_min


xn, n, n2, err = solve_jacobi(A, b, x0, tol)

print("\n==========================")
print('Lösung des Gleichungssystems durch Jacobi:')
print('x = ' + str(xn))
print('Genautigkeit a-posteriori: ' + str(err))
print('Benötigte Iterationen: n = ' + str(n))
print('Theoretisch min. benötigte Iterationen gem. a-priori-Abschätzung: n2 = ' + str(n2))
print('')


# Jacobbi with new factor ((1/W) * D)x = -(((w-1)/w)* (D+L+R)) x + b
print('----------------Aufgabe b-------------------')

def solve_jacobi_new(A, b, x0, tol):
    if not (A.shape[0] == A.shape[1]):
        raise Exception('A is misshaped.')

    if not (A.shape[0] == b.shape[0]):
        raise Exception('The shape of b does not match the size of A.')

    if not (A.shape[0] == x0.shape[0]):
        raise Exception('The shape of x0 does not match the size of A.')

    B = get_b_new(A)

    if not (is_converging(B)):
        raise Exception('Iteration will not converge.')
    elif show_steps:
        print("Iteration konvergiert!")

    x = iterate_jacobi(A, B, b, x0, tol)
    err = calculate_error_a_posteriori(B, x[-1], x[-2])

    n2 = calculate_required_steps_a_priori(B, x0, x[1], tol)

    return x[-1], len(x) - 1, n2, err

def get_b_new(A):
    D = np.diag(np.diag(A))
    L = np.tril(A, -1)
    R = np.triu(A, 1)
    w = 1.15
    B = -((w - 1) / w) * np.linalg.inv(D) @ (L + R)

    if show_steps:
        print("Matrix B berechnen. B = -((w-1)/w) * D⁻¹ * (L + R) = \n" + str(B))

    return B


xn, n, n2, err = solve_jacobi_new(A, b, x0, tol)

print("\n==========================")
print('Lösung des Gleichungssystems durch Jacobi:')
print('x = ' + str(xn))
print('Genautigkeit a-posteriori: ' + str(err))
print('Benötigte Iterationen: n = ' + str(n))
print('Theoretisch min. benötigte Iterationen gem. a-priori-Abschätzung: n2 = ' + str(n2))
print('')


# Welche Konvergenz ist besser?
# 34 < 39 also die neue Methode ist besser
