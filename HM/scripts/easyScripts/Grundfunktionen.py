"""
Grundfunktionen: Ableitungen, Integrale, Fakultät
"""
import sympy as sy
import math

def derivative_symbolic(f_expr):
    """
    Berechne symbolische Ableitung einer Funktion.
    
    Args:
        f_expr: Sympy-Expression
    
    Returns:
        Ableitung als Sympy-Expression
    """
    x = sy.symbols('x')
    return sy.diff(f_expr, x)


def integral_symbolic(f_expr):
    """
    Berechne unbestimmtes Integral einer Funktion.
    
    Args:
        f_expr: Sympy-Expression
    
    Returns:
        Integral als Sympy-Expression
    """
    x = sy.symbols('x')
    return sy.integrate(f_expr, x)


def definite_integral(f_expr, a, b):
    """
    Berechne bestimmtes Integral einer Funktion.
    
    Args:
        f_expr: Sympy-Expression
        a, b: Integrationsgrenzen
    
    Returns:
        Wert des bestimmten Integrals (numerisch oder symbolisch)
    """
    x = sy.symbols('x')
    return sy.integrate(f_expr, (x, a, b))


def factorial_recursive(n):
    """Berechne n! rekursiv."""
    if n <= 1:
        return 1
    return n * factorial_recursive(n - 1)


def factorial_iterative(n):
    """Berechne n! iterativ."""
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result


def factorial_builtin(n):
    """Berechne n! mit built-in Funktion."""
    return math.factorial(n)


def condition_number_function(f_expr, x_val):
    """
    Berechne Konditionszahl einer Funktion κ(x) = |x * f'(x) / f(x)|.
    
    Args:
        f_expr: Sympy-Expression
        x_val: Punkt an dem Konditionszahl berechnet wird
    
    Returns:
        Konditionszahl
    """
    x = sy.symbols('x')
    f_lambdified = sy.lambdify(x, f_expr)
    df = sy.diff(f_expr, x)
    df_lambdified = sy.lambdify(x, df)
    
    f_val = f_lambdified(x_val)
    df_val = df_lambdified(x_val)
    
    if f_val == 0:
        return float('inf')
    
    return abs(x_val * df_val / f_val)


x = sy.symbols('x')
f = x**2 - 4

df = derivative_symbolic(f)
print(f"Ableitung von {f}: {df}")

integral = integral_symbolic(f)
print(f"Integral von {f}: {integral}")

def_integral = definite_integral(f, 0, 2)
print(f"Bestimmtes Integral von {f} von 0 bis 2: {def_integral}")

fact_rec = factorial_recursive(5)
print(f"5! (rekursiv): {fact_rec}")

fact_iter = factorial_iterative(5)
print(f"5! (iterativ): {fact_iter}")

fact_builtin = factorial_builtin(5)
print(f"5! (built-in): {fact_builtin}")

cond = condition_number_function(x**2, 2)
print(f"Konditionszahl von x^2 bei x=2: {cond}")
