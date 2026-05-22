# Useful Python Basics

## Define a Matrix with numpy

```python
import numpy as np
A = np.array([[4, -1, 0, 0],
              [-1, 4, -1, 0],
              [0, -1, 4, -1],
              [0, 0, -1, 3]], dtype=float)
```

## Define a Vector with numpy

```python
b = np.array([15, 10, 10, 10], dtype=float)
```

## Plotting with matplotlib

```python
import matplotlib.pyplot as plt
import numpy as np
a = np.linspace(0, 10, 100)
b = np.sin(a)
plt.plot(a, b)
plt.xlabel('x-Achse')
plt.ylabel('y-Achse')
plt.title('Mein Plot')
plt.grid()
plt.show()
```

