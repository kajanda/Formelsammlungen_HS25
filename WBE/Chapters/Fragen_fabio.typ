
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

= class
== Create a Class
```javascript
class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  greet() {
    console.log(`Hello, my name is ${this.name} and I am ${this.age} years old.`);
  }
}
const alice = new Person('Alice', 30);
alice.greet(); // Output: Hello, my name is Alice and I am 30 years old.
```

== Inheritance
```javascript
class Animal {
  constructor(name) {
    this.name = name;
  }

  speak() {
    console.log(`${this.name} makes a noise.`);
  }
}
class Dog extends
  Animal {
    speak() {
      console.log(`${this.name} barks.`);
    }
  }
const dog = new Dog('Rex');
dog.speak(); // Output: Rex barks.
```

=== super Keyword
```javascript
class Animal {
  constructor(name) {
    this.name = name;
  }

  speak() {
    console.log(`${this.name} makes a noise.`);
  }
}
class Dog extends
  Animal {
    constructor(name, breed) {
      super(name); // Call the parent class constructor
      this.breed = breed;
    }

    speak() {
      super.speak(); // Call the parent class method
      console.log(`${this.name} barks.`);
    }
  }F
const dog = new Dog('Rex', 'German Shepherd');
dog.speak();
// Output:
// Rex makes a noise.
// Rex barks.
```

== Static Methods
```javascript
class MathUtil {
  static add(a, b) {
    return a + b;
  }
}
console.log(MathUtil.add(5, 10)); // Output: 15
```

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

== Functon Constructor
```javascript
const sum = new Function('a', 'b', 'return a + b;');
console.log(sum(5, 10)); // Output: 15
```
aber lieber ohne new:
```javascript
const myfunction = function(a, b) {
  return a + b;
};
console.log(myfunction(5, 10)); // Output: 15
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

Was ist hier die Closures
- die innere Funktion innerFunction ist die Closure, da sie Zugriff auf die Variable outerVariable der äußeren Funktion outerFunction hat, auch nachdem outerFunction beendet wurde.


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

== Function höherer Ordnung
Eine Funktion höherer Ordnung ist eine Funktion, die eine andere Funktion als Argument nimmt oder eine Funktion zurückgibt.
```javascript
function higherOrderFunction(callback) {
  return function() {
    console.log('Before callback');
    callback();
    console.log('After callback');
  };
}
const sayHello = function() {
  console.log('Hello!');
};
const wrappedFunction = higherOrderFunction(sayHello);
wrappedFunction();
// Output:
// Before callback
// Hello!
// After callback
```

= Modul Systeme 
Was sind Module?
Module sind wiederverwendbare Code-Einheiten, die Funktionen, Objekte oder Variablen kapseln und exportieren können, um sie in anderen Teilen einer Anwendung zu verwenden.
== ES6 Modules
```javascript
// mathModule.js
export function add(a, b) {
  return a + b;
}
export function subtract(a, b) {
  return a - b;
}
// main.js
import { add, subtract } from './mathModule.js';
console.log(add(5, 3)); // Output: 8
console.log(subtract(5, 3)); // Output: 2
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

=== what does this refer to in different contexts?
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Context], [this refers to],
  ),

  [Global Context],        [the global object (window in browsers)],
  [Object Method],        [the object that owns the method],
  [Constructor Function], [the newly created object],
  [Event Handler],        [the element that received the event],
)

== Konstruktor 
```javascript
function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}
const person1 = new Person("Alice", "Smith");
const person2 = new Person("Bob", "Johnson");
console.log(person1.firstName); // Output: Alice
console.log(person2.lastName);  // Output: Johnson
```

== Reference Data Type
Arrays and Objects are reference data types.
When you assign an array or object to a variable, you are assigning a reference to that array or object, not the actual value.
```javascript
const originalArray = [1, 2, 3];
const referenceArray = originalArray;
referenceArray.push(4);
console.log(originalArray); // Output: [1, 2, 3, 4]
console.log(referenceArray); // Output: [1, 2, 3, 4]
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

== getPrototypeOf
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
console.log(Object.getPrototypeOf(dog) === animal); // Output: true
```

== Prototye chain
```javascript
const grandParent = {
  grandParentMethod: function() {
    console.log("This is a method from the grandparent.");
  }
};
const parent = Object.create(grandParent);
parent.parentMethod = function() {
  console.log("This is a method from the parent.");
};
const child = Object.create(parent);
child.childMethod = function() {
  console.log("This is a method from the child.");
};
child.childMethod();        // Output: This is a method from the child.
child.parentMethod();      // Output: This is a method from the parent.
child.grandParentMethod(); // Output: This is a method from the grandparent.
```

=== Add Properties to Prototypes
```javascript
function Person(name, age) {
  this.name = name;
  this.age = age;
}
Person.prototype.greet = function() {
  console.log(`Hello, my name is ${this.name}`);
};
const alice = new Person('Alice', 30);
alice.greet(); // Output: Hello, my name is Alice
const bob = new Person('Bob', 25);
bob.greet(); // Output: Hello, my name is Bob
```

=== delete prototype property
```javascript
function Person(name, age) {
  this.name = name;
  this.age = age;
}
Person.prototype.greet = function() {
  console.log(`Hello, my name is ${this.name}`);
};
const alice = new Person('Alice', 30);
alice.greet(); // Output: Hello, my name is Alice
delete Person.prototype.greet;
alice.greet(); // Error: alice.greet is not a function
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

= Testing 
== Jasimne framework
Jasmine is a behavior-driven development framework for testing JavaScript code.
It provides a clean and easy-to-read syntax for writing tests, making it simple to understand the behavior of the code being tested.
```javascript
describe("A suite is just a function", function() {
  it("and so is a spec", function() {
    const a = true;
    expect(a).toBe(true);
  });
});
```
== describe block
- The describe block is used to group related tests together.
```javascript
describe("Math operations", function() {
  it("should add two numbers correctly", function() {
    const sum = 2 + 3;
    expect(sum).toBe(5);
  });

  it("should subtract two numbers correctly", function() {
    const difference = 5 - 2;
    expect(difference).toBe(3);
  });
});
```
== it block
- The it block is used to define a single test case.
```javascript
it("should multiply two numbers correctly", function() {
  const product = 4 * 3;
  expect(product).toBe(12);
});
```

== SpyOn 
- SpyOn is used to create a spy for a function, allowing you to track its calls and arguments.
```javascript
const calculator = {
  add: function(a, b) {
    return a + b;
  }
};
spyOn(calculator, 'add');
calculator.add(2, 3);
expect(calculator.add).toHaveBeenCalledWith(2, 3);
```

= Async 
== Patterns
- Callbacks: Functions passed as arguments to other functions, executed after an asynchronous operation completes.
- Promises: Objects representing the eventual completion (or failure) of an asynchronous operation and its resulting value.
- Async/Await: Syntactic sugar built on Promises, allowing asynchronous code to be written in a synchronous style.
- Event Loop: A mechanism that handles asynchronous operations in JavaScript, allowing non-blocking execution.


== Callbacks
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
// Output after 1 second: Received data: Sample Data
// callback is invoked after 1 second with the fetched data
```

