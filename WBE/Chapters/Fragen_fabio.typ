
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

== Closures
== Was ist eine Closure?
Eine Closure ist eine Funktion, die Zugriff auf Variablen aus ihrem äußeren (enclosing) Funktionsbereich hat, auch nachdem die äußere Funktion beendet wurde.

```javascript
function outerFunction(outerVariable) {
  return function innerFunction(innerVariable) {
    console.log('Outer Variable: ' + outerVariable);
    console.log('Inner Variable: ' + innerVariable);
  };
}
const newFunction = outerFunction('outside');
newFunction('inside');
// Output:
// Outer Variable: outside
// Inner Variable: inside
```

== call and apply
```javascript
function greet(greeting, punctuation) {
  console.log(greeting + ', ' + this.name + punctuation);
}
const person = { name: 'Alice' };
greet.call(person, 'Hello', '!'); // Output: Hello, Alice!
greet.apply(person, ['Hi', '...']); // Output: Hi, Alice...
```

== bind 
Was macht bind?
- bind erstellt eine neue Funktion, die an ein bestimmtes this gebunden ist.

```javascript
const person = {
  name: 'Bob',
  greet: function() {
    console.log('Hello, ' + this.name);
  }
};
const greetBob = person.greet.bind(person);
greetBob(); // Output: Hello, Bob
```
Was wenn person mehrere functionen als attribute hat?
- jede Funktion kann mit bind an das person Objekt gebunden werden.
 Beispiel
```javascript
const person = {
  name: 'Bob',
  greet: function() {
    console.log('Hello, ' + this.name);
  },
  farewell: function() {
    console.log('Goodbye, ' + this.name);
  }
};
const greetBob = person.greet.bind(person);
const farewellBob = person.farewell.bind(person);
greetBob(); // Output: Hello, Bob
farewellBob(); // Output: Goodbye, Bob
```

= Objekte
== this Keyword
In JavaScript, the this keyword refers to the object that is executing the current function.
```javascript
const person = {
  firstName: "John",
  lastName: "Doe",
  fullName: function() {
    return this.firstName + " " + this.lastName;
  }
};
console.log(person.fullName()); // Output: John Doe
```

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

== Prtotypen setzen
```javascript
const animal = {
  speak: function() {
    console.log(`${this.name} makes a noise.`);
  }
};
function Dog(name) {
  this.name = name;
}
Dog.prototype = animal;
const dog = new Dog('Rex');
dog.speak(); // Output: Rex makes a noise.
```

== in Operator
```javascript
const person = {
  name: 'Alice',
  age: 30
};
console.log('name' in person); // Output: true
console.log('gender' in person); // Output: false
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

== concatinate objects
```javascript
const obj1 = { a: 1, b: 2 };
const obj2 = { b: 3, c: 4 };
const mergedObj = { ...obj1, ...obj2 };
console.log(mergedObj); // Output: { a: 1, b: 3, c: 4 }
```
warum ist b:3?
- weil die Eigenschaften von obj2 die gleichen Eigenschaften von obj1 überschreiben.
- die Reihenfolge der Objekte im Spread-Operator bestimmt, welche Eigenschaften behalten werden.

warum macht man das?
- um mehrere Objekte zu einem einzigen Objekt zu kombinieren.

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

= Iteration
== Difference between for...in and for...of
- for...in iterates over the enumerable properties of an object (keys).
- for...of iterates over the values of an iterable object (like arrays, strings, etc.).
```javascript
const arr = ['a', 'b', 'c'];
for (let index in arr) {
  console.log(index); // Output: 0, 1, 2 (indices)
}
for (let value of arr) {
  console.log(value); // Output: 'a', 'b', 'c' (values)
}
== for...in with Objects
```

```javascript
const obj = { name: 'Alice', age: 30, city: 'New York' };
for (let key in obj) {
  console.log(`${key}: ${obj[key]}`);
}
```

// Output:
// name: Alice
// age: 30
// city: New York

== Iterable 

its an object that can be iterated over (like arrays, strings, maps, sets, etc.)
with for...of loop

```javascript
const myString = "Hello";
for (let char of myString) {
  console.log(char);
} 
// Output:
// H
// e
// l
// l
// o
const myArray = [10, 20, 30];
for (let num of myArray) {
  console.log(num);
}
// Output:
// 10
// 20
// 30
```

== iterator
its an object that defines a sequence and potentially a return value upon its termination.
An iterator is created by calling the Symbol.iterator method on an iterable object.
```javascript
const myArray = [10, 20, 30];
const iterator = myArray[Symbol.iterator]();
console.log(iterator.next()); // Output: { value: 10, done: false }
console.log(iterator.next()); // Output: { value: 20, done: false }
console.log(iterator.next()); // Output: { value: 30, done: false }
console.log(iterator.next()); // Output: { value: undefined, done: true }
```

done indicates whether the iterator has completed its sequence.
When done is true, the value property will typically be undefined, indicating that there are no more values to iterate over.

== Generators
Generators are functions that can be exited and later re-entered.
Their context (variable bindings) will be saved across re-entrances.
Müssen wir das können? Eher nicht.

= Regex

= Data types
Alle Number in JS sind floating point (64 bit double precision)

== how to empty a variable
```javascript
let myVar = 42;
myVar = undefined; // Now myVar is empty 
console.log(myVar); // Output: null
```
or
```javascript
let myVar = 42;
myVar = null; // Now myVar is empty
console.log(myVar); // Output: null
```

== difference between null and undefined
```javascript
typeof undefined      // undefined
typeof null           // object

