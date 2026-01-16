#set document(title: "CT_Zusammenfassung", author: "Fabio Leisifa (leisifa1)")

#set page(paper: "a4", flipped: true,
  footer: [
    #set align(right)
    leisifa1
  ]
)
#set text(size: 8.5pt)
#set heading(numbering: "1.1")

#let formula(body) = block(
  inset: 4pt,
  radius: 3pt,
  fill: rgb("#e9f5ee"),
  stroke: (paint: rgb("#8bc5a3"), thickness: 0.5pt),
)[
  #body
]

#let example(body) = block(
  inset: 4pt,
  radius: 3pt,
  fill: rgb("#f0f4ff"),
  stroke: (paint: rgb("#a3b8e8"), thickness: 0.5pt),
)[
  #body
]

#let steps(body) = block(
  inset: 4pt,
  radius: 3pt,
  fill: rgb("#fff8e1"),
  stroke: (paint: rgb("#ffb74d"), thickness: 0.5pt),
)[
  #body
]

#align(center)[
  #text(size: 14pt, weight: "bold")[
    Definitionen, Bemerkungen & Beispiele
  ]
  #v(0.3em)
  #text(size: 11pt)[
    CT_Zusammenfassung
  ]
]

#v(1em)

#columns(
  3,
  gutter: 1.2em,

)[

= Lecture_Computer_Architecture
#image("assets_CT/F1_Hardwarearchitektur.png", width: 90%)

- * CPU - Control Unit*  
  - Ist Finite State Machine (FSM)
  - Befehle holen (Fetch), dekodieren (Decode), ausführen (Execute)
   - Fetch holt Instruktion aus Speicher 
   - Decode interpretiert Instruktion und erzeugt Steuersignale in der Control Unit
   - Execute führt Instruktion aus (ALU-Operation, Speicherzugriff, …)
  - Steuerung von ALU, Registern, Speicher, Peripherie

#image("assets_CT/F1_Execute_Sequenze.png", width: 90%)

- * CPU - Datapath *  
  - ALU (Arithmetic Logic Unit): führt Operationen aus
  - Register: schnelle Zwischenspeicher (CPU-intern)
  - Busse: verbinden Komponenten (Adress-, Daten-, Steuerbus)
 
- * Memory *
  - Byte-adressiert (1 Adresse pro Byte)
  - Speicherzellen: Byte (8 Bit), Halfword (16 Bit), Word (32 Bit)
  - Speicherbereiche: Code, Data, Stack, Heap, Peripherals
  - 2^N Adressen → N Bit Adressbus → 0 … 2^N-1 Adressen
  - RAM/ROM/Flash (extern, langsamer)

#image("assets_CT/F1_Intern_extern_Memory.png", width: 90%)

- * Toolchain *
#image("assets_CT/F1_Building_Chain.png", width: 90%)
  - Host vs. Target (Cross-Toolchain: auf PC bauen, auf Embedded-Target laufen)


= Lecture_Cortex-M_Architecture
- *Instruction Set Architecture (ISA)*
  - Schnittstelle HW ↔ SW (Befehle, Register, Adressierung, Datentypen, …)
  - CT1 (Cortex-M0): *32-bit RISC*, Load/Store, Thumb-Subset

- * Architecture *
  - Adressraum: 32-bit Adressen → Adressraum 0x0000_0000 … 0xFFFF_FFFF
  - R0–R12: allgemeine Register
  - SP (Zeigt auf zuletzt genutzten Stack-Eintrag), LR (Adresse nach Beenden einer Funktion weiter), PC (Zeigt auf nächsten Befehl)
  
#image("assets_CT/F2_CPU_Model.png", width: 90%)

- * Word alignment*
  - Adressen für Daten müssen auf natürliche Grenzen ausgerichtet sein
  - byte: beliebige Adresse (8-Bit)
  - halfword: gerade Adresse (Vielfaches von 2) (16-Bit)
  - word: durch 4 teilbare Adresse (Vielfaches von 4) (32-Bit)
  - Size of integer ist architectureabhängig, weil Registergröße relevant (CT1: int=32 Bit / 32 Bit Register)
#image("assets_CT/F2_MemoryAligment.png", width: 80%)

#formula[
*Stolpersteine:*  
- *little endian* (Words/Halfwords werden LSB-first abgelegt)  
- *pad* = Padding-Bytes für Alignment  
]

== constants @ `0x08000200`
#table(
  columns: (2.6fr, 2fr),
  [Bytes (hex)], [Bedeutung],
  [`05 00 00 00`], [`limit DCD 5` (*little endian*)],
  [`48 65 6C 6C 6F 20 57 6F 72 6C 64 00`], [`text DCB "Hello World", 0`],
  [`04 02 00 08`], [`text_addr DCD text (= 0x08000204)` (*little endian*)],
  [`? ? ? ?  ? ? ? ?`], [`unbenutzt/unknown`],
)

== variables @ `0x20000000`
#table(
  columns: (2.6fr, 2fr),
  [Bytes (hex)], [Bedeutung],
  [`0A 00 00 00`], [`counter DCD 10` (*little endian*)],
  [`all 0`], [`buffer SPACE 10` (*unknown*)],
  [`FF FF 80 FF 00 FF 80 FE`], [`colors DCW FFFF, FF80, FF00, FE80` (*little endian halfwords*)],
  [`pad pad`], [`Padding (Alignment vor DCD)`],
  [`C8 00 00 00`], [`last_counter DCD 200` (*little endian*)],
)

- *Endianness*
  - STM32 (ST) ist *little endian* (LSB liegt an kleinerer Adresse)