== Promise
```javascript
fetch('https://api.example.com/data')
  .then(response => response.json())
  .then(data => {
    console.log(data);
  })
  .catch(error => {
    console.error('Error fetching data:', error);
  });
// first .then: processes the response and converts it to JSON
// second .then: handles the JSON data
// Output: Logs the fetched data or an error message
```

== asynch await 
- modern way to handle asynchronous operations as promises
```javascript
async function fetchData() {
  try {
    const response = await fetch('https://api.example.com/data');
    const data = await response.json();
    console.log(data);
  } catch (error) {
    console.error('Error fetching data:', error);
  }
}
fetchData();
// Output: Logs the fetched data or an error message
```
== Event Loop 
What is invoked in witch order:
#table(
  columns: (auto, auto, 1fr, 1fr),
  inset: 6pt,
  align: (left, left, left, left),

  `#`, [*Queue/Phase*], [*Typische Beispiele*], [*Warum kommt das so?*],

  [1], [Synchronous Call Stack],
  [`console.log(..)`, normaler JS-Code],
  [Läuft sofort, direkt im aktuellen Stack.],

  [2], [Microtasks],
  [`Promise.then(..)`, `await`-Fortsetzung, `queueMicrotask(..)`, `MutationObserver`],
  [Wird ausgeführt, sobald der Stack leer ist — noch bevor Timer/UI-Tasks dran sind.],

  [3], [Tasks / Macrotasks],
  [`setTimeout`, `setInterval`, DOM-Events, Netzwerk/I-O callbacks],
  [Kommt in einer späteren “Runde” des Event Loops.],
)

= Eventloop in Node.js

== priorities, was kommt wann?
#table(
  columns: (auto, auto, 1fr, 1fr),
  inset: 6pt,
  align: (left, left, left, left),

  `#`, [*Queue/Phase*], [*Typische Beispiele*], [*Warum kommt das so?*],

  [1], [Synchronous Call Stack],
  [`console.log(..)`, normaler JS-Code],
  [Läuft sofort, direkt im aktuellen Stack.],

  [2], [Microtasks],
  [`Promise.then(..)`, `await`-Fortsetzung, `process.nextTick(..)`, `queueMicrotask(..)`],
  [Wird ausgeführt, sobald der Stack leer ist — noch bevor Timer/UI-Tasks dran sind.],

  [3], [Timers],
  [`setTimeout`, `setInterval`],
  [Kommt in einer späteren “Runde” des Event Loops.],

  [4], [I/O Callbacks],
  [Netzwerk/I-O callbacks],
  [Wird ausgeführt, wenn I/O-Operationen abgeschlossen sind.],

  [5], [Check Phase],
  [`setImmediate(..)`],
  [Wird ausgeführt, nachdem I/O-Callbacks verarbeitet wurden.],

  [6], [Close Callbacks],
  [`socket.on('close', ..)`],
  [Wird ausgeführt, wenn ein Socket oder Handle geschlossen wird.],
)

=== was kommt zuerst innerhalb der Timers phase?
- Innerhalb der Timers-Phase werden die Timer in der Reihenfolge ihrer Ablaufzeiten ausgeführt.
=== Was kommt zuerst setImmediate oder setTimeout(0)?
- setTimeout(0) kommt zuerst, da es in der Timers-Phase ausgeführt wird, während setImmediate in der Check-Phase ausgeführt wird, die nach der Timers-Phase kommt.

=== warum kommt checkImmedate in der check phase?
- setImmediate wird in der Check-Phase ausgeführt, um sicherzustellen, dass alle I/O-Operationen abgeschlossen sind, bevor die Callback-Funktion ausgeführt wird. Dies ermöglicht eine bessere Kontrolle über die Ausführungsreihenfolge von asynchronen Operationen.


== Was ist es
- The event loop is a fundamental concept in Node.js that allows it to handle asynchronous operations efficiently.
- It is responsible for managing the execution of multiple operations without blocking the main thread, enabling Node.js to perform non-blocking I/O operations.
- The event loop continuously checks the call stack and the callback queue, executing callbacks from the queue when the call stack is empty.
== How it works
- When an asynchronous operation is initiated (like reading a file or making a network request), it is offloaded to the system kernel or a thread pool.
- Once the operation is complete, a callback function is added to the callback queue.
- The event loop checks the call stack, and if it is empty, it takes the first callback from the queue and pushes it onto the call stack for execution.
```javascript
const fs = require('fs');
console.log('Start reading file...');
fs.readFile('example.txt', 'utf8', (err, data) => {
  if (err) {
    console.error(err);
    return;
  }
  console.log('File content:', data);
});
console.log('End of script.');
```
In this example, the file reading operation is asynchronous. The event loop allows the script to continue executing while the file is being read, and once the reading is complete, the callback is executed to log the file content.
 
== Code example where all phases are visible
```javascript
console.log('Start');

setTimeout(() => {
  console.log('Timeout callback');
}, 0);

Promise.resolve().then(() => {
  console.log('Promise callback');
});

console.log('End');
```

Output:
```text
Start
End
Promise callback
Timeout callback
```

Why is promis callback before timeout callback?
- In the event loop, microtasks (like Promises) have a higher priority than macrotasks (like setTimeout).

why this order?
- The event loop first executes all microtasks in the microtask queue before moving on to the next macrotask in the macrotask queue.


== promises and await
- Promises are a way to handle asynchronous operations in JavaScript.
- They represent a value that may be available now, in the future, or never.

```javascript
const myPromise = new Promise((resolve, reject) => {
  const success = true; // Simulate success or failure
  if (success) {
    resolve("Promise resolved successfully!");
  } else {
    reject("Promise rejected.");
  }
});
myPromise
  .then((message) => {
    console.log(message); // Output: Promise resolved successfully!
  })
  .catch((error) => {
    console.error(error);
  });
```


== await  
- The await keyword is used to wait for a Promise to resolve or reject.
- It blocks the execution of the async function until the Promise is settled.

