
WBE Themen
Folien zusammenfügen

W3 school + ergänzen Folien + Praktikas
- 1. Thema Javascript können  (40%)
  - 1.1 typeScript

http Request -> Codesnipets definieren
- 2. Webserver (20%)

- 3. Browser Technologien (30%)
- web storage / local storage
- Eventhandling / Weiterleitung
- DOM Scripting und

- 4. UI Bibliotheken (10%)


= Tutorial:
== Wie mache ich hier ein if statement?
```html
<button type="button" onclick="document.getElementById('demo').style.fontSize='35px'">Click Me!</button>
```

```html
<p id="demo">Hallo</p>

<button type="button" onclick="toggleFont()">Click Me!</button>

<script>
  function toggleFont() {
    const el = document.getElementById('demo');

    // Achtung: el.style.fontSize liest nur "inline style".
    // Wenn noch nichts gesetzt ist, ist es meist "".
    if (el.style.fontSize === '35px') {
      el.style.fontSize = '';      // zurück (Browser/CSS-Standard)
      // alternativ: el.style.fontSize = '16px';
    } else {
      el.style.fontSize = '35px';
    }
  }
</script>

```
== What is a correct syntax for including a JavaScript in an HTML document?
```html

<script>
  // Your JavaScript code here 
</script>
```

== Where to put the script tag in an HTML document?
- script: head
- invoke function: body

```html
<!DOCTYPE html>
<html>
<head>
<script>
function myFunction() {
  document.getElementById("demo").innerHTML = "Paragraph changed.";
}
</script>
</head>
<body>
<h2>Demo JavaScript in Head</h2>

<p id="demo">A Paragraph</p>
<button type="button" onclick="myFunction()">Try it</button>

</body>
</html>
```

== External JavaScript file:
```html
<!DOCTYPE html>
<html>
<head>
<script src="myscripts.js"></script>
</head>
<body>
<h2>Demo External JavaScript</h2>
<p id="demo">A Paragraph</p>
<button type="button" onclick="myFunction()">Try it</button>
</body>
</html>
```

= syntax

Keine Vorbereitungs-Fragen

= Vergleichariables

== Scope rules

```javascript
{
let x = 10; // global variable
}
// x is not accessible here

}
var x = 10; // global variable
}
// x is accessible here

```

#table(
  columns: (auto, auto, auto, auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [], [Scope], [Redeclare], [Reassign], [Hoisted], [Binds this],
  ),
  `var`,   `No`,  `Yes`, `Yes`, `Yes`, `Yes`,
  `let`,   `Yes`, `No`,  `Yes`, `No`,  `No`,
  `const`, `Yes`, `No`,  `No`,  `No`,  `No`,
)

== what is hoisting?
Variables defined with var are hoisted to the top and can be initialized at any time.

Meaning: You can use the variable before it is declared:


== What is const?
Variables defined with const cannot be reassigned.
They are block-scoped, much like variables defined using the let keyword.
They must be initialized at the time of declaration.
```javascript
const pi = 3.14;
pi = 3.14159; // This will give an error
```

=== const with arrays 
```javascript
const numbers = [1, 2, 3];
numbers.push(4); // This is allowed
console.log(numbers); // Output: [1, 2, 3, 4]
numbers = [5, 6, 7]; // This will give an error
```

== Datatypes in JavaScript

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Type], [Description],
  ),

  `String`,    [A text of characters enclosed in quotes],
  `Number`,    [A number representing a mathematical value],
  `Bigint`,    [A number representing a large integer],
  `Boolean`,   [A data type representing true or false],
  `Object`,    [A collection of key-value pairs of data],
  `Undefined`, [A primitive variable with no assigned value],
  `Null`,      [A primitive value representing object absence],
  `Symbol`,    [A unique and primitive identifier],
)

