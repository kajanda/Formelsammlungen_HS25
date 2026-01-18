import sympy as sy
import matplotlib.pyplot as plt

x = sy.symbols('x')

"""==================== INPUT ===================="""
f = ((sy.exp(x) + sy.exp(-x)) / 2) -(3/2) + x
x0 = 1.4
x1 = 1.6
max_error = 1e-8
"""==============================================="""

fl = sy.lambdify(x, f)

xn = [x0, x1]
print("n = 0: x0 = " + str(x0))
print("n = 1: x1 = " + str(x1))

n = 1

while abs(fl(xn[n])) > max_error:
    xn.append(xn[n] - ((xn[n] - xn[n-1]) / (fl(xn[n]) - fl(xn[n-1]))) * fl(xn[n]))

    n += 1

    print("n = " + str(n) + ": x" + str(n) + " = " + str(xn[n]) + ", Δ = " + str(abs(xn[n] - xn[n-1])))


print("\nAbbruchbedingung erfüllt!")
print(f"n = {n+1}: x{n+1} = {xn[n]}, f(x) = {fl(xn[n])}")

# Ergebnis: Die Lösung ist x ≈ 0.4133483059217043