== Do async function automatically return a promise?
- Yes, an async function always returns a Promise.
```javascript
async function fetchData() {
  return "Data fetched successfully!";
}
fetchData().then((message) => {
  console.log(message); // Output: Data fetched successfully!
});
```
and now with await
```javascript
async function fetchData() {
  const data = await Promise.resolve("Data fetched successfully!");
  console.log(data); // Output: Data fetched successfully!
}
fetchData();
```

and now with external await 
```javascript
async function fetchData() {
  return "Data fetched successfully!";
}
async function main() {
  const message = await fetchData();
  console.log(message); // Output: Data fetched successfully!
}
main();
```

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


#table(
  columns: (auto, auto, 1fr, 1fr),
  inset: 6pt,
  align: (left, left, left, left),

  `#`, [*Queue/Phase*], [*Typische Beispiele*], [*Warum kommt das so?*],

  [1], [Synchronous Call Stack],
  [`console.log(..)`, normaler JS-Code],
  [Läuft sofort, direkt im aktuellen Stack.],

  [2], [Microtasks],
  [`Promise.then(..)`, `await`-Fortsetzung, `queueMicrotask(..)`, `MutationObserver`],
  [Wird ausgeführt, sobald der Stack leer ist — noch bevor Timer/UI-Tasks dran sind.],

  [3], [Tasks / Macrotasks],
  [`setTimeout`, `setInterval`, DOM-Events, Netzwerk/I-O callbacks],
  [Kommt in einer späteren “Runde” des Event Loops.],
)

#heading(level: 2)[Node.js (Prioritäten)]

#table(
  columns: (auto, auto, 1fr, 1fr),
  inset: 6pt,
  align: (left, left, left, left),

  `#`, [*Queue/Phase*], [*Typische Beispiele*], [*Warum kommt das so?*],

  [1], [Synchronous Call Stack],
  [normaler JS-Code],
  [Läuft sofort.],

  [2], [`process.nextTick` queue (Node-only)],
  [`process.nextTick(..)`],
  [Historische/semantische Node-Regel: extrem hohe Priorität (vor Promise-Microtasks).],

  [3], [Microtasks],
  [`Promise.then(..)`, `await`-Fortsetzung, `queueMicrotask(..)`],
  [Promise-Ketten sollen direkt “danach” weiterlaufen, bevor Timer/I-O/andere Phasen starten.],

  [4], [Event-Loop-Phasen (Callbacks/Macrotasks)],
  [`setTimeout` (timers), I/O (poll), `setImmediate` (check), …],
  [Diese werden phasenweise abgearbeitet; zwischen Callbacks werden wieder `nextTick` + Microtasks geleert.],
)

#heading(level: 3)[Node.js: typische Reihenfolge der *Phasen* (libuv)]

#table(
  columns: (auto, auto, 1fr),
  inset: 6pt,
  align: (left, left, left),

  [*Phase*], [*Name*], [*Typische Beispiele*],

  [1], [timers], [`setTimeout`, `setInterval` (wenn fällig)],
  [2], [pending callbacks], [manche systemnahen I/O callbacks],
  [3], [idle/prepare], [intern],
  [4], [poll], [I/O callbacks (z.B. `fs`, sockets) + warten auf I/O],
  [5], [check], [`setImmediate(..)`],
  [6], [close callbacks], [z.B. `socket.on("close", ...)`],
)

#text[
*Merksatz Node.js:* Nach *jedem* einzelnen Callback (egal aus welcher Phase) leert Node zuerst
`process.nextTick` und dann die Promise-Microtasks. Dadurch erscheinen Promises oft “direkt nach”
einem Timer-/I-O-Callback.
]

== process.nextTick
Ist dazue da nach callstack aber vor den microtasks ausgeführt zu werden.
Wird hauptsächlich in Node.js verwendet, um sicherzustellen, dass eine Funktion
so schnell wie möglich nach dem aktuellen Ausführungskontext ausgeführt wird, aber sollte nicht übermäßig verwendet werden, da es die Event-Loop-Phasen verzögern kann.

== async/await vs Promises
- Both async/await and Promises are used to handle asynchronous operations in JavaScript.
- Promises provide a way to chain asynchronous operations using .then() and .catch() methods
```javascript
fetchData()
  .then((data) => {
    console.log(data);
  })
  .catch((error) => {
    console.error(error);
  });
```
- Async/await provides a more readable and synchronous-like syntax for handling Promises.
```javascript
async function getData() {
  try {
    const data = await fetchData();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}
getData();
```

await ist eigentlich das gleiche wie then, nur schöner zu lesen.


= js - Server 
== Was ist http 
- HTTP (Hypertext Transfer Protocol) is a protocol used for transmitting data over the web.
- It defines how messages are formatted and transmitted, and how web servers and browsers should respond to various commands.
- HTTP is a request-response protocol, where a client (usually a web browser) sends a request to a server, and the server responds with the requested resource or an error message.

== Was ist https
- HTTPS (Hypertext Transfer Protocol Secure) is an extension of HTTP that adds a layer of security to the communication between a client and a server.
- It uses SSL/TLS (Secure Sockets Layer/Transport Layer Security) protocols to encrypt the data being transmitted, ensuring that it cannot be intercepted or tampered with by third parties.
- HTTPS is commonly used for secure online transactions, such as online banking and e-commerce.

== Http methods
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Method], [Description],
  ),

  `GET`,        [Requests data from a specified resource],
  `POST`,       [Submits data to be processed to a specified resource],
  `PUT`,        [Updates a current resource with new data],
  `DELETE`,     [Deletes a specified resource],
  `HEAD`,       [Same as GET but returns only the headers],
  `OPTIONS`,    [Returns the HTTP methods that the server supports for a specified resource],
  `PATCH`,      [Partially updates a resource],
)

was ist alles im http header?
- The HTTP header contains metadata about the request or response, such as content type, content length, server information, caching directives, and more.
Beispiel für einen HTTP-Request-Header:
```http
GET /index.html HTTP/1.1
Host: www.example.com
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64;rv:89.0) Gecko/20100101 Firefox/89.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
```

== Aufbau GET Request
```http
GET /path/resource HTTP/1.1
Host: www.example.com
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64;rv:89.0) Gecko/20100101 Firefox/89.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
```

Was ist der host?
- The Host header specifies the domain name of the server (for virtual hosting) and the TCP port number on which the server is listening.

