import numpy as np

# Fehlerfortplanzung
#          f'(x)*x       (2*x*sin(x)+x^2*cos(x))*x
# K(x) = |---------| = |---------------------------|      
#            f(x)              x^2*sin(x)
#                      
#          2*sin(x)+x*cos(x) 
#      = |------------------|
#               sin(x)
#        ===================

# Naeherungsweise gilt
#
# |(f(x)-f(x0))/f(x0)| = K(x0)*|(x-x0)/x0|
#
# Aus |(f(x)-f(x0))/f(x0)| <= 0.1 folgt
#
# |x-x0| <= 0.1/K(x0)*x0
# Konditionszahl
'''   INPUT  '''
f = lambda x: 2 * x * np.sin(x) + x ** 2 * np.cos(x)  # ABLEITUNG
g = lambda x: x ** 2 * np.sin(x)  # FUNKTION

x0 = np.pi / 3  # start Zahl oder schätzen durch plotten
y0_err_rel = 0.1  # relativer Fehler
'''    INPUT    '''


def K(x):
    return np.abs((f(x) * np.abs(x)) / g(x))


def abs_err(x, rel):
    return rel / K(x) * x


x0_err_abs = abs_err(x0, y0_err_rel)
print('Konditionszahl für x0: ', K(x0))
print('Max absolut Error fuer 10% rel Fehler', x0_err_abs)
#
#                        =======


# Konvergiert gegen 0 (10**-n)?
print('Nummerisches Verhalten gegen eine Zahl', [K(10 ** -n) for n in range(1, 6)])

# Fuer x -> 0 konvergiert K(x) -> X. Dementsprechend
# ist f(x) in x = 0 gut konditioniert (falls konvergiert).
# ==================================================


# Konditionszahl plotten / graphisch darstellen
import matplotlib.pyplot as plt

x = np.arange(-4, 2.05, 0.05)
plt.plot(x, K(x))
# plt.semilogy()
plt.xlabel('x'), plt.ylabel('K(x)'), plt.grid()
plt.show()
# Der Plot zeigt, dass f(x) fuer x in der Umgebung von x,
# Gut konditioniert bei -2 <= x <= 0
# Fuer x > -1:
# Forderung: 1 + x <= 1
#       x <= 0
# Fuer x < -1:
# Forderung: -(1 + x) <= 1
#       -1 - x <= 1
#       -x <= 2
#       x >= -2
