"""
Komplexe Zahlen und Polynomwurzeln
"""
import numpy as np

def complex_add(z1, z2):
    """Addiere zwei komplexe Zahlen."""
    return z1 + z2

def complex_multiply(z1, z2):
    """Multipliziere zwei komplexe Zahlen."""
    return z1 * z2

def complex_divide(z1, z2):
    """Dividiere zwei komplexe Zahlen."""
    return z1 / z2

def complex_conjugate(z):
    """Berechne konjugiert komplexe Zahl."""
    return np.conj(z)

def complex_abs(z):
    """Berechne Betrag einer komplexen Zahl."""
    return np.abs(z)

def complex_arg(z):
    """Berechne Argument (Phase) einer komplexen Zahl in Radians."""
    return np.angle(z)

def complex_to_polar(z):
    """Konvertiere zu Polarform (r, theta)."""
    return np.abs(z), np.angle(z)

def polar_to_complex(r, theta):
    """Konvertiere von Polarform zu kartesischer Form."""
    return r * np.exp(1j * theta)

def polynomial_roots(coefficients):
    """
    Finde Wurzeln eines Polynoms.
    
    Args:
        coefficients: Array von Koeffizienten (höchste Ordnung zuerst)
                     z.B. [1, -5, 6] für x^2 - 5x + 6
    
    Returns:
        Array von komplexen Wurzeln
    """
    return np.roots(coefficients)


z1 = 3 + 4j
z2 = 1 + 2j

print(f"z1: {z1}")
print(f"z2: {z2}")
print(f"z1 + z2: {complex_add(z1, z2)}")
print(f"z1 * z2: {complex_multiply(z1, z2)}")
print(f"z1 / z2: {complex_divide(z1, z2)}")
print(f"Konjugiert von z1: {complex_conjugate(z1)}")
print(f"|z1|: {complex_abs(z1)}")
print(f"arg(z1): {complex_arg(z1)}")

r, theta = complex_to_polar(z1)
print(f"Polarform von z1: r={r}, theta={theta}")

z_polar = polar_to_complex(r, theta)
print(f"Zurück zu kartesisch: {z_polar}")

coeffs = [1, -5, 6]
roots = polynomial_roots(coeffs)
print(f"Wurzeln von x^2 - 5x + 6: {roots}")