== Response Codes

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  align: (left, left),
  table.header([*Klasse*], [*Bedeutung*]),

  [`1XX`], [Information (z.B. 101 Switching Protocols)],
  [`2XX`], [Erfolg (z.B. 200 Ok, 204 No Content)],
  [`3XX`], [Weiterleitung (z.B. 301 Moved Permanently)],
  [`4XX`], [Fehler in Anfrage (z.B. 403 Forbidden, 404 Not Found)],
  [`5XX`], [Server-Fehler (z.B. 501 Not Implemented)],
)

Was ist 300 Redirect?
- A 300 Redirect is an HTTP status code that indicates that the requested resource has multiple representations, and the client should choose one of them.
- It is used when a resource can be accessed in different ways, such as different formats or languages.

Und wie wählt ich das aus wie funktioniert das?
- The client can choose the desired representation by using the Accept header in the HTTP request.

Zeig mir eine 300 Redirect Antwort
```http
HTTP/1.1 300 Multiple Choices
Content-Type: text/html
<html>
<head><title>Multiple Choices</title></head>
<body>
<h1>Multiple Choices</h1>
<p>The requested resource has multiple representations. Please choose one of the following:</p>
<ul>
  <li><a href="/resource.html">HTML Version</a></li>
  <li><a href="/resource.json">JSON Version</a></li>
  <li><a href="/resource.xml">XML Version</a></li>
</ul>
</body>
</html>
```

and how to handle it on client side?
```javascript
fetch('https://example.com/resource')
  .then(response => {
    if (response.status === 300) {
      // Handle multiple choices
      console.log('Multiple choices available. Please select one.');
      // You can parse the response body to get the available options
    } else if (response.ok) {
      return response.json(); // or response.text() based on expected format
    } else {
      throw new Error('Network response was not ok.');
    }
  })
  .then(data => {
    console.log(data);
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });

```

== http request in js
```javascript
const https = require('https');
https.get('https://api.example.com/data', (resp) => {
  let data = '';

  // A chunk of data has been received.
  resp.on('data', (chunk) => {
    data += chunk;
  });

  // The whole response has been received. Print out the result.
  resp.on('end', () => {
    console.log(JSON.parse(data));
  });

}).on("error", (err) => {
  console.log("Error: " + err.message);
});
```

== how to start node http server
```javascript
const http = require('http');
const hostname = 'localhost';
const port = 3000;
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello, World!\n');
});
server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
```

== in welchem Format bekomme ich Antwort Daten von einem http request?
- The response data from an HTTP request can be in various formats, including:
- JSON (JavaScript Object Notation)
- XML (eXtensible Markup Language)
- HTML (Hypertext Markup Language)
- Plain Text
- Binary Data (e.g., images, files)

= REST API
- REST (Representational State Transfer) is an architectural style for designing networked applications.
- It uses a stateless communication protocol, typically HTTP, and relies on standard HTTP methods (GET, POST, PUT, DELETE) to perform operations on resources.
- RESTful APIs are designed to be simple, scalable, and easy to use, making them a popular choice for building web services.

== REST vs HTTP
- REST is an architectural style for designing APIs, while HTTP is a protocol used for communication between clients and servers.
- RESTful APIs use HTTP methods to perform operations on resources, but REST is not limited to HTTP and can be implemented using other protocols as well.


= FTP 
== get File from FTP server via console
```bash
ftp ftp.example.com
Username: your_username
Password: your_password
ftp> get remote_filename local_filename
ftp> bye
```

== get File from FTP server via js
```javascript
const ftp = require("basic-ftp");

async function downloadFile() {
  const client = new ftp.Client();
  client.ftp.verbose = true;
  try {
    await client.access({
      host: "ftp.example.com",
      user: "your_username",
      password: "your_password",
      secure: false
    });
    console.log("Connected to FTP server");
    await client.downloadTo("local_filename", "remote_filename");
    console.log("File downloaded successfully");
  } catch (err) {
    console.error(err);
  }
  client.close();
}
downloadFile();
```
= Express js
== what is express js
- Express.js is a minimal and flexible Node.js web application framework that provides a robust set of features for building web and mobile applications.

== create a simple express server
```javascript
const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello, World!');
});
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
```

what datatype is res?
- The `res` parameter in the Express.js route handler is an instance of the `http.ServerResponse` class from the Node.js HTTP module. It represents the HTTP response that will be sent to the client.

Witch format does the client received?
- The format of the response sent to the client depends on how the response is constructed in the route handler. In the example provided, `res.send('Hello, World!');` sends a plain text response. However, Express.js allows you to send responses in various formats, such as JSON, HTML, or files, by using different methods like `res.json()`, `res.sendFile()`, etc.

== Was sind statische Daten
- Statische Daten sind Dateien, die unverändert vom Server an den Client gesendet werden, wie HTML-Dateien, CSS-Dateien, JavaScript-Dateien, Bilder und andere Medien.
- In Express.js können statische Dateien mit dem `express.static` Middleware bereitgestellt werden.

Was wird normalerweise vom server verändert wenn es nicht statisch ist?
- Dynamische Daten werden vom Server generiert oder verändert, basierend auf der Anfrage des Clients oder anderen Faktoren wie Benutzereingaben, Datenbankabfragen oder Anwendungslogik.

Ein Beispiel für statische Daten in Express.js:
```javascript
const express = require('express');
const path = require('path');
const app = express();
const port = 3000;
app.use(express.static(path.join(__dirname, 'public')));
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
```
Beispiel  für dynamische Daten in Express.js:
```javascript
const express = require('express');
const app = express();
const port = 3000;
app.get('/user/:id', (req, res) => {
  const userId = req.params.id;
  // Simulate fetching user data from a database
  const userData = { id: userId, name: "User " + userId };
  res.json(userData);
});
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
```

== Middleware in express js
- Middleware functions in Express.js are functions that have access to the request object (`req`), the response object (`res`), and the next middleware function in the application's request-response cycle.
- Middleware can perform tasks such as executing code, modifying the request and response objects, ending the request-response cycle, or calling the next middleware function.
```javascript
const express = require('express');
const app = express();
const port = 3000;
// Middleware function to log request details
app.use((req, res, next) => {
  console.log(`${req.method} ${req.url}`);
  next(); // Call the next middleware function
});
app.get('/', (req, res) => {
  res.send('Hello, World!');
});
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
```

=== what is next() in express js
- The `next()` function in Express.js is a callback function that is used to pass control to the next middleware function in the stack.
- When `next()` is called, Express will move on to the next middleware function that matches the current request.
```javascript
app.use((req, res, next) => {
  console.log('First middleware');
  next(); // Pass control to the next middleware
});
app.use((req, res, next) => {
  console.log('Second middleware');
  res.send('Response from second middleware');
});
```

