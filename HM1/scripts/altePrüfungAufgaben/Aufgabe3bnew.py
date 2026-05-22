import numpy as np
import sympy as sp




# b)


char = sp.Matrix([[30 - sp.symbols('λ'), sp.symbols('c')],
                   [-13, 4 - sp.symbols('λ')]]).det()

print("charakteristisches Polynom:" + str(char))

eigenvals = sp.solve(char, sp.symbols('λ'))

print(eigenvals)


# c ist also 13
# und Eigenwert ist 17
# damit ist A = [[13, 13], [-13, -13]]
# A = np.array([[13, 13], [0,0]])
# Dies bedeutet dass die geometrische Vielfachheit des Eigenwerts 17 bei c=13 nur 1 ist.