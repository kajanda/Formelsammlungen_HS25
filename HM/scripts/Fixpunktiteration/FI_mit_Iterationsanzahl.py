import numpy as np
import matplotlib.pyplot as plt

def F(x):
    return (x-0.3)**(1/3)

iterationen = 100

x0 = 0.7

x = x0
for i in range(iterationen):
    x = F(x)

print("Startwert x0: " + str(x0))
print("Endwert nach " + str(iterationen) + " Iterationen: " + str(x))

a = np.linspace(0.7,0.8)
b = F(a)
plt.plot(a,a,a,b)
plt.legend(['y=x', 'y=F(x)'])
plt.show()