== JavaScript Booleans
#table(
  columns: (1fr, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [Description], [Expression], [Returns],
  ),

  [Equal to],     `(x == 8)`, `false`,
  [Not equal to], `(x != 8)`, `true`,
  [Greater than], `(x > 8)`,  `false`,
  [Less than],    `(x < 8)`,  `true`,
)
= Operators
#table(
  columns: (auto, 1fr, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [Operator], [Description], [Example],
  ),

  `==`,  [equal to],                      `x == 5`,
  `===`, [equal value and equal type],    `x === 5`,
  `!=`,  [not equal],                     `x != 5`,
  `!==`, [not equal value or not equal type], `x !== 5`,
)

= Was ist der genaue Unterschied?

- `==` und `!=` machen *Type Coercion* (JavaScript versucht Typen automatisch anzupassen).
- `===` und `!==` machen *keine* Type Coercion: Wert *und* Typ müssen passen.

Beispiel:
```js
let x = "5";

x == 5;   // true  -> "5" wird zu 5 umgewandelt
x === 5;  // false -> string vs number (Typ ist anders)

x != 5;   // false -> "5" wird zu 5 umgewandelt
x !== 5;  // true  -> Typ ist anders
```

== automatische Typumwandlung
JavaScript wandelt Typen automatisch um, wenn nötig.
```js
let x = "5";      // string
let y = 5;        // number
let z = x + y;    // "55"  -> y wird zu "5" umgewandelt
let w = x * y;    // 25    -> x wird zu 5 umgewandelt
```

wenn ich z.B. `x + y` mache, und einer der beiden ein string ist, dann wird der andere auch zu einem string umgewandelt und es wird eine Verkettung gemacht. 
Wenn ich aber `x + y`als addition machen will, muss ich beide in zahlen umwandeln:
```js
let z = Number(x) + Number(y); // 10
```

= Operators

== Comparisons

was passiert "5" < "10" ?
- beide sind strings, also wird lexikographisch verglichen:
- "1" kommt vor "5", also ist "10" < "5" -> false

= if statements

let isMember = true;
let discount = isMember ? 0.2 : 0;

= Everything Without a "Value" is False
what is "without a value"?
- false
- 0
- "" (empty string)
- null
- undefined
- NaN

= loops

== break vs continue
- break: beendet die Schleife komplett
- continue: überspringt den aktuellen Durchlauf und macht mit dem nächsten weiter

= strings
== comapring two String **objects**
Es kommt immer false zurück, weil es zwei verschiedene Objekte sind.

== Template Strings
```javascript
let name = "Fabio";
let greeting = `Hello, ${name}!`; // Using backticks and ${} for interpolation
console.log(greeting); // Output: Hello, Fabio!
```

sind einfach diese `` thicks, die können einfach F2_Memeory_allocation_in_Assambley

== String HTML wrappers methods
Wie funktionieren sie? 
Sie erstellen ein neues HTML-Element um den String herum.
```javascript
let text = "Hello World";
let boldText = text.bold(); // <b>Hello World</b>
let italicText = text.italics(); // <i>Hello World</i>
console.log(boldText);
console.log(italicText);
```

Heute werden diese Methoden nicht mehr empfohlen, da sie veraltet sind. Stattdessen 
sollte man auf dem DOM arbeiten, um HTML-Elemente zu erstellen und zu manipulieren.

== Was ist der DOM 
Der Document Object Model (DOM) ist eine Programmierschnittstelle für HTML- und XML-Dokumente.
Es stellt die Seite so dar, dass Programme die Struktur, den Stil und den Inhalt des Dokuments ändern können.
Der DOM repräsentiert das Dokument als eine Baumstruktur, in der jedes Knotenpunkt ein Teil des Dokuments darstellt, wie z.B. ein Element, ein Attribut oder ein Textabschnitt.

= numbers

== Bitweise
Was passiert wenn man auf eine number bitweise operationen anwendet?
- die number wird in eine 32-bit Ganzzahl umgewandelt
- die bitweise operation wird durchgeführt
- das Ergebnis wird wieder in eine number umgewandelt

