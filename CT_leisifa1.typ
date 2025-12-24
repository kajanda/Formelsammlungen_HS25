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

= Lernziele


== Lecture_Casting
#example[
#emph[At the end of this lesson you will be able]
- to explain the casting of integer types in C
- to apply the assembly instructions associated with casting
- to say how a given memory content is interpreted for different integer types in C
- to give the memory content after storing different C integer types
]

== Lecture_Logic_and_Shift-Rotate_Instructions
#example[
#emph[At the end of this lesson you will be able]
- to enumerate and apply the Cortex-M0 instructions for logical operations and shifting/rotating
- to interpret Cortex-M0 assembly programs which contain logical operations and shifting/rotating
- to use logical operations for bit manipulation
- to explain the effect of the shift and rotate operations on the flags (N, Z, C, V)
- to program bit manipulation operations (set, clear, toggle, test a bit) in assembly language
- to determine (with the help of documents) the state of the ARM Flags (N, Z, C, V) after logical operations and shift/rotate operations
]

== Lecture_Branches
#example[
#emph[At the end of this lesson you will be able]
- to explain what branch instructions are and how they work
- to classify a given branch instruction with regard to
  - conditional / unconditional
  - relative / absolute
  - direct / indirect
- to apply and discuss the different branch instructions
- to determine based on the settings of the flags whether a conditional branch is taken or not
- to distinguish, apply and explain the instructions CMP,CMN and TEST
]

== Lecture_Control_Structures
#example[
#emph[At the end of this lesson you will be able]
- to explain the basic concepts of structured programming
- to enumerate and explain the basic elements of a structogram
- to comprehend how a C-compiler implements control structures in assembly language
  - if-then-else
  - do-while loops
  - while loops
  - for loops
  - switch statements
- to program basic structograms in assembly language
]

== Lecture_Subroutines_and_Stack
#example[
#emph[At the end of this lesson you will be able]
- to explain why subroutines are important in program development
- to explain how a processor stack works
- to interpret and explain the code for subroutine calls in assembly
- to implement leaf and non-leaf functions in Cortex-M assembly
- to explain the difference between leaf and non-leaf functions
]

== Lecture_Parameter_Passing
#example[
#emph[At the end of this lesson you will be able]
- to outline the basic ideas of the ARM Procedure Call Standard
- to enumerate the different registers in the ARM Procedure Call Standard
- to explain how registers are saved (caller-saved and callee-saved registers)
- to outline what stack frames are and how they are implemented
- to interpret assembly programs and relate register values to function parameters and return values
- to interpret and explain assembly programs which use stack frames
- to implement basic stack frames in Cortex-M0 assembly
- to outline what an Application Binary Interface (ABI) is
- to explain why the ABI is important for modular programming
]

== Lecture_Modular_Coding_Linking
#example[
#emph[At the end of this lesson you will be able]
- to explain the concepts behind modular programming
- to appropriately partition C and assembly programs into modules
- to explain the steps involved from source to the executable program
- to interpret map files of object files and executable programs
- to explain the main tasks of a linker: merging, resolution, relocation
- to explain the rules the linker applies for resolution and relocation
- to explain the difference between static and dynamic linking
- to explain the concept of source level debugging
]

== Lecture_Exceptional_Control_Flow-Interrupts
#example[
#emph[At the end of this lesson you will be able]
- to explain advantages and disadvantages of polling and interrupt-driven I/O
- to distinguish the different types of exceptions on a Cortex-M3/M4
- to explain how the Cortex-M3/M4 recognizes and processes exceptions
- to explain the vector table of the Cortex-M3/M4
- to understand the basic functionality of the Nested Vectored Interrupt Controller (NVIC)
  - to enable and disable interrupts
  - to set and clear interrupts by software
  - to prioritize exceptions
  - to know how programmed priorities influence preemption of service routines
  - to explain how simultaneously pending interrupts are processed
- to implement a simple interrupt service routine in Cortex-M assembly
- to explain potential data consistency issues due to interrupts and to give potential examples
]