null === undefined    // false
null == undefined     // true
```

== Constructor Property
```javascript
const str = new String("Hello");
console.log(str.constructor === String); // Output: true
const num = new Number(42);
console.log(num.constructor === Number); // Output: true
const bool = new Boolean(true);
console.log(bool.constructor === Boolean); // Output: true
const arr = new Array(1, 2, 3);
console.log(arr.constructor === Array); // Output: true
const obj = new Object();
console.log(obj.constructor === Object); // Output: true
const func = new Function("x", "y", "return x + y;");
console.log(func.constructor === Function); // Output: true
```

= Events
Examples of events:

- An HTML button is clicked
- A web page has finished loading
- The mouse moves over an element
- A keyboard key is pressed
- An HTML input field is changed

== Event Listener
```javascript
document.getElementById("myButton").addEventListener("click", function() {
  alert("Button was clicked!");
});
```
== Event Object
```javascript
document.getElementById("myButton").addEventListener("click", function(event) {
  console.log("Mouse X: " + event.clientX);
  console.log("Mouse Y: " + event.clientY);
});
```
== Event: Website loaded
```javascript
window.addEventListener("load", function() {
  console.log("Website is fully loaded");
});
```

== Overview of common events
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Event], [Description],
  ),

  `click`,          [An element is clicked],
  `dblclick`,       [An element is double-clicked],
  `mouseover`,      [The mouse pointer moves over an element],
  `mouseout`,       [The mouse pointer moves out of an element],
  `keydown`,        [A keyboard key is pressed down],
  `keyup`,          [A keyboard key is released],
  `load`,           [The whole page has loaded],
  `unload`,         [The page is unloaded],
  `submit`,         [A form is submitted],
  `change`,         [An input field value is changed],
)

== common html events
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Event], [Description],
  ),

  `onclick`,        [An element is clicked],
  `ondblclick`,     [An element is double-clicked],
  `onmouseover`,    [The mouse pointer moves over an element],
  `onmouseout`,     [The mouse pointer moves out of an element],
  `onkeydown`,      [A keyboard key is pressed down],
  `onkeyup`,        [A keyboard key is released],
  `onload`,         [The whole page has loaded],
  `onunload`,       [The page is unloaded],
  `onsubmit`,       [A form is submitted],
  `onchange`,       [An input field value is changed],
)

== DOMContentLoaded event
```javascript
document.addEventListener("DOMContentLoaded", function() {
  console.log("DOM fully loaded and parsed");
}); 
```
Was ist der Unterschied zu load?
- DOMContentLoaded wird ausgelöst, wenn das HTML-Dokument vollständig geladen und geparst wurde, ohne auf Stylesheets, Bilder und Unterrahmen zu warten.
- load wird ausgelöst, wenn die gesamte Seite, einschließlich aller abhängigen Ressourcen wie Stylesheets und Bilder, vollständig geladen ist.

== was ist der DOM
Der Document Object Model (DOM) ist eine Programmierschnittstelle für HTML- und XML-Dokumente.
Es stellt die Seite so dar, dass Programme die Struktur, den Stil und den Inhalt des Dokuments ändern können.
Der DOM repräsentiert das Dokument als eine Baumstruktur, in der jedes Knotenpunkt ein Teil des Dokuments darstellt, wie z.B. ein Element, ein Attribut oder ein Textabschnitt.

== load event an andere objekte binden
```javascript
const img = document.getElementById("myImage");
img.addEventListener("load", function() {
  console.log("Image has been loaded");
});
```

== TimingEvents
setTimeout()	Sets a clock timeout (runs once)
setInterval()	Sets a clock interval (runs repeatedly)
clearTimeout()	Clears a timeout
clearInterval()	Clears an inteval

== Event Management
=== Adding Events
```javascript
element.addEventListener(event, function, useCapture);
```

=== Removing Events
```javascript
element.removeEventListener(event, function, useCapture);
```

= Console. - Methods
== Common Console Methods
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Method], [Description],
  ),

  `console.log()`,        [Outputs a message to the console],
  `console.error()`,      [Outputs an error message to the console],
  `console.warn()`,       [Outputs a warning message to the console],
  `console.info()`,       [Outputs an informational message to the console],
  `console.debug()`,      [Outputs a debug message to the console],
  `console.table()`,      [Displays data as a table in the console],
  `console.clear()`,      [Clears the console],
  `console.time()`,       [Starts a timer with a name],
  `console.timeEnd()`,    [Stops the timer and logs the elapsed time],
)

= Optional chaining
was ist optional chaining?
- Es ist eine Möglichkeit, auf verschachtelte Objekteigenschaften zuzugreifen, ohne dass ein Fehler ausgelöst wird, wenn eine der Eigenschaften nicht existiert.
```javascript
const user = {
  profile: {
    name: "Alice",
    address: {
      city: "Wonderland"
    }
  }
};
const city = user.profile?.address?.city;
console.log(city); // Output: "Wonderland"
const zip = user.profile?.address?.zip;
console.log(zip); // Output: undefined
```

= Eingabe von Konsole verlangen
```javascript
const userName = prompt("Please enter your name:");
console.log("Hello, " + userName + "!");
const userAge = prompt("Please enter your age:");
console.log("You are " + userAge + " years old.");  
```
or with readline (Node.js)
```javascript
const readline = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});
readline.question('Please enter your name: ', name => {
  console.log(`Hello, ${name}!`);
  readline.close();
});
```

= Errors 
== Common JavaScript Errors
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Error Type], [Description],
  ),

  `SyntaxError`,        [Occurs when there is a syntax mistake in the code],
  `ReferenceError`,     [Occurs when a non-existent variable is referenced],
  `TypeError`,          [Occurs when a value is not of the expected type],
  `RangeError`,         [Occurs when a number is outside the allowable range],
  `EvalError`,          [Occurs when the eval() function is used incorrectly],
  `URIError`,           [Occurs when there is an error in URI handling functions],
)

== try...catch
```javascript
try {
  // Code that may throw an error
  let result = riskyOperation();
  console.log("Result: " + result);
} catch (error) {
  // Code to handle the error
  console.error("An error occurred: " + error.message);
} finally {
  // Code that will run regardless of an error occurring
  console.log("Execution completed.");
}
```
finally block is optional but always runs after try and catch blocks.

== Silent Errors
In JavaScript, silent errors occur when an operation fails but does not throw an error or exception.
This can lead to unexpected behavior in the program, as the failure goes unnoticed.
Example of a silent error:
```javascript
let obj = {};
console.log(obj.nonExistentProperty.toString()); // Silent error, will throw TypeError
```

== throw statement
```javascript
function divide(a, b) {
  if (b === 0) {
    throw new Error("Division by zero is not allowed.");
  }
  return a / b;
}
try {
  let result = divide(10, 0);
  console.log("Result: " + result);
} catch (error) {
  console.error("An error occurred: " + error.message);
}
```

== Error Object Properties
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Property], [Description],
  ),

  `name`,        [The name of the error type (e.g., "TypeError")],
  `message`,     [A description of the error],
)

= NPM - Node Package Manager
== Common NPM Commands
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Command], [Description],
  ),

  `npm init`,            [Initializes a new Node.js project and creates a package.json file],
  `npm install <package>`, [Installs a package and adds it to the dependencies in package.json],
  `npm uninstall <package>`, [Removes a package and updates package.json],
  `npm update`,          [Updates all packages to their latest versions based on the version ranges specified in package.json],
  `npm list`,            [Lists all installed packages in the current project],
  `npm start`,           [Runs the start script defined in package.json],
  `npm test`,            [Runs the test script defined in package.json],
)
== what is node.js
- Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.
- It allows developers to run JavaScript code outside of a web browser, enabling server-side scripting and building scalable network applications.
- Node.js uses an event-driven, non-blocking I/O model, making it efficient and suitable for real-time applications.
- It has a rich ecosystem of libraries and modules available through the Node Package Manager (NPM).

= File API 
Speicherzugriffe Aufwändigkeit:
- L1 -> 3 Cycles
- L2 -> 14 Cycles
- RAM -> 250 Cycles
- Disk -> 41,000,000 Cycles
- Network -> 240,000,000 Cycles

== synchrones Lesen einer Datei
```javascript
const fs = require('fs');
const data = fs.readFileSync('example.txt', 'utf8');
console.log(data);
```

== asynchrones Lesen einer Datei
```javascript
const fs = require('fs');
fs.readFile('example.txt', 'utf8', (err, data) => {
  if (err) {
    console.error(err);
    return;
  }
  console.log(data);
});
```
=== Achtung Zeichenkodierung
```javascript
const fs = require('fs');
fs.readFile('example.txt', 'utf8', (err, data) => {
  if (err) {
    console.error(err);
    return;
  }
  console.log(data);
});
```
Wenn keine Kodierung angegeben ist, wird ein Buffer zurückgegeben.

=== was ist dieser Err Block?
- Der Err-Block überprüft, ob beim Lesen der Datei ein Fehler aufgetreten ist.
- Wenn ein Fehler aufgetreten ist, wird der Fehler im Konsolenfenster ausgegeben und die Funktion wird mit return beendet.

=== Was ist ein Callback?
- Ein Callback ist eine Funktion, die als Argument an eine andere Funktion übergeben wird und nach Abschluss einer asynchronen Operation aufgerufen wird.
- Callbacks werden häufig in asynchronen Programmiermustern verwendet, um sicherzustellen, dass bestimmte Codeabschnitte erst ausgeführt werden, wenn eine Operation abgeschlossen ist.

Beispiel:
```javascript
function fetchData(callback) {
  setTimeout(() => {
    const data = "Sample Data";
    callback(data);
  }, 1000);
}
fetchData((data) => {
  console.log("Received data: " + data);
});
```
In diesem Beispiel wird die Funktion fetchData eine Sekunde lang verzögert, bevor sie die Callback-Funktion mit den abgerufenen Daten aufruft.

Woher kommt die callback im obigen Beispiel?
- Die Callback-Funktion wird als Argument an die fetchData-Funktion übergeben.

Wo wird die Callback funktion definiert
- Die Callback-Funktion wird inline als anonyme Funktion definiert, die einen Parameter hat: data.
```javascript
fetchData(
  
  (data) => {
  console.log("Received data: " + data); //Hier wird die Callback-Funktion definiert Aachte auf die Klammern!
}

);
```

=== schreib Lese-Berechtigung (2tes argument)
- Das zweite Argument in den fs-Funktionen (wie readFile und writeFile) ist ein Optionsobjekt, das verschiedene Einstellungen für die Dateioperationen festlegt.
Beispiel:
```javascript
const fs = require('fs');
const options = { encoding: 'utf8', flag: 'r' }; // Lese-Berechtigung
fs.readFile('example.txt', options, (err, data) => {
  if (err) {
    console.error(err);
    return;
  }
  console.log(data);
});
```

Es gibt:
- r: read (lesen)
- w: write (schreiben)
- a: append (anhängen)
- r+: read and write (lesen und schreiben)
- w+: write and read (schreiben und lesen), position at start, file is created if not exists
- a+: append and read (anhängen und lesen), position at end, file is created if not exists

== Datei information abrufen
```javascript
const fs = require('fs');
fs.stat('example.txt', (err, stats) => {
  if (err) {
    console.error(err);
    return;
  }
  console.log(`File Size: ${stats.size} bytes`);
  console.log(`Created At: ${stats.birthtime}`);
  console.log(`Last Modified: ${stats.mtime}`);
});
```
=== was ist stats?
- stats ist ein Objekt, das Informationen über die Datei enthält, die von der fs.stat-Funktion zurückgegeben werden.
Es enthält Eigenschaften wie:
- size: Die Größe der Datei in Bytes
- birthtime: Das Erstellungsdatum der Datei
- mtime: Das Datum der letzten Änderung der Datei
- isFile(): Gibt true zurück, wenn der Pfad eine Datei ist
- isDirectory(): Gibt true zurück, wenn der Pfad ein Verzeichnis ist
- isSymbolicLink(): Gibt true zurück, wenn der Pfad ein symbolischer Link ist
 - symbolischer Link ist eine Datei, die auf eine andere Datei oder ein anderes Verzeichnis verweist.
```javascript
console.log(`File Size: ${stats.size} bytes`); // Größe der Datei in Bytes
console.log(`Created At: ${stats.birthtime}`); // Erstellungsdatum der Datei
console.log(`Last Modified: ${stats.mtime}`); // Datum der letzten Änderung der Datei
```

== Platform unabhängiger Pfad
```javascript
const path = require('path');
const filePath = path.join(__dirname, 'folder', 'file.txt');
console.log(filePath); // Output: platform-specific path to 'folder/file.txt'
```

=== methods of path module
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Method], [Description],
  ),

  `path.join()`,        [Joins multiple path segments into a single path],
  `path.resolve()`,     [Resolves a sequence of paths into an absolute path],
  `path.basename()`,    [Returns the last portion of a path],
  `path.dirname()`,     [Returns the directory name of a path],
  `path.extname()`,     [Returns the file extension of a path],
)


== Datei schreiben
Das Schreiben einer Datei ist asynchron.
```javascript
const fs = require('fs');
const content = 'Hello, World!'; 
fs.writeFile('output.txt', content, 'utf8', (err) => {
  if (err) {
    console.error(err);
    return;
  }
  console.log('File has been written successfully.');
});
```
=== was ist das 3te argument?
- Das dritte Argument in der fs.writeFile-Funktion ist die Zeichenkodierung, die angibt, wie der Inhalt in die Datei geschrieben werden soll.
- In diesem Fall wird 'utf8' verwendet, was bedeutet, dass der Inhalt als UTF-8-kodierter Text geschrieben wird.

=== Datei anhängen
```javascript
const fs = require('fs');
const content = '\nThis is an appended line.';
fs.appendFile('output.txt', content, 'utf8', (err) => {
  if (err) {
    console.error(err);
    return;
  }
  console.log('Content has been appended successfully.');
});
```
= Streams
== wann Streams verwenden?
- Streams sollten verwendet werden, wenn große Datenmengen verarbeitet werden müssen, die nicht vollständig in den Arbeitsspeicher geladen werden können.
- Sie sind besonders nützlich für das Lesen und Schreiben von Dateien, Netzwerkkommunikation und Datenverarbeitung in Echtzeit.

== Was sind Streams?
Streams sind Objekte, die es ermöglichen, Daten schrittweise zu lesen oder zu schreiben, anstatt die gesamte Datenmenge auf einmal zu verarbeiten.
Dies ist besonders nützlich für große Datenmengen, da es den Speicherverbrauch reduziert und die Leistung verbessert.
Streams können in vier Haupttypen unterteilt werden:
- Readable Streams: Ermöglichen das Lesen von Daten (z.B. fs.createReadStream()).
- Writable Streams: Ermöglichen das Schreiben von Daten (z.B. fs.createWriteStream()).
- Duplex Streams: Können sowohl gelesen als auch geschrieben werden (z.B. net.Socket).
- Transform Streams: Verändern die Daten während des Lesens oder Schreibens (z.B. zlib.createGzip()).

== fs-Modul methods
- fs.access()	Checks if a file or directory exists and if it is accessible
- fs.mkdir()	Creates a new directory
- fs.readdir()	Reads the contents of a directory
- fs.rename()	Renames or moves a file or directory
- fs.rmdir()	Removes a directory
- fs.link()	Creates a hard link to a file
- fs.symlink()	Creates a symbolic link to a file or directory
- fs.truncate()	Truncates a file to a specified length
- fs.copyFile()	Copies a file from one location to another
- fs.chmod()	Changes the permissions of a file or directory
- fs.chown()	Changes the owner and group of a file or directory
- fs.watchFile()	Watches for changes to a file
- fs.unwatchFile()	Stops watching for changes to a file

= JSON
== methods to work with JSON
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Method], [Description],
  ),

  `JSON.parse()`,        [Converts a JSON string into a JavaScript object],
  `JSON.stringify()`,     [Converts a JavaScript object into a JSON string],
)
== JSON.parse()
```javascript
const jsonString = '{"name": "Alice", "age": 30, "city": "Wonderland"}';
const jsonObject = JSON.parse(jsonString);
console.log(jsonObject.name); // Output: Alice
console.log(jsonObject.age);  // Output: 30
console.log(jsonObject.city); // Output: Wonderland
```
=== was wen nacht JSON ein Attribut fehlt?
```javascript
const jsonString = '{"name": "Alice", "city": "Wonderland"}';
const jsonObject = JSON.parse(jsonString);
console.log(jsonObject.name); // Output: Alice
console.log(jsonObject.age);  // Output: undefined
console.log(jsonObject.city); // Output: Wonderland
```

== JSON.stringify()
```javascript
const jsonObject = { name: "Bob", age: 25, city: "Builderland" };
const jsonString = JSON.stringify(jsonObject);
console.log(jsonString); // Output: '{"name":"Bob","age":25,"city":"Builderland"}'
```
== reviver function
```javascript
const jsonString = '{"name": "Charlie", "age": "35", "city": "Chocolate Factory"}';
const jsonObject = JSON.parse(jsonString, (key, value) => {
  if (key === 'age') {
    return Number(value); // Convert age to a number
  }
  return value; // Return the value unchanged for other keys
});
console.log(jsonObject.name); // Output: Charlie
console.log(jsonObject.age);  // Output: 35 (as a number)
console.log(jsonObject.city); // Output: Chocolate Factory
```

== JSON syntax
- Data is in name/value pairs
- Data is separated by commas
- Curly braces hold objects
- Square brackets hold arrays
- key must be strings and should be in double quotes

```JSON
{
  "name": "John",
  "age": 31,
  "city": "New York"
}
```

== data types in JSON
- String
- Number
- Object
- Array
- Boolean
- null

== json vs xml example
JSON:
```JSON
{
  "employee": {
    "name": "John Doe",
    "age": 30,
    "department": "Sales"
  }
}
```
XML:
```XML
<employee>
  <name>John Doe</name>
  <age>30</age>
  <department>Sales</department>