#formula[
  *Little Endian (Beispiel 0xA1B2C3D4 @ addr)*  
  addr+0: D4  
  addr+1: C3  
  addr+2: B2  
  addr+3: A1
  *Big Endian (Beispiel 0xA1B2C3D4 @ addr)*  
  addr+0: A1
  addr+1: B2
  addr+2: C3
  addr+3: D4
]

- *Cortex-M0 Instruction Set*
  - Typen von Instruktionen: Data Transfer, Arithmetic/Logic, Branch, Control, …

#image("assets_CT/F2_Object_File_Section.png", width: 70%)
#image("assets_CT/F2_Object_Memory_Map_exp.png", width: 80%)

- * Memory Map *
 - Tiefste Adresse oben gezeichnet
 - Berechnung Speichergrösse: Endadresse - Startadresse + 1 (in Bytes)
 - Berechungn Endadresse: Startadresse + Grösse - 1
 - Typische Sektionen:
   - .text: Code (Programm-Instruktionen)
   - .data: initialisierte Daten (Variablen mit Startwert)
   - .bss: uninitialisierte Daten (Variablen ohne Startwert; werden auf 0 gesetzt)

- * Memory Allocation *
 - Stack: wächst zu kleineren Adressen (downwards)
 - Heap: wächst zu grösseren Adressen (upwards)
 - Data Segment: statische/global Variablen
 - Code Segment: Programmcode
 - DCB: Byte, DCW: Half-word, DCD: Word
 #image("assets_CT/F2_Memeory_allocation_in_Assambley.png", width: 90%)


= Lecture_Datatransfer
- *Data Transfer Types*
  - Register-Register (z.B. `MOV Rd,Rm`)
  - Loading Literals (z.B. `LDR Rd,=literal`)
  - Loading Data from Memory (z.B. `LDR Rd,[Rn,#imm]`)
  - Storing Data to Memory (z.B. `STR Rd,[Rn,#imm]`)
  - *Stolpersteine:* 
   - Endianness
   - lower Registers (R0–R7 vs R8–R12)
   - LDR with [PC, `#imm`] ist loading literal 
   - LDR Rd,label ladet literal
   - LDR Rd,=literal ist pseudo-instruction für loading literal
   - LDR(X), auf X achten (Word/Halfword/Byte)
   - MOV(S) kann nicht mit pseudo-instructionen umgehen (=literal) -> Alternative LDR Rd,=literal verwenden
   - MOV Rd, `#imm` nur für kleine immediates (0–255)
   - *Daran denken:* bei STRH/LDRH und STR/LDR imm-offset vervielfachen (STRH/LDRH: imm×2, STR/LDR: imm×4)

- *Literal-Pool*
  - Bereich im Code-Segment mit Literalen (Konstanten)
  - LDR Rd,=literal → lädt Wert aus Literal-Pool
  - Literal-Pool wird automatisch vom Assembler verwaltet
  - Berechnung der grösse des Pools: Anzahl Literale × 4 Byte (Word)
   - Was gehört nicht dazu: ALIGN Direktiven, Labels, Kommentare

- *EQU Directive*
  - `NAME EQU value` definiert Konstanten
  - ersetzt NAME durch value im Code (kein Speicher reserviert)
  - zB `BUFFER_SIZE EQU 0x64` -> `LDR R0,=BUFFER_SIZE` wird zu `LDR R0,=0x64`

- *Adressierungsarten (typisch)*
  - Relative Adressierung: Adresse wird relativ zu PC berechnet
    - z.B. `LDR Rt,[PC,#imm]` (PC-relative)
  - Indirekte Adressierung: Adresse steht in Register
    - z.B. `LDR Rt,[Rn]` (Register Indirect)

- *Pseudo instructions*
  - `LDR Rt,=literal`   (Literal Pool)
  - `MOV Rd,=literal`   (Literal Pool)
  - `ADR Rd,label`      (PC-relative Adresse)
  - `NOP`               (keine Operation)

- * Arrays *
  - Abfolge von Elementen gleichen Typs im Speicher
  - Elemente liegen hintereinander (contiguous)
  - Adresse des i-ten Elements: base + i · element_size
  - element_size: byte=1, halfword=2, word=4
  - C-Array-Zugriff: `array[index]` → `*(array + index)`
  - Compiler übersetzt Array-Zugriffe so in Assembly: 
#image("assets_CT/F3_ArrayInit.png", width: 90%)  
#image("assets_CT/F3_ArrayStoreAccess.png", width: 90%)
  - Achtung: bei mehr als halfword zugriff STR/LDR verwenden!

- * Pointer & Address Operator *
  - `&var` → Adresse von var
  - `*ptr` → Wert an Adresse ptr
#image("assets_CT/F3_PointerDir.png", width: 90%)

= Lecture_Arithmetic_Operations
- *HW - Addition/Subtraction*
  - Addition: Bitweise Addition mit Carry (Volladdierer-Kette)
  - Subtraction: A - B = A + (~B + 1) (Zweierkomplement)

- *SW - Multiword Operation*
  - Zerlege grosse Zahlen in mehrere Wörter (z.B. 64-Bit in 2×32-Bit)
  - Addiere/Subtrahiere Wort für Wort, übertrage Carry/Borrow 
#example[
 *Registerbelegung für 64-bit Addition:*
  - `A` in `R1:R0`  (R1 = high32, R0 = low32)
  - `B` in `R3:R2`  (R3 = high32, R2 = low32)
 *64-bit Addition: `A = A + B`*
  ```asm
  ADDS  R0, R0, R2     ; low32  (setzt C)
  ADCS  R1, R1, R3     ; high32 + Carry

  R0 = low32(Resultat)

  R1 = high32(Resultat)

  Gesamt: A = R1:R0

  Warum zuerst low?
  Nur so wird das Carry aus der low-Addition korrekt in die high-Addition übernommen.

  Hinweis: Carry aus der high-Addition wäre ein “65stes Bit” und wird hier nicht weiter gespeichert.
  ```
]
 