== Lecture_Increasing_system_Performance
#example[
#emph[At the end of this lesson you will be able]
- to explain different types of bus architectures
- to understand the difference between von Neumann and Harvard architecture
- to understand RISC and CISC paradigms
- to describe the idea of pipelining
- to calculate processing performance improvement through pipelining
- to describe the basics of parallel computing
]

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
- *Signed ↔ Unsigned (Interpretation)*
  - Gleiche Bitfolge → anderer Zahlenwert (z.B. 0xFF: unsigned=255, signed=-1)

- *Extension (kleiner → grösser)*
  - unsigned: *zero extension*
  - signed: *sign extension*

- *Truncation (grösser → kleiner)*
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

= Lecture_Logic_and_Shift-Rotate_Instructions

- *Logik (typisch, oft mit Flags-Update durch “S”)*
  - `ANDS, EORS, ORRS, BICS, MVNS, TST`

- *Shifts & Rotate*
  - `LSLS` logical left (0 rein, C bekommt “rausfallendes” Bit)
  - `LSRS` logical right (0 rein)
  - `ASRS` arithmetic right (MSB/Vorzeichen bleibt)
  - `RORS` rotate right (zyklisch)

#example[
  - `TST R0,R1` macht AND nur für Flags (kein Ergebnis speichern) → perfekt vor `BEQ/BNE`.
]

= Lecture_Branches

- *Unconditional*
  - `B label`  (kurzer Sprung)
  - `BL label` (Subroutine Call: LR ← return addr)
  - `BX Rm`    (Springe zu Adresse in Register; Thumb-Bit beachten)

- *Conditional*
  - `B{cond} label` (EQ, NE, CS/HS, CC/LO, MI, PL, VS, VC, HI, LS, GE, LT, GT, LE)
  - `CBZ/CBNZ Rn,label` (compare and branch if (non)zero)
  - `IT{pattern} cond` macht bis zu 4 folgende Instruktionen bedingt (Then/Else)

#formula[
  *Merke (Bedingungen via Flags)*  
  - EQ: Z=1, NE: Z=0  
  - CS/HS: C=1, CC/LO: C=0  
  - MI: N=1, PL: N=0  
  - VS: V=1, VC: V=0
]

= Lecture_Control_Structures

- *Strukturierte Programme*
  - *Sequence* (einfach nacheinander)
  - *Selection* (`if/else`, `switch`)
  - *Iteration* (`while`, `do-while`, `for`)

- *Assembly-Muster*
  - if/else: `CMP` → `B{cond}` zu else/endif
  - while: test am Anfang (loop_head)
  - do-while: test am Ende
  - switch: Kette von Vergleichen oder Sprungtabelle (je nach Compiler/Range)

#steps[
  *while-Loop Skeleton (Assembler-Denke)*  
  1) loop_head:  CMP ...  
  2)            B{cond_false} loop_end  
  3)            body ...  
  4)            B loop_head  
  5) loop_end:
]

= Lecture_Subroutines_and_Stack

- *Call/Return*
  - Call: `BL func` → LR bekommt Rücksprungadresse
  - Return: `BX LR` (oder `POP {...,PC}`)

- *Stack Basics*
  - Stack wächst typischerweise zu kleineren Adressen (downwards)
  - `PUSH {..}` / `POP {..}` sichern/holen Register

- *Register-Sichern*
  - Caller-saved vs. Callee-saved (wichtig für saubere Subroutines)

#example[
  *Typisches ISR/Subroutine Muster*  
  - Prolog: `PUSH {R4-R7,LR}`  
  - Epilog: `POP {R4-R7,PC}`
]

= Lecture_Parameter_Passing

- *Grundidee Calling Convention (AAPCS-Style)*
  - Argumente: zuerst in R0–R3
  - Return: meist in R0 (ggf. R1 für “zweites Wort”)
  - Weitere Argumente / grosse Daten: über Stack

- *Wer muss was retten?*
  - Caller-saved: R0–R3, R12 (und oft LR wenn weiter-call)
  - Callee-saved: typ. R4–R11

