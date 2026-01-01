
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

= Scope
==block Scope with let and const
```javascript
{
  let x = 10;
  const y = 20;
  console.log(x); // Output: 10
  console.log(y); // Output: 20
}
console.log(x); // Error: x is not defined
console.log(y); // Error: y is not defined
```
var ist nicht block-scoped:

== Automaticly Global
```javascript
function myFunction() {
  z = 10; // z is automatically global
} 
myFunction();
console.log(z); // Output: 10
```
ausser im strict mode:
```javascript
"use strict";
function myFunction() {
  z = 10; // Error: z is not defined
}
myFunction();
console.log(z); // Error: z is not defined
```

Do not use global variables unless you intend to!

== standalone blocks
```javascript
{
  let a = 5;
  const b = 10;
  console.log(a); // Output: 5
  console.log(b); // Output: 10
}
console.log(a); // Error: a is not defined
console.log(b); // Error: b is not defined
```
use for limiting variable scope

== Hoisting
```javascript
console.log(myVar); // Output: undefined
var myVar = 10;
console.log(myVar); // Output: 10
```

was wird gehoisted?
- Deklarationen mit var
- Function Declarations
was wird nicht gehoisted?
- Deklarationen mit let und const
```javascript
console.log(myLet); // Error: myLet is not defined
let myLet = 20;
console.log(myLet); // Output: 20
console.log(myConst); // Error: myConst is not defined
const myConst = 30;
console.log(myConst); // Output: 30
```

Am besten immer oben deklarieren!

== Strict Mode
was ändert sich im strict mode?
- keine automatischen globalen Variablen
- keine Duplikate von Parametern in Funktionen
- Schreibschutz für bestimmte Eigenschaften
- reservierte Wörter können nicht als Variablennamen verwendet werden
- eval und arguments haben spezielle Einschränkungen
- Variablen müssen deklariert werden, bevor sie verwendet werden

= Date
== Create a Date Object
```javascript
const date1 = new Date(); // Current date and time
const date2 = new Date(2024, 5, 15); // June 15, 2024
const date3 = new Date("2024-06-15T10:30:00Z"); // ISO format
console.log(date1);   
console.log(date2);
console.log(date3);
```

= Array
JavaScript does not support associative arrays.
You should use objects when you want the element names to be strings (text).
You should use arrays when you want the element names to be numbers.

== How to Recognize an Array
```javascript
const fruits = ["Apple", "Banana", "Cherry"];
console.log(Array.isArray(fruits)); // Output: true
console.log(fruits instanceof Array); // Output: true
```

== findIndex()
```javascript
const numbers = [10, 20, 30, 40, 50];
const index = numbers.findIndex(function(number) {
  return number > 25;
});

console.log(index); // Output: 2
```
Returns the index of the first element that satisfies the provided testing function. Otherwise, it returns -1, indicating that no element passed the test.

== Array Filter 
```javascript
const numbers = [10, 20, 30, 40, 50];
const filteredNumbers = numbers.filter(function(number) {
  return number > 25;
});
console.log(filteredNumbers); // Output: [30, 40, 50]
```

== Array from()
```javascript
const str = "Hello";
const charsArray = Array.from(str);
console.log(charsArray); // Output: ['H', 'e', 'l', 'l', 'o']
const set = new Set([1, 2, 3]);
const setArray = Array.from(set);
console.log(setArray); // Output: [1, 2, 3]
```

== Array Map
```javascript
const numbers = [1, 2, 3, 4, 5];
const squaredNumbers = numbers.map(function(number) {
  return number * number;
});
console.log(squaredNumbers); // Output: [1, 4, 9, 16, 25]
```

== Entries 
```javascript
const fruits = ["Apple", "Banana", "Cherry"];
const iterator = fruits.entries();
for (let entry of iterator) {
  console.log(entry);
}
// Output:
// [0, 'Apple']
// [1, 'Banana']
// [2, 'Cherry']
```

== Spread
```javascript
const arr1 = [1, 2, 3];
const arr2 = [4, 5, 6];
const combined = [...arr1, ...arr2];
console.log(combined); // Output: [1, 2, 3, 4, 5, 6]
const str = "Hello";
const chars = [...str];
console.log(chars); // Output: ['H', 'e', 'l', 'l', 'o']
```

== const vs let in Arrays
```javascript
const numbers = [1, 2, 3];
numbers.push(4); // Allowed
console.log(numbers); // Output: [1, 2, 3, 4]
let moreNumbers = [5, 6, 7];
moreNumbers = [8, 9, 10]; // Allowed
console.log(moreNumbers); // Output: [8, 9, 10]
```
aber 
```javascript
const numbers = [1, 2, 3];
numbers = [4, 5, 6]; // Error: Assignment to constant variable.
console.log(numbers);
let moreNumbers = [5, 6, 7];
moreNumbers = numbers; // Allowed
console.log(moreNumbers); // Output: [1, 2, 3]
```

Array with var hat keinen block scope

= Set
Ist wie Mengen in der Mathematik

== Weak Set
- Only objects can be stored in a WeakSet.
- WeakSets are not enumerable.
```javascript
const weakSet = new WeakSet();
let obj1 = { name: 'Object 1' };
let obj2 = { name: 'Object 2' };
weakSet.add(obj1);
weakSet.add(obj2);
console.log(weakSet.has(obj1)); // Output: true
obj1 = null; // obj1 can be garbage collected
console.log(weakSet.has(obj1)); // Output: false
console.log(weakSet.has(obj2)); // Output: true
```