- *Einerkomplement*
  - Positive Zahlen: normale Binärdarstellung
  - Negative Zahlen: invertieren
  - Bereich bei n Bit: -(2^n-1 -1) … 2^n-1 -1

- *Zweierkomplement*
  - Positive Zahlen: normale Binärdarstellung
  - Negative Zahlen: invertieren + 1
  - Bereich bei n Bit: -2^(n-1) … 2^(n-1)-1
  - Subtraktion: A - B = A + (~B + 1) oder (A + (-B)) + 1
#image("assets_CT/F4_Zweierkomplement.png", width: 90%)

- *Flags (APSR)*
  - N: MSB des Resultats = 1
  - Z: Resultat = 0
  - C: Carry/NoBorrow (*unsigned*)
  - V: Overflow (*signed*)
  - CPU unterscheidet *nicht* signed/unsigned → berechnet C und V immer

#steps[
== Vorbereitungs-Fragen (immer gleich)
1) *Welche Sicht ist gefragt?*  
   - *unsigned* → wichtig ist *C* (carry/borrow)  
   - *signed (2’s complement)* → wichtig ist *V* (overflow)

2) *Welche Grenze ist kritisch?*  
   - unsigned 8-bit: *0..255*  
   - signed 8-bit: *-128..+127*  (Hex: 0x80..0x7F)

3) *Resultat schnell?*  
   - Rechne in Hex *byteweise* und merke: *über 0xFF = Carry*, *unter 0x00 = Borrow*

== Addition: `op1 + op2`
*Q1: Ist die Summe ≥ 0x100?*  
→ Ja: `C=1` (Carry raus)  
→ Nein: `C=0`
*Achtung Carry (8-bit):*  
Wenn Summe über `0xFF` geht, bleibt nur die *letzte Byte* übrig (die letzten 2 Hex-Stellen).  
Merke: dann ist `C=1` und es ist wie *“Summe − 0x100”.*

*Resultat (hex) schnell:*  
- Addiere in Hex. Wenn du “über FF” kommst: *schreib nur die letzten 2 Hex-Stellen* als Resultat, und merke dir `C=1`.  
  (Beispiel: 0x82+0x12 = 0x94, kein Carry)

*Q2: Overflow (signed) passiert nur wenn beide gleiches Vorzeichen haben:*  
- Sind *beide* op1 und op2 im selben Vorzeichenbereich?
  - Positiv: 0x00..0x7F
  - Negativ: 0x80..0xFF
→ Nein: `V=0` 

→ Ja: Schau das Resultat an: hat es plötzlich das *andere* Vorzeichen?
  - Ja → `V=1`
  - Nein → `V=0`

*Q3: N und Z (vom Resultat)*
- `Z=1` wenn Resultat = 0x00, sonst 0
- `N=1` wenn Resultat im Bereich 0x80..0xFF liegt (MSB=1), sonst 0

== Subtraktion: `op1 - op2`
*Q1: Brauchst du ein Borrow? (unsigned Vergleich)*  
- Ist `op1 >= op2` (unsigned)?
  - Ja → *kein Borrow* → `C=1`
  - Nein → Borrow nötig → `C=0`   

*Resultat (hex) schnell:*  
- Subtrahiere in Hex. Wenn du “unter 00” gehst, *leihe 0x100* (also +256) und merke dir: Borrow war nötig (`C=0`).  
  (Praktisch: du bekommst automatisch wieder eine 2-Hex-Stellen Zahl.)

*Q2: Overflow (signed) bei SUB passiert nur wenn Vorzeichen verschieden sind:*  
- Haben op1 und op2 *unterschiedliches* Vorzeichen?
→ Nein: `V=0`

→ Ja: Schau das Resultat an: hat es das *andere* Vorzeichen als op1?
  - Ja → `V=1`
  - Nein → `V=0`

*Q3: N und Z (vom Resultat)*
- `Z=1` wenn Resultat = 0x00, sonst 0
- `N=1` wenn Resultat 0x80..0xFF (MSB=1), sonst 0

== Mini-Merker (sehr schnell)
- *C bei ADD:* “über FF hinaus?”  
- *C bei SUB:* “musste ich borgen?” → ja ⇒ C=0, nein ⇒ C=1  
- *V bei ADD:* “gleiches Vorzeichen rein, anderes raus?”  
- *V bei SUB:* “verschiedene Vorzeichen rein, Resultat kippt gegenüber op1?”
]

= Lecture_Casting
- *Casting erklärt*
 - `(type) value`  → Wert wird in anderen Typ umgewandelt
 - implizit (automatisch) oder explizit (durch `(type)`)
 - *Actung!* wenn a = 5 und b = 10 -> (cast)a > (cast)b -> Cast ist nur für Vergleich relevant, a und b bleiben unverändert.
  - Dauerhafter Cast ist nur durch Zuweisung: `b = (uint8_t)a;`

  
- *Integer casting in C*
#image("assets_CT/F5_Interger_Casting_C.png", width: 90%)
#formula[
  *Casting Regeln:*
  - signed to unsigned: Wert bleibt gleich (Bitmuster bleibt gleich)
  - unsigned to signed: 
   - Wert bleibt gleich : wenn im positiven Bereich; 
   - Wert Negativ (1 vorne): *Berechne Wert - 2^n*
  - Zu Beachten sind nächsten Punkte:
   - *Extensions* (kleiner → grösser) (kleiner = weniger Bits)
   - *Truncation* (grösser → kleiner)
] 
 
- *Extensions*
 - usigned -> zero-extend (mit Nullen auffüllen)
 - signed -> sign-extend (Vorzeichenbit auffüllen) (Negativzahlen bleiben negativ)