#steps[
  *Wenn du eine Funktion schreibst, die andere Funktionen aufruft:*  
  1) sichere callee-saved Register, die du verwendest  
  2) sichere LR, falls du selbst wieder `BL` machst  
  3) arbeite  
  4) restore → return
]

= Lecture_Modular_Coding_Linking

- *Warum modular?* Komplexität managen, Wiederverwendung, weniger Copy/Paste

- *C: Declaration vs. Definition*
  - Declaration: “Name existiert so” (z.B. `uint32_t f(uint32_t);`)
  - Definition: “hier ist der Code / Speicher wird reserviert”

- *Linker Tasks*
  - Merging (Code/Data Sections zusammenfügen)
  - Symbol Resolution (Referenzen auflösen)
  - Relocation (Adressen nach dem Zusammenfügen anpassen)

- *Toolchain / Libraries*
  - Native vs. Cross Toolchain
  - Static Libraries (link-time “reinkopiert”) vs Dynamic/Shared (load-time)

#formula[
  *One-Definition-Rule (Merke)*  
  - Deklarieren: mehrfach ok  
  - Definieren: in einem Scope nur einmal
]

= Lecture_Exceptional_Control_Flow-Interrupts

- *Polling vs Interrupt-driven I/O*
  - Polling: einfach, deterministisch, aber Busy-Wait (CPU-Zeit verschwendet)
  - Interrupt: schnelle Reaktion, aber Synchronisation/Debugging schwieriger

- *Exceptions (Cortex-M3/M4 Sicht)*
  - System Exceptions (Reset, NMI, Faults, SVC, …)
  - Interrupts IRQ0…IRQ239 (Peripherals, auch software-triggerbar)

- *Vector Table*
  - Liegt bei Reset an Adresse 0x0000_0000 (Mapping)
  - enthält Start-SP und Handler-Adressen

- *Context Save/Restore bei ISR Entry/Return*
  - Hardware stackt automatisch: xPSR, PC, LR, R12, R0–R3
  - EXC_RETURN wird in LR gesetzt; Return via `BX LR`

#formula[
  *Kontext bei ISR Entry (automatisch)*  
  push: xPSR, PC, LR, R12, R0–R3  
  EXC_RETURN typisch: 0xFFFF_FFF9
]

- *NVIC Grundfunktionen*
  - Enable/Disable (global z.B. PRIMASK / CPSID i, CPSIE i + individuell)
  - Pending/Active Bits
  - Prioritäten → Preemption

#example[
  *Data Consistency Problem:*  
  - Main liest Struktur, ISR schreibt gleichzeitig → “gemischte” Anzeige  
  - Lösung: kritische Sektion mit `__disable_irq(); ... __enable_irq();`
]

= Lecture_Increasing_System_Performance

- *Bus-/Speicherarchitektur*
  - von Neumann: Code+Data über eine Schnittstelle → Bottleneck
  - Harvard: getrennte Interfaces → mehr Durchsatz

- *ISA Paradigmen*
  - CISC: komplexe Instruktionen
  - RISC: wenige, einfache Instruktionen; Load/Store; gut pipeline-bar

- *Pipelining (FE/DE/EX)*
  - Durchsatz nach “Füllen” ≈ 1 Instruktion pro Pipeline-Takt
  - Pipeline-Takt wird von langsamster Stage bestimmt
  - Hazards:
    - Data hazard (z.B. LDR braucht Bus → stall)
    - Control hazard (Branch-Entscheid spät → bubbles)

#formula[
  *Instruction Throughput (Idee)*  
  - ohne Pipeline: IPS = 1 / (Instruktions-Delay)  
  - mit Pipeline: IPS ≈ 1 / (max Stage-Delay)  // nach dem Füllen
]

- *Optimierungen / Parallelität*
  - Branch prediction, Prefetch, Out-of-order (bei grossen CPUs; kann Security-Risiken bringen)
  - Parallel Computing: SIMD, Multithreading, Multicore, Multiprocessor


]