== Server mit npm starten
- To start a server with npm, you typically define a start script in your `package.json
file and then run it using the npm command.
1. Define a start script in `package.json`:

`
```json
{
  "name": "my-express-app",
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {
    "start": "node index.js"
  },
  "dependencies": {
    "express": "^4.17.1"
  }
}
```
2. Start the server using npm:
```bash
npm start
```
This command will execute the script defined in the "start" field of your `package.json`, which in this case runs `node index.js` to start your Express.js server.
Make sure to replace `index.js` with the actual entry point of your application if it's different.

= Node.js overview
- Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.
- It allows developers to run JavaScript code outside of a web browser, enabling server-side scripting and the development of scalable network applications.
- Node.js uses an event-driven, non-blocking I/O model, making it efficient and suitable for building real-time applications.
- It has a rich ecosystem of libraries and frameworks available through npm (Node Package Manager), making it easy to build and deploy applications.

== Was für Objecte in node.js und was nur im browser
#table
(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Object], [Environment],
  ),

  `process`,        [Node.js],
  `Buffer`,        [Node.js],
  `global`,        [Node.js],
  `console`,       [Both],
  `setTimeout`,    [Both],
  `setInterval`,   [Both],
  `Object`,        [Both],
  `Array`,         [Both],
  `String`,        [Both],
  `Date`,          [Both],
  `Function`,      [Both],

  `document`,      [Browser],
  `window`,        [Browser],
  `navigator`,     [Browser],
)

= DOM
Why do we usually do not manipulate the DOM directly with vanilla JS in bigger projects?
- Directly manipulating the DOM with vanilla JavaScript can lead to code that is hard to maintain and scale, especially in larger projects.
- It can result in performance issues due to frequent DOM updates, which can be slow and inefficient
- Using frameworks or libraries (like React, Angular, or Vue) provides a more structured approach to managing the DOM, allowing for better organization of code, reusable components, and improved performance through virtual DOM implementations.

== navigation im DOM
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Property/Method], [Description],
  ),

  `document.getElementById()`,        [Finds an element by its ID],
  `document.getElementsByClassName()`,     [Finds elements by their class name],
  `document.getElementsByTagName()`,    [Finds elements by their tag name],
  `document.querySelector()`,     [Finds the first element that matches a CSS selector],
  `document.querySelectorAll()`,  [Finds all elements that match a CSS selector],
  `element.parentNode`,           [Gets the parent node of an element],
  `element.childNodes`,           [Gets all child nodes of an element],
  `element.firstChild`,           [Gets the first child node of an element],
  `element.lastChild`,            [Gets the last child node of an element],
  `element.nextSibling`,          [Gets the next sibling node of an element],
  `element.previousSibling`,      [Gets the previous sibling node of an element],
)

== innerHTML
- The `innerHTML` property of an HTML element allows you to get or set the HTML content inside that element.
```javascript
const element = document.getElementById('myElement');
// Get the HTML content
const htmlContent = element.innerHTML;
// Set the HTML content
element.innerHTML = '<p>New HTML content</p>';
```

== ELemente im DOM finden 
```javascript
const elementById = document.getElementById('myId');
const elementsByClassName = document.getElementsByClassName('myClass');
const elementsByTagName = document.getElementsByTagName('div');
const firstElementByQuery = document.querySelector('.myClass');
const allElementsByQuery = document.querySelectorAll('.myClass');
```

== Elemente im DOM verändern
```javascript
const element = document.getElementById('myId');
// Change text content
element.textContent = 'New Text Content';
// Change HTML content
element.innerHTML = '<span>New HTML Content</span>';
// other to add span
const span = document.createElement('span');
span.textContent = 'New HTML Content';
element.innerHTML = '';
element.appendChild(span);

// Change styles
element.style.color = 'blue';
element.style.fontSize = '20px';
// Add a class
element.classList.add('newClass');
// Remove a class
element.classList.remove('oldClass');
// Toggle a class
element.classList.toggle('toggleClass');
// Set an attribute
element.setAttribute('data-custom', 'value');
// Remove an attribute
element.removeAttribute('data-old');


```
== Elemente verschieben
```javascript
const parentElement = document.getElementById('parent');
const childElement = document.getElementById('child');
// Append child to parent
parentElement.appendChild(childElement);
// Insert child before another element
const referenceElement = document.getElementById('reference');
parentElement.insertBefore(childElement, referenceElement);
// Remove child from parent
parentElement.removeChild(childElement);
// Replace child with another element
const newElement = document.createElement('div');
parentElement.replaceChild(newElement, childElement);
```
== Unterschied zwischen TextNode und Element Node
- TextNode represents the text content within an element, while an Element Node represents an HTML element itself.
- Element Nodes can contain attributes and other child nodes, while TextNodes only contain text.

=== cerate TextNode and element node
```javascript
const textNode = document.createTextNode('This is a text node');
const elementNode = document.createElement('div');
elementNode.textContent = 'This is an element node';
document.body.appendChild(textNode);
document.body.appendChild(elementNode);
```

== Events im DOM
=== Events registrieren
```javascript
const button = document.getElementById('myButton');
button.addEventListener('click', () => {
  console.log('Button clicked!');
});
```
=== Events entfernen
```javascript
const button = document.getElementById('myButton');
const handleClick = () => {
  console.log('Button clicked!');
};
button.addEventListener('click', handleClick);
// To remove the event listener
button.removeEventListener('click', handleClick);
```

== Event Types
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Event Type], [Description],
  ),

  `click`,        [Triggered when an element is clicked],
  `mouseover`,    [Triggered when the mouse pointer is moved over an element],
  `mouseout`,     [Triggered when the mouse pointer is moved out of an element],
  `keydown`,      [Triggered when a key is pressed down],
  `keyup`,        [Triggered when a key is released],
  `submit`,       [Triggered when a form is submitted],
  `load`,         [Triggered when a resource has finished loading],
  `resize`,       [Triggered when the window is resized],
  `focus`,        [Triggered when an element gains focus],
  `blur`,         [Triggered when an element loses focus],
  `scroll`,       [Triggered when an element is scrolled]
)

= JQuery
== Was ist JQuery
- jQuery is a fast, small, and feature-rich JavaScript library.
- It simplifies tasks like HTML document traversal and manipulation, event handling, and animation.

== How to include JQuery in your project
```html
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script
```
and in the code
```javascript
$(document).ready(function() {
  // Your code here
});
```

