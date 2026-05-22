import numpy as np

'''  INPUT   '''
A = np.array([[13,-4], [30,-9]])
'''  INPUT   '''


ew,ev = np.linalg.eig(A)

print('Eigenwerte:', ew)
print('Eigenvektor:', ev)