import numpy as np

"""==================== INPUT ===================="""
A = np.array([[240,120,80], [60,180,170],[60,90,500]], dtype=np.float64)
b = np.array([3080,4070,5030], dtype=np.float64)

db = 0.05  # Maximaler absoluter Fehler in b
dA = 0.010  # Maximaler absoluter Fehler in A
"""==============================================="""

print("Betrachte gestörtes Gleichungssystem A~x~ = b~, wobei b~ in jeder Komponente um maximal " + str(db) + " von b abweicht und A~ in jeder Komponente um maximal " + str(dA) + " von A abweicht.")
print("Wähle für Berechnung die ∞-Norm, da dann gerade gilt ‖b - b~‖∞ ≤ " + str(db))

niA = np.max([np.sum([abs(aij) for aij in A[i, :]]) for i in range(A.shape[0])])
print("Berechne Zeilensummennorm ‖A‖∞ = " + str(niA))

Ainv = np.linalg.inv(A)
print("Bestimme A⁻¹ = \n" + str(Ainv))

niAinv = np.max([np.sum([abs(aij) for aij in Ainv[i, :]]) for i in range(Ainv.shape[0])])
print("Berechne Zeilensummennorm ‖A⁻¹‖∞ = " + str(niAinv))

condA = niA * niAinv
print("Berechne cond(A) = ‖A‖∞ * ‖A⁻¹‖∞ = " + str(condA))

dAtot = A.shape[1] * dA
print("\nDa der Matrix-Fehler von " + str(dA) + " in jedem Element von A auftreten kann, summiert sich der Fehler in der ∞-Norm über die ganze Zeile auf, womit ‖A - A~‖∞ = " + str(A.shape[1]) + " * " + str(dA) + " = " + str(dAtot))

dArel = dAtot / niA
condAxdArel = condA * dArel
print("Falls die Bedingung cond(A) * (‖A - A~‖∞ / ‖A‖∞) < 1 erfüllt ist, gilt für den relativen Fehler von x: (Vgl. Skript S. 63 für lesbarere Formel)")
print("‖x - x~‖∞ / ‖x‖ ≤ (cond(A) / (1 - cond(A) * (‖A - A~‖∞ / ‖A‖∞))) * ((‖A - A~‖∞ / ‖A‖∞) + (‖b - b~‖∞ / ‖b‖∞))")
print("\nEs ist: cond(A) * (‖A - A~‖∞ / ‖A‖∞) = " + str(condA) + " * (" + str(dAtot) + " / " + str(niA) + ") = " + str(condAxdArel) + " < 1, womit die Bedingung erfüllt ist. (?)")

nib = np.max([abs(bi) for bi in b])
dbrel = db / nib
dxrel = condA / (1 - condA * dArel) * (dArel + dbrel)

print("Demnach gilt für den relativen Fehler von x: ‖x - x~‖∞ / ‖x‖∞ ≤ " + str(dxrel))
