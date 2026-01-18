"""
Maschinenzahlen und numerische Grundlagen
"""
import struct

def machine_numbers_info(basis, mantissa_bits):
    """
    Berechne Eigenschaften von Maschinenzahlen für gegebene Basis und Mantissa-Länge.
    
    Args:
        basis: Zahlenbasis (z.B. 2, 10)
        mantissa_bits: Länge der Mantissa in Bits
    
    Returns:
        Dict mit Informationen über die Maschinenzahlen
    """
    total_count = (basis ** mantissa_bits) - 1
    smallest_positive = basis ** (-mantissa_bits)
    largest_positive = basis - basis ** (1 - mantissa_bits)
    
    return {
        'basis': basis,
        'mantissa_bits': mantissa_bits,
        'total_count': total_count,
        'smallest_positive': smallest_positive,
        'largest_positive': largest_positive
    }


def machine_epsilon_binary():
    """
    Berechne Maschinenepsilon für Binary Floating-Point (empirisch).
    
    Returns:
        Maschinenepsilon
    """
    epsilon = 1.0
    while 1.0 + epsilon > 1.0:
        epsilon /= 2.0
    return 2.0 * epsilon


def machine_epsilon_decimal():
    """
    Berechne Maschinenepsilon für Dezimalzahlen (empirisch).
    
    Returns:
        Maschinenepsilon
    """
    epsilon = 0.1
    while 1.0 + epsilon > 1.0:
        epsilon /= 10.0
    return 10.0 * epsilon


def compare_machine_precision(basis1, mantissa1, basis2, mantissa2):
    """
    Vergleiche Maschinengenauigkeit zweier Zahlensysteme.
    
    Args:
        basis1, mantissa1: Basis und Mantissa von System 1
        basis2, mantissa2: Basis und Mantissa von System 2
    
    Returns:
        Tuple: (eps1, eps2, better)
            - eps1, eps2: Maschinengenauigkeit der Systeme
            - better: Welches System präziser ist (1 oder 2)
    """
    eps1 = basis1 ** (-mantissa1)
    eps2 = basis2 ** (-mantissa2)
    
    better = 1 if eps1 < eps2 else 2
    return eps1, eps2, better


def convert_to_machine_number(x, basis, mantissa_bits, exponent_bits):
    """
    Konvertiere Dezimalzahl zu Maschinenzahl mit Rundung.
    
    Args:
        x: Dezimalzahl
        basis: Zahlenbasis
        mantissa_bits: Mantissa-Länge
        exponent_bits: Exponent-Länge
    
    Returns:
        Tuple: (machine_number, absolute_error, relative_error)
    """
    if x == 0:
        return 0.0, 0.0, 0.0
    
    # Bestimme Exponent
    import math
    e = int(math.floor(math.log(abs(x), basis)))
    
    # Normalisiere Mantissa
    mantissa = x / (basis ** e)
    
    # Runde Mantissa auf mantissa_bits Bits
    quantum = basis ** (1 - mantissa_bits)
    mantissa_rounded = round(mantissa / quantum) * quantum
    
    # Berechne Maschinenzahl
    machine_x = mantissa_rounded * (basis ** e)
    
    absolute_error = abs(machine_x - x)
    relative_error = absolute_error / abs(x) if x != 0 else 0
    
    return machine_x, absolute_error, relative_error


info_binary = machine_numbers_info(2, 4)
print(f"Maschinenzahlen (Basis=2, Mantissa=4): {info_binary}")

epsilon_binary = machine_epsilon_binary()
print(f"Maschinenepsilon (Binär): {epsilon_binary}")

epsilon_decimal = machine_epsilon_decimal()
print(f"Maschinenepsilon (Dezimal): {epsilon_decimal}")

eps1, eps2, better = compare_machine_precision(2, 10, 10, 5)
print(f"System 1 (2, 10): eps={eps1}, System 2 (10, 5): eps={eps2}, besser={better}")

x = 3.14159
machine_x, abs_err, rel_err = convert_to_machine_number(x, 10, 4, 8)
print(f"x={x}, Maschinenzahl={machine_x}")
print(f"Absoluter Fehler: {abs_err}, Relativer Fehler: {rel_err}")