== Shift Operators
Was passiert bei einem left shift?
- die bits werden nach links verschoben, es wird mit 0en aufgefüllt
Was passiert bei einem right shift?
- die bits werden nach rechts verschoben, das Vorzeichenbit wird aufgefüllt (für negative Zahlen)

= Functions
== ... and arguments

```javascript
function sumAll() {
  let sum = 0;
  for (let i = 0; i < arguments.length; i++) {
    sum += arguments[i];
  }
  return sum;
}
```
ist das gleiche wie
```javascript
function sumAll(...args) {
  let sum = 0;
  for (arg of args) {
    sum += arg;
  }
  return sum;
}
```
== Function Expressions
```js
const square = function(x) {
  return x * x;
};

console.log(square(5)); // Output: 25
```

oder
```js
const square = (x) => {
  return x `*` x;
};
console.log(square(5)); // Output: 25
```

oder

```js
const square = x => x `*` x;
console.log(square(5)); // Output: 25
```

== Key Differenzces Between Function Declarations and Function Expressions
Syntax: Function declarations require a name. Function expressions can be anonymous.
Hoisting: Function declarations are hoisted. Function expressions are not.
Flexibility: Function declarations offer more flexibility in how and where they are used.

= Objekte
== Prototype Inheritance
Jedes JavaScript-Objekt hat eine Eigenschaft namens Prototype.
Diese Eigenschaft verweist auf ein anderes Objekt, von dem es Eigenschaften und Methoden erben kann.
Wenn auf eine Eigenschaft oder Methode eines Objekts zugegriffen wird, sucht JavaScript zuerst im Objekt selbst danach.
Wenn es dort nicht gefunden wird, sucht es im Prototype-Objekt.

```javascript
const proto2 = {
  c() { return "C"; }
};

const proto1 = Object.create(proto2);
proto1.b = function () { return "B"; };

const obj = Object.create(proto1);
obj.a = function () { return "A"; };

console.log(obj.a()); // A (vom obj)
console.log(obj.b()); // B (von proto1)
console.log(obj.c()); // C (von proto2)
```

== Creating Objects mit Prototypes
```javascript
const personPrototype = {
  greet: function() {
    console.log(`Hello, my name is ${this.name}`);
  }
};
function createPerson(name, age) {
  const person = Object.create(personPrototype);
  person.name = name;
  person.age = age;
  return person;
}
const alice = createPerson('Alice', 30);
alice.greet(); // Output: Hello, my name is Alice
const bob = createPerson('Bob', 25);
bob.greet(); // Output: Hello, my name is Bob
```

=== was wenn Attribute fehlen?
```javascript
const charlie = createPerson('Charlie');
console.log(charlie.age); // Output: undefined
charlie.greet(); // Output: Hello, my name is Charlie
```

=== delete property
```javascript
const person = {
  name: 'David',
  age: 40
};
delete person.age;
console.log(person.age); // Output: undefined
console.log(person); // Output: { name: 'David' }
```

=== Display objects
```javascript
const car = {
  make: 'Toyota',
  model: 'Camry',
  year: 2020
};
console.log(car); // Output: { make: 'Toyota', model: 'Camry', year: 2020 }
```

=== Display all properties
```javascript
const book = {
  title: '1984',
  author: 'George Orwell',
  year: 1949
};
for (let key in book) {
  console.log(`${key}: ${book[key]}`);
}
// Output:
// title: 1984
// author: George Orwell
// year: 1949
```

oder 
```javascript
// Create an Array
const myArray = Object.values(book);

// Stringify the Array
let text = myArray.toString();
```

oder JSON.stringify
```javascript
const myJSON = JSON.stringify(book);
console.log(myJSON); // Output: {"title":"1984","author":"George Orwell","year":1949}
```