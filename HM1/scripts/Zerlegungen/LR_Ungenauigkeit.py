import numpy as np
import numpy.linalg.linalg


E = 2 ** -52
R = np.array([[1, 1, 1], [0, E, 3], [0, 0, 4 - (6 / E)]])
L = np.array([[1, 0, 0, ], [2, 1, 0], [4, 2 / E, 1]])
b = np.array([1, 0, 0])

y = numpy.linalg.linalg.solve(L, b)
print('y= ' + str(y))
x = numpy.linalg.solve(R, y)
print('x= ' + str(x))

# c)
A = np.array([[1, 1, 1], [2, 2 + E, 5], [4, 6, 8]])
x = numpy.linalg.solve(A, b)
print('x= ' + str(x))
