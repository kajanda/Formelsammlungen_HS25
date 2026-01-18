"""
Fixpunktiteration mit Abbruchbedingung
"""
# a)

import numpy as np


x0 = 1.5
tolerance = 1e-6
max_iterations = 100
def F(x):
    return ((np.e**x+np.e**-x)/ 2) - 3/2

xn = [x0, F(x0)]
n = 1

while n < max_iterations and abs(xn[n]-xn[n-1]) > tolerance:
    n += 1
    xn.append(F(xn[n-1]))


print(xn[-1], n)

