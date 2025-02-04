const prompt = require("prompt-sync")();

let edad = prompt("¿Qué edad tienes? ");
console.log(`¡Hola, tienes ${edad} años`);

/*Ejercicio 11: Solicitar el nombre del usuario
Crea un programa que haga lo siguiente:
Solicita al usuario su nombre utilizando la biblioteca prompt-sync.
Muestra un saludo personalizado en la consola, como: "¡Hola, [nombre]!".*/

let nombre = prompt("¿Cómo te llamas? ");
console.log(`¡Hola, ${nombre}!`)

/*Ejercicio 12: Calculadora básica
Crea un programa que haga lo siguiente:
Solicita al usuario dos números utilizando la biblioteca prompt-sync.
Realiza las operaciones matemáticas básicas: suma, resta, multiplicación y división.
Muestra los resultados de todas las operaciones en la consola. */

let num1 = parseInt(prompt("Escribe el primer número "));
let num2 = parseInt(prompt("Escribe el segundo número "));
let suma = num1 + num2;
let resta = num1 - num2;
let multip = num1 * num2;
let divis  = num1 / num2;

console.log(`La suma es: ${suma}, la resta es: ${resta}, la multiplicación es: ${multip} y la división es: ${divis}`);