- *Truncation*
  - “Links abschneiden”
  - signed: Vorzeichen kann kippen
  - unsigned: entspricht modulo (Wrap-around)

#formula[
  *Cortex-M0 Extend-Instruktionen*  
  - `SXTB`  8→32 signed  (sign extend)  
  - `SXTH` 16→32 signed  
  - `UXTB`  8→32 unsigned (zero extend)  
  - `UXTH` 16→32 unsigned
]

- *Stoplersteine bei if-Statements*
  - Vergleiche immer im gleichen Typ (signed/unsigned)
  - Sonst falsche Ergebnisse möglich (z.B. -1 > 0 bei unsigned)
  #image("assets_CT/F5_If_Statement_Casting.png", width: 90%)

= Lecture_Logic_and_Shift-Rotate_Instructions
#image("assets_CT/F6_Overview_Operands.png", width: 90%)
  - `ASRS` arithmetic right (MSB/Vorzeichen bleibt)
  - `RORS` rotate right (zyklisch)

- *Flag determine*
 - immer bei Instruktionen mit S
  - N: wenn MSB des Resultats = 1
  - Z: wenn Resultat = 0
  - V: immer unchanged (bleibt wie vorher)
 - (ANDS, ORRS, EORS, BICS, MVNS)
  - C: (bleibt wie vorher)
 - (LSLS, LSRS, ASRS, RORS)
  - C:Last bit shifted out (gilt rechts und links)(RORS rechts rausgefallen)

#steps[
== Multiplikation mit Konstante (Synthese)
=== Schritt 1: Konstante in Binär zerlegen
- Schreibe `K` als Binärzahl.
- Markiere alle Bits `i`, die `1` sind.

#example[
`K = 23 = 0b00010111` ⇒ Einsen bei `i = 0,1,2,4`  
⇒ `23·x = (x<<0) + (x<<1) + (x<<2) + (x<<4)`
]

=== Schritt 2: Addier-Plan erstellen (minimal denken)
- Start: `acc = 0`
- Für jedes gesetzte Bit `i`: addiere `(x<<i)` zum Accumulator.
- *Merke:* Du musst nicht jedes `i` einzeln bauen — du kannst schrittweise shiften. (immer um `#1`)

=== Schritt 3: In “Shift + optional Add” übersetzen (wie im Übungs-Template)
Viele Aufgaben geben so ein Muster vor:

- `R0` enthält `x` (der variable Multiplikand)
- `R7` ist Akkumulator (Start `0`)
- Danach kommt eine Sequenz aus:
  - `LSLS R0, R0, #1`  (x wird jeweils verdoppelt)
  - danach *optional* `ADDS R7, R7, R0` (wenn das entsprechende Bit in `K` = 1 ist)

=== Tipp für den ersten Shift `LSLS R0, R0, #x`
Manchmal beginnt die Vorlage mit einem grösseren Startshift `#x`, um direkt zum ersten gesetzten Bit zu springen:
- Finde die *kleinste* gesetzte Bitposition `i_min` von `K`.
- Setze `x = i_min`.
- Danach geht es meist mit `#1` Schritten weiter.

#example[
Wenn `K` ungerade → Bit0=1 → `i_min=0` ⇒ `x=0` (kein Vorschub nötig)  
Wenn `K` gerade (z.B. 40=0b00101000) → `i_min=3` ⇒ `x=3`
]
]

= Lecture_Branches
#image("assets_CT/F7_Overview_Branches.png", width: 100%)

- * Unconditional Branches *
  - Springt immer zu Zieladresse
  - direct: Zieladresse wird in label angegeben
   - *Achtung:* wenn der angegebene imm-Offset (nach `<<1`) > 0x400 (negativ) ist, muss man noch einen *sign-extend* machen. Wert - 0x1000. Negative Zahl dann mit PC + 4 + (neg) imm-Offset rechnen.
  - indirect: Zieladresse steht in Register
   - *BX* Rm kann also an beliebige viele Adressen springen
   - Da absolute bedeutet, dass man genau an diese Adresse springen wird, kann man *beliebig* im Speicher springen.

- * Conditional Branches *
 - Sind immer realative (PC-relative)
- *Flag dependent*
  - abhängig von einem Flag (N,Z,C,V)
  #image("assets_CT/F7_Flags_Dependent.png", width: 90%)
- *Arithmetic*
 - abhängig von einem oder mehreren Flags (N,Z,C,V)
 - unsigned:
    #image("assets_CT/F7_Arithmetisch_unsigned.png", width: 90%)
 - signed:
    #image("assets_CT/F7_Arithmetisch_signed.png", width: 90%)

- *Vergleichsinstruktionen (Compare and Test)*
 - `CMP Rn, Rm` → führt `Rn - Rm` aus (setzt Flags, Resultat wird verworfen)
  - Ist gleichbedeutend mit Rn >= Rm ? -> res positiv: true, res negativ: false
 - `CMN Rn, Rm` → führt `Rn + Rm` aus (setzt Flags, Resultat wird verworfen)
  - Ist gleichbedeutend mit Rn + Rm >= 0 ? -> res positiv: true, res negativ: false
 - Ändern keine Register, nur Flags
  - `TST Rn, Rm` → führt `Rn AND Rm` aus (setzt N und Z, Resultat wird verworfen)
    - Prüft ob gemeinsame gesetzte Bits in Rn und Rm vorhanden sind (Z=0 wenn ja, Z=1 wenn nein)


= Lecture_Control_Structures
- *Strukturierte Programme*
  - *Sequence* (einfach nacheinander)
  - *Selection* (`if/else`, `switch`)
  - *Iteration* (`while`, `do-while`, `for`)

#image("assets_CT/F8_If.png", width: 90%)
#image("assets_CT/F8_DoWhile.png", width: 90%)
#image("assets_CT/F8_While.png", width: 90%)
#image("assets_CT/F8_ForInWhile.png", width: 70%)