== Standart Syntax
```javascript
$(selector).action();
```
== CSS Selectors in JQuery
```javascript
const elementById = $('#myId');
const elementsByClass = $('.myClass');
const elementsByTag = $('div');
const firstElementByQuery = $('.myClass').first();
const allElementsByQuery = $('.myClass');
```


= Canvas
== Was ist Canvas
- The HTML5 `<canvas>` element is used to draw graphics on a web page using JavaScript.
- It provides a drawable region defined in HTML code with height and width attributes.
== Create a simple canvas
```html
<canvas id="myCanvas" width="500" height="400" style="border:1px solid #000000;">
Your browser does not support the HTML5 canvas tag.</canvas>
```
== Draw a rectangle on canvas
```javascript
const canvas = document.getElementById('myCanvas');
const ctx = canvas.getContext('2d');
ctx.fillStyle = '#FF0000'; // Set fill color to red
ctx.fillRect(20, 20, 150, 100); // Draw a rectangle
```

= Web storage
== Was ist Web storage
- Web storage is a way to store data on the client side within the user's web browser.
- It provides two main mechanisms: localStorage and sessionStorage.
- localStarage stores data with no expiration date, while sessionStorage stores data for the duration of the page session.
- If you close the tab, sessionStorage data is lost.
- If you close the browser, localStorage data persists.

== where is the data stored?
- The data is stored in the web browser's storage area, which is specific to the domain of the website.

== localStorage vs sessionStorage
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Storage Type], [Description],
  ),

  `localStorage`,        [Stores data with no expiration date. Data persists even after the browser is closed and reopened.],
  `sessionStorage`,      [Stores data for the duration of the page session. Data is lost when the browser tab is closed.],
)

== webstage vs local storage
- Difference between web storage and local storage is that web storage is a general term that encompasses both localStorage 
and sessionStorage, while localStorage specifically refers to the storage mechanism that persists data indefinitely.

#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Feature], [Description],
  ),

  `Capacity`,        [Both localStorage and sessionStorage can store up to 5-10 MB of data, depending on the browser.],
  `Scope`,          [localStorage is shared across all tabs and windows for the same origin, while sessionStorage is unique to each tab/window.],
  `Expiration`,     [localStorage data persists indefinitely until explicitly deleted, while sessionStorage data is cleared when the tab/window is closed.],
)

= Formulare
== in html
```html
<form id="myForm">
  <label for="name">Name:</label>
  <input type="text" id="name" name="name" required>
  <br>
  <label for="email">Email:</label>
  <input type="email" id="email" name="email" required>
  <br>
  <input type="submit" value="Submit">
</form>
```

== in js
```javascript
const form = document.getElementById('myForm');
form.addEventListener('submit', (event) => {
  event.preventDefault(); // Prevent the default form submission behavior
  const name = document.getElementById('name').value;
  const email = document.getElementById('email').value;
  console.log(`Name: ${name}, Email: ${email}`);
  // You can add further processing here, such as sending the data to a server
});
```

== Get and Post methods
```html
<form id="myForm" method="POST" action="/submit">
  <label for="name">Name:</label>
  <input type="text" id="name" name="name" required>
  <br>
  <label for="email">Email:</label>
  <input type="email" id="email" name="email" required>
  <br>
  <input type="submit" value="Submit">
</form>
```

- The `method` attribute specifies the HTTP method to be used when submitting the form.
- The `action` attribute specifies the URL where the form data should be sent.
```javascript
const form = document.getElementById('myForm');
form.addEventListener('submit', (event) => {
  event.preventDefault(); // Prevent the default form submission behavior
  const formData = new FormData(form);
  fetch('/submit', {
    method: 'POST',
    body: formData
  })
  .then(response => response.json())
  .then(data => {
    console.log('Success:', data);
  })
  .catch((error) => {
    console.error('Error:', error);
  });
});
```

== Formularelemente
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Element], [Description],
  ),

  `<input>`,        [Used to create various types of input fields, such as text, password, checkbox, radio, etc.],
  `<textarea>`,     [Used to create a multi-line text input field.],
  `<select>`,       [Used to create a drop-down list of options.],
  `<option>`,       [Used within a `<select>` element to define individual options.],
  `<button>`,       [Used to create clickable buttons.],
  `<label>`,        [Used to define labels for form elements, improving accessibility.],
  `<fieldset>`,     [Used to group related form elements together.],
  `<legend>`,       [Used to provide a caption for a `<fieldset>` element.],
  `<checkbox>`,     [A type of `<input>` element that allows users to select one or more options from a set.],
  `<radio>`,        [A type of `<input>` element that allows users to select only one option from a set.],
)

== fieldset
```html
<form>
  <fieldset>
    <legend>Personal Information</legend>
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required>
    <br>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>
  </fieldset>
  <fieldset>
    <legend>Preferences</legend>
    <label for="subscribe">Subscribe to newsletter:</label>
    <input type="checkbox" id="subscribe" name="subscribe">
    <br>
    <label for="gender">Gender:</label>
    <input type="radio" id="male" name="gender" value="male"> Male
    <input type="radio" id="female" name="gender" value="female"> Female
    <input type="radio" id="other" name="gender" value="other"> Other  
  </fieldset>
  <input type="submit" value="Submit">  
</form>
```

=== Nur ein fieldset auslesen
```javascript
const fieldset = document.querySelector('fieldset');
const inputs = fieldset.querySelectorAll('input, textarea, select');
inputs.forEach(input => {
  console.log(`${input.name}: ${input.value}`);
});
```

== Typen von input feldern
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Input Type], [Description],
  ),

  `text`,        [Single-line text input field],
  `password`,    [Password input field that masks the entered characters],
  `email`,       [Input field for email addresses with validation],
  `number`,      [Input field for numeric values with up/down arrows],
  `checkbox`,    [Checkbox input for selecting multiple options],
  `radio`,       [Radio button input for selecting a single option from a group],
  `submit`,      [Button to submit the form],
  `reset`,       [Button to reset the form fields to their default values],
  `file`,        [Input field for file uploads],
  `date`,        [Input field for selecting a date],
  `color`,       [Input field for selecting a color],
)

== Formular events
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Event], [Description],
  ),

  `submit`,        [Triggered when a form is submitted],
  `reset`,        [Triggered when a form is reset],
  `input`,        [Triggered when the value of an input field changes],
  `change`,       [Triggered when the value of an input field loses focus after being changed],
  `focus`,        [Triggered when an input field gains focus],
  `blur`,         [Triggered when an input field loses focus],
)

