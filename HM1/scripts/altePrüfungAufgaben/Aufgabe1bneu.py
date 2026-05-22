# 1b

import numpy as np

def secant_method(f, x0, x1, tolerance=1e-8, max_iterations=10000):
    xn = [x0, x1]
    n = 1
    
    while n < max_iterations and abs(f(xn[n])) > tolerance:
        xn.append(xn[n] - ((xn[n] - xn[n-1]) / (f(xn[n]) - f(xn[n-1]))) * f(xn[n]))
        n += 1
    
    return xn[-1], n


x0 = 1.4
x1 = 1.6
def f(x):
    return ((np.e**x+np.e**-x)/ 2) - 3/2 -x

print(secant_method(f, x0, x1, 1e-6, 1000))