- *Limitations of Conditional Branches*
  - Nur bedingte Sprünge (keine Schleifen direkt)
  - Nur relativ (PC-relative)
  - Nur begrenzte Reichweite (± 256 Bytes). 
   - Lösuing siehe Bild (Wenn if block zu gross dann else mit B ansteuern)
#image("assets_CT/F8_LimitationsOfConBranch.png", width: 90%)


- *Switch Statement*
#image("assets_CT/F8_Switch.png", width: 90%)
  - jumtable: Ist in Var section (muss bekannt sein)
  - Kurzablauf: 
   - Prüfen ob Wert (R1) im Bereich -> außerhalb: default
   - Index berechnen (R1 `*` 4) 
   - Startadresse der jumptable holen (R7)
    - Zieladresse holen (LDR R7,[R7,R1])
    - Springen (BX R7)

= Lecture_Subroutines_and_Stack
- *Subroutine Definition*
  - called by NAME
  - Internal design not visible to caller -> information hiding
  - can be reused (DRY principle)
  - Function -> returns value; Procedure -> no return value
 - *Call/Return*
  - Call: `BL func` → LR bekommt Rücksprungadresse
  - Return: `BX LR` (oder `POP {...,PC}`)
  #image("assets_CT/F9_Call_Return.png", width: 90%)

- *Unterschiede*
 - *B label vs BL label*
  - B: setzt nur den PC auf das Ziel (Programm läuft dort weiter). Kein Rücksprung wird gespeichert
  - BL: setzt PC auf Ziel und speichert Rücksprungadresse in LR (Link Register) -> Rücksprung mit BX LR möglich oder POP {...,PC}
 - *BX Rm vs BLX Rm*
  - BX Rm: springt zu Adresse in Rm (kein Rücksprung gespeichert). Ändert nur PC
  - BLX Rm: springt zu Adresse in Rm und speichert Rücksprungadresse in LR. Ändert PC und LR

- *Subroutine Sichern*
 #image("assets_CT/F9_Subroutine_Sichern.png", width: 90%)

- * Nested Subroutines *
  - Subroutine kann andere Subroutinen aufrufen
  - LR wird bei jedem `BL` überschrieben → vorher sichern (Stack/Register)
  - Rücksprungadresse immer im LR
  #image("assets_CT/F9_Nested_Subroutines.png", width: 90%)

- *Stack Basics*
 - Stack wächst zu kleineren Adressen (downwards)
 - `PUSH {..}` / `POP {..}` sichern/holen Register

- *Stack Pointer (SP)*
  - Zeigt auf zuletzt genutzten Stack-Eintrag
  - Nach `PUSH`: SP = SP - 4 × Anzahl Register -> neue Position nach ein
  - Nach `POP`: SP = SP + 4 × Anzahl Register -> neue Position nach aus

- *Register-Sichern*
  - Caller-saved vs. Callee-saved (wichtig für saubere Subroutines)
#example[
  *Typisches ISR/Subroutine Muster*  
  - Prolog: `PUSH {R4-R7,LR}`  
  - Epilog: `POP {R4-R7,PC}`
]

= Lecture_Parameter_Passing
- *Application Binary Interfac*
 - Sind Spielreglen für Subroutine Calls
 - Definieren wie Parameter übergeben werden
  - Definieren wie Rückgabewerte übergeben werden
  - Definieren welche Register von Caller/Callee gesichert werden müssen

- *How to pass parameters?*
  - via Registers (schnell, limitiert)
  - via Stack (flexibel, langsamer)
  - via globalen Variablen (unsauber, langsam)
  - ARM nutzt Register-basiertes Parameter Passing (schnell)
  - *Pass by Value*
   - So übergibt ARM Parameter (Kopien in R0–R3)
  - *Pass by Reference*
   - So übergibt ARM Adressen (Pointer in R0–R3) und vorallem grosse Datenstrukturen über Stack
   z.B. Arrays

  - to enumerate and describe the operations of the caller of a subroutine
  - to summarize the structure of a subroutine and describe what happens in the prolog and epilog respectively
- *ARM Procedure Call Standard (AAPCS)*
  - R0–R3: Argumente / Return-Werte
  - R4–R11: callee-saved (müssen von Subroutine gesichert werden)
  - R12: scratch (caller-saved)
  - SP: Stack Pointer
  - LR: Link Register (Rücksprungadresse)
  - PC: Program Counter
  #image("assets_CT/F10_Register_Useages.png", width: 90%)
  #image("assets_CT/F10_Exapmle_ParameterPassing.png", width: 90%)

 - *Register explained*
  - Scratch Register:
   - limited lifetime (only within one subroutine)
   - not named, hold temporary values during calculations
  - Varibale Register:
   - hold values across subroutine calls
   - must be saved/restored by callee if used
   - R8–R12
   - named 
  - Argument, Parameter:
    - used to pass arguments to subroutines and return values
    - Caller copies R0–R3 and additional parameters on stack

#steps[
  *Wenn du eine Funktion schreibst, die andere Funktionen aufruft:*  
  1) sichere callee-saved Register, die du verwendest  
  2) sichere LR, falls du selbst wieder `BL` machst  
  3) arbeite  
  4) restore → return
]

#image("assets_CT/F10_Caller_Calle.png", width: 90%)

- to explain, interpret and discuss stack frames
- to access elements of a stack frame in assembly
- to understand the build-up and tear-down of stack-frames
- *Stack Frame*
  - Es gibt dann zwei SP (physikalisch nur eine, logisch zwei)
   - SP_main (für main und alle aufgerufenen Subroutinen)
   - SP_sub (für die aktuelle Subroutine)
  - Bereich im Stack für eine Subroutine
  - Enthält: gesicherte Register, lokale Variablen, evtl. Parameter
  - Ermöglicht verschachtelte Subroutinen (nested calls)
  - Berechnung 
