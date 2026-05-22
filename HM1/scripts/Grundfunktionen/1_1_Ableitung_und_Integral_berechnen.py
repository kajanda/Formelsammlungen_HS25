import sympy as sy
import numpy as np

x = sy.symbols('x')
''' INPUT '''
f = sy.exp(x) * x # ACHTUNG numpy nicht mit sympy vermischen
''' INPUT '''


df = sy.diff(f, x)
dfl = sy.lambdify(x, df)
F = sy.integrate(f,x)


print('Function:' + str(f))
print('Ableitung:' + str(df))
print('Intertral:' + str(F))


g = np.abs(df * x )/ np.abs(f) # Konditionszahl
print(sy.simplify(g)) # Vereinfacht