== eneable and disable buttons
```javascript
const submitButton = document.getElementById('submitBtn');
submitButton.disabled = true; // Disable the button
submitButton.disabled = false; // Enable the button
```

== File upload input
```html
<form id="uploadForm">
  <label for="fileInput">Choose a file:</label>
  <input type="file" id="fileInput" name="fileInput" required>
  <input type="submit" value="Upload">
</form>
```javascript

=== File reader after upload
```javascript
const input = document.querySelector('#fileInput');
input.addEventListener('change', () => {
  for (const file of Array.from(input.files)) {
    const reader = new FileReader();
    reader.addEventListener('load', () => {
      console.log('File', file.name, 'starts with', reader.result.slice(0, 20));
    });
    reader.readAsText(file);
  }
});
```

== GET vs POST in forms
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Method], [Description],
  ),

  `GET`,        [Sends form data as URL parameters. Suitable for non-sensitive data and when bookmarking or sharing URLs is desired. Limited in length.],
  `POST`,       [Sends form data in the request body. Suitable for sensitive data and larger amounts of data. Not visible in the URL.],
)


= session
== Was ist eine Session
- A session is a way to store information (in variables) to be used across multiple pages.
- Sessions are used to maintain state and user data between different requests made by the same user.
- Sessions are typically implemented using cookies to store a unique session identifier on the client side, which is then used to retrieve session data stored on the server side.
- Sessions are commonly used for user authentication, shopping carts, and other scenarios where user-specific data needs to be preserved across multiple interactions with a web application.
== Wie funktioniert eine Session
- When a user visits a website, the server creates a unique session ID and sends it to the user's browser as a cookie.
- The server also creates a session object on the server side to store user-specific data associated with that session ID.
- On subsequent requests, the browser sends the session ID cookie back to the server, allowing the server to retrieve the corresponding session data.
- The server can then use this session data to personalize the user's experience, maintain login status,
and manage other user-specific information.
- Sessions typically expire after a certain period of inactivity or when the user logs out, at which point the session data is deleted from the server.

== Session vs Cookies
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Feature], [Description],
  ),

  `Storage Location`,        [Sessions store data on the server side, while cookies store data on the client side (browser).],
  `Data Size`,               [Sessions can store larger amounts of data since they are stored on the server, while cookies have size limitations (typically around 4KB).],
  `Security`,                [Sessions are generally more secure since sensitive data is stored on the server, while cookies can be accessed and manipulated by the client.],
  `Expiration`,              [Sessions typically expire after a period of inactivity or when the user logs out, while cookies can have specific expiration dates set by the server.],
)

= Ajax
== Was ist Ajax
- AJAX (Asynchronous JavaScript and XML) is a technique used in web development to create asynchronous web applications.
- It allows web pages to be updated asynchronously by exchanging small amounts of data with the server behind the scenes.
- This means that parts of a web page can be updated without requiring a full page reload, resulting in a more dynamic and responsive user experience.
== Ajax in js
```javascript
const xhr = new XMLHttpRequest();
xhr.open('GET', 'https://api.example.com/data', true);
xhr.onreadystatechange = function() {
  if (xhr.readyState === 4 && xhr.status === 200) {
    const data = JSON.parse(xhr.responseText);
    console.log(data);
  }
};
xhr.send();
```

= Fetch API
== Was ist Fetch API
- The Fetch API is a modern JavaScript API that provides a simple and flexible way to make network requests.
- It is built on Promises, allowing for easier handling of asynchronous operations compared to the older XMLHttpRequest.
== Fetch API in js
```javascript
fetch('https://api.example.com/data')
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok ' + response.statusText);
    }
    return response.json();
  })
  .then(data => {
    console.log(data);
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });
```

= JSX
== Was ist JSX
- JSX (JavaScript XML) is a syntax extension for JavaScript that allows you to write HTML-like code within JavaScript.
- It is commonly used with React to describe the structure of the user interface in a declarative
manner.
== JSX Beispiel
```jsx
const element = <h1>Hello, world!</h1>;
ReactDOM.render(element, document.getElementById('root'));
```
== Transpiler 
- JSX is not valid JavaScript, so it needs to be transpiled (converted) into regular JavaScript before it can be executed by the browser.
- Tools like Babel are commonly used to transpile JSX into JavaScript.
```javascript
const element = React.createElement('h1', null, 'Hello, world!');
ReactDOM.render(element, document.getElementById('root'));
```

== SJDON
Ist in Folie 37


= TypeScript
== Was ist TypeScript
- TypeScript is a superset of JavaScript that adds static typing and other features to the language.
- It is designed to help developers catch errors early in the development process and improve code maintainability.
- TypeScript code is transpiled into plain JavaScript, which can then be executed in any JavaScript environment.
== TypeScript Beispiel
```typescript
function greet(name: string): string {
  return `Hello, ${name}!`;
}
console.log(greet('World'));
```

== Difference between TypeScript and JavaScript
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [Feature], [Description],
  ),

  `Static Typing`,        [TypeScript introduces static typing, allowing developers to define types for variables, function parameters, and return values. JavaScript is dynamically typed.],
  `Type Inference`,       [TypeScript can infer types based on the assigned values, providing type safety without explicit type annotations. JavaScript does not have this feature.],
  `Compile-Time Checking`,[TypeScript performs type checking at compile time, catching errors before the code is executed. JavaScript checks types at runtime.],
  `Advanced Features`,    [TypeScript includes features like interfaces, enums, generics, and decorators that are not available in JavaScript.],
  `Tooling Support`,      [TypeScript has strong tooling support with features like autocompletion, refactoring, and code navigation in IDEs. JavaScript tooling is less robust in comparison.],
)

== How to compile TypeScript to JavaScript
- To compile TypeScript to JavaScript, you need to have Node.js and npm installed on your machine.
1. Install TypeScript globally using npm:
```bash
npm install -g typescript
```
2. Create a TypeScript file (e.g., `app.ts`) with your TypeScript code.
3. Compile the TypeScript file to JavaScript using the TypeScript compiler (`tsc`):
```bash
tsc app.ts
```
This will generate a JavaScript file (e.g., `app.js`) in the same directory.
4. You can then run the generated JavaScript file using Node.js:
```bash
node app.js
```
== Type Annotations in TypeScript
```typescript
let isDone: boolean = false;
let age: number = 25;
let firstName: string = 'John';
let list: number[] = [1, 2, 3];
let tuple: [string, number] = ['Hello', 10];
enum Color { Red, Green, Blue }
let c: Color = Color.Green;
function add(x: number, y: number): number {
  return x + y;
}
let notSure: any = 4;
notSure = 'maybe a string instead';
notSure = false; // okay, definitely a boolean
function warnUser(): void {
  console.log('This is my warning message');
}
let u: undefined = undefined;
let n: null = null;
let someValue: unknown = 'this is a string';
if (typeof someValue === 'string') {
  console.log(someValue.length);
}
```