#image("assets_CT/F10_StackFrame.png", width: 90%)
#image("assets_CT/F10_StackFrame_Example.png", width: 90%)

- *C to Assembly call*
#image("assets_CT/F10_C_to_Assambly.png", width: 90%)

= Lecture_Modular_Coding_Linking
- *Warum modular?* 
 - Komplexität managen, Wiederverwendung, weniger Copy/Paste. 
 - Es gelten die gleichen Prinzipien wie bei prog1 (high cohesion, low coupling).
 - Translationsschritte:
  - Preprocessing (Makros, Includes, bedingte Compilierung)
  - Compilation (C/ASM → Objektdateien .o)
  - Assembly (ASM → Objektdateien .o)
  - Linking (Objektdateien + Libraries → ausführbare Datei .elf/.bin), erst beim Linking werden alle Module zusammengefügt

- *C: Declaration vs. Definition*
  - Declared before use (z.B. in Header-Datei)
  - Defined once (z.B. in Quellcode-Datei)
  - Declaration: “Name existiert so” (z.B. `uint32_t f(uint32_t);`)
  - Definition: “hier ist der Code / Speicher wird reserviert”

- *Scurce Code Anatomy*
 - External linkage: global (über Module hinweg sichtbar)
 - Internal linkage: static (nur innerhalb eines Moduls sichtbar)
 - No linkage: lokale Variablen (nur innerhalb einer Funktion sichtbar)

#image("assets_CT/F11_Internal_External_Linkage_Example.png", width: 90%)

- *EXPORT and IMPORT*
 - `EXPORT name` in Assembly: macht Symbol global sichtbar (external linkage)
 - `IMPORT name` in Assembly: deklariert externes Symbol (muss in anderem Modul definiert sein)

- *Assembly to object file linkage*
  - References: *Imported symbols* translate *global reference symbols* in object file
  - global: *Exported symbols* translate to *global symbols*
  - local: *Internal symbols*  translate to *local symbols* 

#image("assets_CT/F11_Internal_External_Linkage_Assembly_Example.png", width: 90%)

- *Linker Tasks*
  - Merging (Code/Data Sections zusammenfügen)
   - data Section
   - code Section
  - Resolve used external symbols
  - Relocate addresses
  #image("assets_CT/F11_Linker_merge_Section.png", width: 90%)

- *Merging Code Section*
#image("assets_CT/F11_merge.png", width: 90%)
 - Erster Offset ist immer startadresse der Section (0x0000_0000)
 - Alle folgenden Sections werden nacheinander angefügt
 - Neue Adresse = vorherige Endadresse + 4 (Im Bild 0x0000_0018 + 4 = 0x0000_001C)

- *Merging Date Section*
 - Funktioniert gleich wie Code Section
 - Erster Offset ist immer startadresse der Section
 - zb Section1: 0x00 DCD 5, Section2: 0x04 DCD 7 etc... 

- *Resolve*
 - Ist merge für symbol Tables. 
#image("assets_CT/F11_Resolve.png", width: 90%)

- *Relocate*
 - Ist ausrechnen der relativen finalen Adressen im main.o 
 - Formel: *new address = base address + offset + module relative address*
  - base address: startadresse der Section im finalen Executable
  - offset: wo ist das Modul in der Section (nach merge)
  - module relative address: Adresse im Modul (vor Relocate)
  #image("assets_CT/F11_Relocate.png", width: 90%)
  #image("assets_CT/F11_Relocated.png", width: 90%)

- *Static Linking*
  - Alle Objektdateien und Libraries werden zur Build-Zeit zusammengefügt
  - Ergebnis: eine ausführbare Datei (.elf/.bin)
  - Vorteile: Einfach, schnell, keine Abhängigkeiten zur Laufzeit
  - Nachteile: Grössere Datei, keine Updates einzelner Module möglich
- *Dynamic Linking*
  - Module werden zur Laufzeit geladen (shared libraries)
  - Vorteile: Kleinere ausführbare Datei, Updates einzelner Module möglich
  - Nachteile: Komplexer, Abhängigkeiten zur Laufzeit, Performance-Overhead

- *Map File*
  - Textdatei mit Speicherlayout der ausführbaren Datei
  - Enthält Adressen und Grössen von Sektionen, Symboltabellen
  - Nützlich für Debugging, Optimierung, Speicheranalyse
  
- *Source level Debugging*
 - needs mapping Machine address to Source code line
 - needs mapping Memory location and source code types
 - often Provided in in obj file eg .elf format

= Lecture_Exceptional_Control_Flow-Interrupts
- *Polling vs Interrupt-driven I/O*
  - Polling: Ist einfach periodisch prüfen ob ein Ereignis eingetreten ist
   - einfach, deterministisch, aber Busy-Wait (CPU-Zeit verschwendet)
  - Interrupt: Ist ereignisgesteuert (Peripherie signalisiert CPU)
   - effizienter, multitasking-fähig
   - schnelle Reaktion, aber keine Synchronisation zwischen main und ISR + Debugging schwieriger

#image("assets_CT/F12_Polling.png", width: 90%)
#image("assets_CT/F12_ISR.png", width: 90%)

- to explain how the Cortex-M3/M4 recognizes and processes exceptions
- to explain the vector table of the Cortex-M3/M4
- to distinguish the different types of exceptions on a Cortex-M3/M4
- *Exceptions (Cortex-M3/M4 Sicht)*
  - System Exceptions (Reset, NMI, Faults, SVC, …)
  - Interrupts IRQ0…IRQ239 (Peripherals, auch software-triggerbar)
  - Sind eigentlich das gleiche, aber unterschiedliche Prioritäten und Vektoren
 
