import numpy as np

'''  INPUT   '''
A = np.array([[30,-3], [-13,4]], dtype=np.float64)
'''  INPUT   '''

ew,ev = np.linalg.eig(A)

print('Eigenwerte:', ew)
print('Eigenvektor:', ev)

# Ist das Matrix A diagonalisierbar?
# Ja, wenn es 2 linear unabhängige Eigenvektoren gibt.
if np.linalg.matrix_rank(ev) == A.shape[0]:
    print("Die Matrix ist diagonalisierbar.")
    # Diagonalmatrix D mit Eigenwerten auf der Diagonale
    D = np.diag(ew)
    # Inverse der Eigenvektormatrix
    ev_inv = np.linalg.inv(ev)
    # Überprüfung der Diagonalisierung A = E*D*E^-1
    A_reconstructed = ev @ D @ ev_inv
    print("Rekonstruierte Matrix A aus der Diagonalisierung:\n", A_reconstructed)
else:
    print("Die Matrix ist nicht diagonalisierbar.")


# Betrags grösste Eigenwert lamda von A und Basisvektor v

def highest_eigenwert(A, v, tol=1e-15):
    v = v / np.linalg.norm(v)
    lambda_old = 0.0
    iterations = 0

    while True:
        iterations += 1
        w = A @ v
        lambda_new = np.dot(v, w)
        v = w / np.linalg.norm(w)

        if abs(lambda_new - lambda_old) <= tol:
            break

        lambda_old = lambda_new

    print("number of iterations until convergence:", iterations)
    return lambda_new, v

v = np.array([1,0], dtype=np.float64)
v = np.transpose(v)

lamda, v = highest_eigenwert(A, v)
print("Betrags grösste Eigenwert (Power Method):", lamda)

print("Aufgabe b")

import sympy as sp

# Symbole
c, lam = sp.symbols('c lam', real=True)

# Matrix aus der Aufgabe
A = sp.Matrix([[30, c],
               [-13, 4]])

# Charakteristisches Polynom
p = sp.factor((A - lam*sp.eye(2)).det())
print("p(lam) =", p)  # lam**2 - 34*lam + (120 + 13*c)

# Diskriminante (für quadratisches Polynom lam^2 + a lam + b)
disc = sp.discriminant(sp.expand(p), lam)
print("Diskriminante =", sp.factor(disc))

# c für doppelten Eigenwert: disc = 0
csol = sp.solve(sp.Eq(disc, 0), c)
print("c für doppelten Eigenwert:", csol)

# Einsetzen des gefundenen c
c0 = csol[0]
A0 = A.subs(c, c0)
print("\nA(c0) =")
sp.pprint(A0)

# Doppel-Eigenwert ist trace/2
lam0 = sp.simplify(A0.trace()/2)
print("Doppel-Eigenwert lam0 =", lam0)

# Diagonalisierbarkeit prüfen: Eigenraumdimension = Nullität(A - lam0 I)
M = A0 - lam0*sp.eye(2)
rankM = M.rank()
nullity = 2 - rankM
print("rank(A-lam0 I) =", rankM)
print("dim(Eigenraum) =", nullity)

if nullity == 2:
    print("=> diagonaliserbar (2 unabhängige Eigenvektoren)")
else:
    print("=> NICHT diagonaliserbar (nur 1 Eigenvektor)")