== any  
- The `any` type in TypeScript is a special type that allows a variable to hold any value, effectively opting out of type checking for that variable.
```typescript
let notSure: any = 4;
notSure = 'maybe a string instead';
notSure = false; // okay, definitely a boolean
```
== unknown
- The `unknown` type in TypeScript is a type-safe counterpart to `any`. It represents any value, but unlike `any`, you cannot perform operations on an `unknown` type without first performing some type of checking or assertion.
```typescript
let someValue: unknown = 'this is a string';
if (typeof someValue === 'string') {
  console.log(someValue.length);
}
```

== tuple
- A tuple in TypeScript is a special type that allows you to define an array with a fixed number of elements, where each element can have a different type.
```typescript
let tuple: [string, number] = ['Hello', 10];
console.log(tuple[0]); // Output: Hello
console.log(tuple[1]); // Output: 10
```
Its still an array but with fixed types and length. but push is allowed but not recommended

=== optinal elements in tuple
```typescript
const tuple: {type: string, mileage?: number}[] = [
  { type: 'sedan', mileage: 15000 },
  { type: 'convertible' } // mileage is optional
];

tuple.push({ type: 'SUV', mileage: 20000 });
``` 

== enum 
- An enum (short for enumeration) in TypeScript is a way to define a set of named constants. Enums allow you to group related values together and give them meaningful names.
```typescript
enum Color {
  Red,
  Green,
  Blue
}
let c: Color = Color.Green;
console.log(c); // Output: 1
```

== Typ alias 
- A type alias in TypeScript is a way to create a new name for a type. It allows you to define complex types and reuse them throughout your code.
```typescript
type Point = {
  x: number;
  y: number;
};
let p: Point = { x: 10, y: 20 };
console.log(p); // Output: { x: 10, y: 20 }
```

== interfaces
- An interface in TypeScript is a way to define the shape of an object. It allows you to specify the properties and methods that an object should have.
```typescript
interface Person {
  name: string;
  age: number;
  greet(): void;
}
let person: Person = {
  name: 'John',
  age: 30,
  greet() {
    console.log(`Hello, my name is ${this.name}`);
  }
};
person.greet(); // Output: Hello, my name is John
```

== union types
- A union type in TypeScript allows a variable to hold values of multiple types. You can define a union type using the pipe (`|`) symbol.
```typescript
let value: string | number;
value = 'Hello'; // valid
value = 42;      // valid
console.log(value);
// value = true;  // Error: Type 'boolean' is not assignable to type 'string | number'
```

== function  
```typescript
function add(x: number, y: number): number {
  return x + y;
}
let sum: number = add(5, 10);
console.log(sum); // Output: 15
```

=== function types
```typescript
let myAdd: (x: number, y: number) => number;
myAdd = function(x: number, y: number): number {
  return x + y;
};
console.log(myAdd(5, 10)); // Output: 15
```

```ts
type Adder = (x: number, y: number) => number;
let myAdd: Adder;
myAdd = function(x: number, y: number): number {
  return x + y;
};
console.log(myAdd(5, 10)); // Output: 15
```

== overload function
```typescript
function combine(input1: string, input2: string): string;
function combine(input1: number, input2: number): number;
function combine(input1: any, input2: any): any {
  if (typeof input1 === 'string' && typeof input2 === 'string') {
    return input1 + input2;
  } else if (typeof input1 === 'number' && typeof input2 === 'number') {
    return input1 + input2;
  }
}
console.log(combine('Hello, ', 'world!')); // Output: Hello, world!
console.log(combine(5, 10));                 // Output: 15
```

== type guards
- Type guards in TypeScript are expressions that perform runtime checks to ensure that a variable is of a specific type. They help the TypeScript compiler narrow down the type of a variable within a conditional block.
```typescript
type id = string | number;
function printId(id: id): id {
  if (typeof id === 'string') {
    console.log('ID as string: ' + id.toUpperCase());
  } else {
    console.log('ID as number: ' + id);
  }
  return id;
}
```

== cast 
- Type casting in TypeScript is a way to explicitly tell the compiler to treat a variable as a specific type. This is useful when you know more about the type of a variable than the compiler does.
```typescript
let someValue: unknown = 'this is a string';
let strLength: number = (someValue as string).length;
console.log(strLength); // Output: 16
```

== classes
- Sichtbarkeiten: public, private, protected
- Konstanten: readonly
- kobinierbar mit interfaces
```typescript
class Person {
  private name: string;
  protected age: number;
  public readonly id: number;

  constructor(name: string, age: number, id: number) {
    this.name = name;
    this.age = age;
    this.id = id;
  }

  public greet(): void {
    console.log(`Hello, my name is ${this.name}`);
  }
}
```

=== Vererbung
```typescript
class Employee extends Person {
  private position: string;

  constructor(name: string, age: number, id: number, position: string) {
    super(name, age, id);
    this.position = position;
  }

  public work(): void {
    console.log(`${this.name} is working as a ${this.position}`);
  }
}
const emp = new Employee('Alice', 28, 1, 'Developer');
emp.greet(); // Output: Hello, my name is Alice
emp.work();  // Output: Alice is working as a Developer
```

== generics
- Generics in TypeScript allow you to create reusable components that can work with different data types while maintaining type safety.
```typescript
function identity<T>(arg: T): T {
  return arg;
}
let output1 = identity<string>('Hello, Generics!');
let output2 = identity<number>(42);
console.log(output1); // Output: Hello, Generics!
console.log(output2); // Output: 42
```

=== Utility types
- TypeScript provides several built-in utility types that help manipulate types in various ways.
```typescript
interface Person {
  name: string;
  age: number;
  address: string;
}
type PartialPerson = Partial<Person>;
const partialPerson: PartialPerson = { name: 'John' };
type ReadonlyPerson = Readonly<Person>;
const readonlyPerson: ReadonlyPerson = { name: 'Jane', age: 30,
  address: '123 Main St' };
// readonlyPerson.name = 'Doe'; // Error: Cannot assign to 'name' because it is a read-only property
```

=== Keytype
```typescript
interface Person {
  name: string;
  age: number;
  address: string;
}
type PersonKeys = keyof Person; // "name" | "age" | "address"
const key: PersonKeys = 'name';
console.log(key); // Output: name
```