#image("assets_CT/F12_InterruptsVSSystemException.png", width: 90%)
#image("assets_CT/F12_System_Exceptions_Overview.png", width: 90%)

- *Interrupts: change of programm Flow*
Buch vegleich: finish -> Satz fertig lesen, save -> Buchzeichen, load address -> springen zum Interrupt Handler
#image("assets_CT/F12_Change_of_programm_flow.png", width: 90%)
 - *Context Save/Restore bei ISR Entry/Return*
  - *Hardware* stackt automatisch: xPSR, PC, LR, R12, R0–R3 , EX stored
  - Am schluss von myISR `BX LR` (LR = EXC_RETURN Wert) → Hardware entstackt automatisch
  - nicht automatisch gesichert: R4-R11
#image("assets_CT/F12_autosave.png", width: 90%)

- to understand the basic functionality of the Nested Vectored Interrupt Controller (NVIC)
- *NVIC Grundfunktionen*
 - 240 Interrupts (IRQ0–IRQ239) -> trigger von Peripherie (high level signal)
 - NVIC ist Hardware-Modul im Cortex-M, leitet Interrupts an CPU weiter (physikalisch)
 - CPU rechnet vector addresse aus, basierend auf IRQ-Nummer
 - Vektor-Tabelle: Liste von Adressen für jeden Exception/Interrupt (im Flash bei 0x0000_0000)
 - Alle Register werden automatisch gespeichert -> Entwickler muss nur ISR schreiben
 

- *Vector Table*
#image("assets_CT/F12_Vector_table.png", width: 90%)

- *Interrupts Control*
 - Inactive: Interrupt nicht aktiv (Standard)
 - Pending: Interrupt ist angefordert (warten auf Service) (IRQn = 1) (Interrupt disabled)
  - Pending Register: Setzen/Löschen von Pending Bits
 - Active: Interrupt wird gerade serviced (Interrupt enabled)
  - Active Status Register: Lesen ob Interrupt aktiv ist (bit setzt wenn aktiv, cleared wenn fertig)
 - Active and Pending: Interrupt wird gerade serviced, aber erneut angefordert

- *Prioritize exceptions*
  - Jede Exception/Interrupt hat Priorität (0 = höchste, 255 = niedrigste)
  - Priorität wird in NVIC konfiguriert (4 Bits genutzt -> 16 Stufen)
   - Prio setzten von IRQn: via LDR R0,=PL_REG_IRQn, dann prio in R1 schreiben und speichern
   - *Achtung* je tiefer die Zahl, desto höher die Priorität (0 = höchste Prio)

- *Preemption:* Höher priorisierte Interrupts können tiefer priorisierte unterbrechen
  - z.B. IRQ1 (Prio 2) kann IRQ2 (Prio 5) unterbrechen
- *Tail-Chaining:* Wenn ISR endet und ein anderer Interrupt pending ist, wird dieser sofort gestartet (ohne Rückkehr zu main)

- *Simultaneously pending*
  - Wenn mehrere Interrupts gleichzeitig pending sind, wird der mit der höchsten Priorität zuerst bedient
  - NVIC wählt automatisch den nächsten Interrupt basierend auf Priorität und Pending-Status aus

#image("assets_CT/F12_Nested_Exceptions.png", width: 90%)

*Wichig:* IRQ set by HW - cleared by SW 

- *Enable/Disable Interputs*
 - Alle Ein/Ausschalten in asm: (CPSID i / CPSIE i)
 - All Ein/Ausschalten in C: `__disable_irq()`, `__enable_irq()`

```yasm
LDR R1, =0x10000040 ;enable Interup mask
LDR R0, =REG_SETENA0
STR R1, [R0]
```
Man kann die Vits auch ein- und ausschalten, weil aktive bits einen Effekt auf das Register haben
#image("assets_CT/F12_Enalbe_Disable_Interrupts.png", width: 50%)
*Achtung* 0x08 ist bit 3 (IRQ3) setzten (0b0000_1000), am besten 1 und dann shiften -> `LSLS R1, R1, #IRQn`. Achtung shift vlt zu gross, aufteilen.
#image("assets_CT/F12_Setana.png", width: 100%)

- *Data Consistency Issues*
 - Interrupts können Variablen ändern, während main darauf zugreift
 - Lösung:
  - Disable Interrupts während kritischer Abschnitte (`__disable_irq()`, `__enable_irq()`)
#image("assets_CT/F12_Critical_Section.png", width: 90%)

- *Code Example ISR*
```asm
    AREA ISR_Example, CODE, READONLY
    EXPORT MyISR
MyISR
    ; ISR Code hier
    BX LR
    END
```

- *CMSIS*
  - Cortex Microcontroller Software Interface Standard
  - Standardisierte Header-Dateien und Funktionen für Cortex-M
  - Erleichtert Entwicklung und Portabilität
  - Enthält NVIC-Funktionen, System-Initialisierung, etc.
  - Methoden: `NVIC_EnableIRQ(IRQn_Type IRQn)`, `NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)`

= Lecture_Increasing_System_Performance
- *Optimierung ist ein Trade-off*
  - Geschwindigkeit vs. Komplexität vs. Energieverbrauch vs. Kosten
  - Meistens: mehr Geschwindigkeit → mehr Komplexität/Kosten/Energie

- *Bus-/Speicherarchitektur*
  - von Neumann: Code+Data über eine Schnittstelle → Bottleneck
  - Harvard: getrennte Interfaces → mehr Durchsatz
  - Meiste System sind Harvard (Cortex-M)