</employee>
```

== JSON object vs JavaScript object
- A JSON object is a string representation of data that follows the JSON syntax rules.
- A JavaScript object is a data structure in JavaScript that can hold various data types and has methods and properties.
```javascript
const jsonString = '{"name": "Alice", "age": 30}'; // JSON object (string)
const jsonObject = JSON.parse(jsonString); // Convert JSON string to JavaScript object
console.log(jsonObject.name); // Output: Alice
console.log(jsonObject.age);  // Output: 30
const jsObject = { name: "Bob", age: 25 }; // JavaScript object
console.log(jsObject.name); // Output: Bob
console.log(jsObject.age);  // Output: 25
```

Mit Arrays ist es das gleiche:
```javascript
const jsonString = '["Apple", "Banana", "Cherry"]'; // JSON array (string)
const jsonArray = JSON.parse(jsonString); // Convert JSON string to JavaScript array
console.log(jsonArray[0]); // Output: Apple
console.log(jsonArray[1]); // Output: Banana
console.log(jsonArray[2]); // Output: Cherry
const jsArray = ["Dog", "Cat", "Mouse"]; // JavaScript array
console.log(jsArray[0]); // Output: Dog
console.log(jsArray[1]); // Output: Cat
console.log(jsArray[2]); // Output: Mouse
```

