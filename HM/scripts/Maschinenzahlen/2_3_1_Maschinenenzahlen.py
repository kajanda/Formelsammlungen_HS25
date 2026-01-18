import numpy as np

''' INPUT '''
basis = 2
mantisse = 5  # (ohne vorzeichen - 1)
exponent = 3
vorzeichen_exp = 1
''' INPUT '''


def anzahl():  ## B^m * (B^(e+1) - 1) + 1
    return basis ** (mantisse) * (basis ** (exponent + vorzeichen_exp) - 1) + 1


def exp_to_dec():
    return basis ** exponent - 1


def smallest_pos():
    return basis ** (-exp_to_dec() - 1)


def greatest_pos():
    return (1 - basis ** -mantisse) * basis**exp_to_dec()


print('Anzahl mögliche Zahlen (mit 0): ', anzahl())
print('Exponent in dec: ', exp_to_dec())

# normierte 4-stellige Maschinenzahlen im Dezimalsystem: 0.00390625
# 0.00390625 = 0.3906 * 10^-2
# 124 = 0.1240 * 10^3
print('kleineste positive Zahl: ', smallest_pos())
print('grösste positive Zahl: ', greatest_pos())