- *ISA Paradigmen*
  - RISC(Reduced Instruction Set Computer): wenige, einfache Instruktionen; Load/Store; gut pipeline-bar
   - Vorteile: einfach und schnell, Mehr Register auf CPU (weniger Speicherzugriffe), mehrere data pfade möglich, höhere Taktfrequenz, besser für Compiler, einfaches Pipelining
   - Nachteile: mehr Instruktionen pro Programm, grösserer Code (mehr Speicher
  - CISC(Complex Instruction Set Computer): viele, komplexe Instruktionen; direkt auf Speicher operierend; schwer pipeline-bar
    - Vorteile: kompakter Code (weniger Speicher), weniger Instruktionen pro Programm, komplexe Operationen in einer Instruktion
    - Nachteile: komplexe Hardware, schwerer zu pipeline-en, längere Taktzyklen, schwieriger für Compiler
#image("assets_CT/F13_RISC_vs_CISC.png", width: 90%)


- *Pipelining (FE/DE/EX)*
  - Es gibt mehrere Stages (z.B. Fetch, Decode, Execute) -> wenn eine Stage von fetch zu decode geht, kann die fetch Stage schon die nächste Instruktion holen
  - Erhöht Instruktionsdurchsatz (IPS), nicht Latenz (Zeit pro Instruktion)
  - Ideal: 1 Instruktion pro Takt (nach Füllen der Pipeline)
  - Pipeline-Takt wird von *langsamster Stage bestimmt*
  - Hazards:
    - Data hazard (z.B. LDR braucht Bus → stall)
    - Control hazard (Branch-Entscheid spät → bubbles)

#formula[
  *Instruction Throughput*  
  - ohne Pipeline: IPS = 1 / (Instruktions-Delay)  
  - mit Pipeline: IPS ≈ 1 / (max Stage-Delay)  // nach dem Füllen
  - Instruction Delac für eine Instruktion = Summe aller Stage-Delays (FE + DE + EX)
  - was dedeutet max Stage-Delay?  
   - die langsamste Stage bestimmt den Takt der gesamten Pipeline
]

#formula[
  *Special Operations Pipeline pause*  
  - Data Hazard: wenn eine Instruktion auf das Resultat einer vorherigen angewiesen ist (z.B. LDR gefolgt von ADD auf dasselbe Register)  
   - Lösung: Pipeline *stallen* (nops einfügen(s)) oder Forwarding (Daten direkt weiterleiten)
   - stallen heisst, dass die Pipeline für einige Zyklen angehalten wird, um Datenabhängigkeiten zu lösen.
]

- *Optimierungen / Parallelität*
  - Parallel Computing:
   - Straming/Vector Processing (gleiche Operation auf viele Daten)
   - Multithreading (mehrere Threads auf einer CPU)
    - Zeitliche Aufteilung (time-slicing) eines Prozessors auf mehrere Threads
    - Scheduler verwaltet Kontextwechsel, er teilt CPU-Zeit zu
   - Multicore (mehrere CPU-Kerne auf einem Chip)
    - All on one Chip, wenniger treffic, billiger, shared memory
   - Multiprocessor (System mit mehreren Chips)
    - Mehrere physikalische Prozessoren, mehr Leistung, komplexe Kommunikation, teurer, höhere Distanz zwischen Prozessoren

- *instructions*
#image("assets_CT/F13_SIMD.png", width: 90%)

- *Hazards*
 - Branch prediction, Prefetch, Out-of-order (bei grossen CPUs; kann Security-Risiken bringen)

= Stolpersteine
== Umrechnen hex in neg dezimal
- Beispiel: 0xFF = -1
  - MSB = 1 → negativ
  - Betrag berechnen: 0x100 - 0xFF = 0x01 = 1
  - Vorzeichen setzen: -1
- Beispiel: 0xFF5422A2 = - (0x100000000 - 0xFF5422A2) = - (4294967296 - 4288676674) = -6290622

= Häufige Code Snippets
== Maximum
```asm
    CMP   R1, R2
    BGE   r1_is_max      ; signed: R1 >= R2
    MOV   R0, R2         ; sonst ist R2 max
    B     done
r1_is_max:
    MOV   R0, R1
done:
```
== Minimum
```asm
    CMP  R1, R2
    BLS  r1_is_min     ; unsigned: R1 <= R2
    MOV  R0, R2
    B    done
r1_is_min:
    MOV  R0, R1
done:
```

== Toggle
```asm  
    LDRB  R0, [R4]      ; aktueller LED-Wert (8-bit)
    MOVS  R1, #0x04     ; Maske für Bit2
    EORS  R0, R0, R1    ; toggelt genau Bit2
    STRB  R0, [R4]      ; zurückschreiben
```

= absolute
```asm  
    ;R0 -> value (signed)
    CMP  R0, #0
    BGE  value_is_positive
    ; value < 0
    RSBS R0, R0, #0     ; R0 = -R0
    B    done
value_is_positive:
    ; value >= 0 (R0 bleibt gleich)
done:
```
== LED Toggel depending on actual led state
```asm
    LDR   R0, =GPIO_PORTF_DATA_R
    LDR   R1, [R0]
    ANDS  R1, R1, #0x01        ; check if LED is on (bit 0)
    BEQ   led_is_off
    ; LED is on, turn it off
    BIC   R1, R1, #0x01
    STR   R1, [R0]
    B     done
led_is_off:
    ; LED is off, turn it on
    ORR   R1, R1, #0x01
    STR   R1, [R0]
done:
```

== Sume eines Arrays
```asm
    MOVS  R2, #0          ; sum = 0
sum_loop:
    CMP   R1, #0
    BEQ   done
    LDRB  R3, [R0]        ; load byte
    ADDS  R2, R2, R3      ; sum += byte
    ADDS  R0, R0, #1      ; ptr++
    SUBS  R1, R1, #1      ; n--
    B     sum_loop
done:
```


]
