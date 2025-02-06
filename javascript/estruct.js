//En el siguiente ejemplo, se evalúa si una persona es mayor de edad:

let edad = 17;

if (edad >= 18) {
    console.log("Eres mayor de edad");
} else {
    console.log("Eres menor de edad");
};


/*Crea un programa que haga lo siguiente paso a paso:
Paso 1: Determina si dos números son iguales.
Paso 2: Evalúa si el primer número es mayor que el segundo.
Paso 3: Evalúa si el segundo número es mayor que el primero.
Paso 4: Combina todas las evaluaciones en un único programa.*/

const prompt = require ("prompt-sync")();

let num1 = prompt("Escribe el primer número: ");
let num2 = prompt("Escribe el segundo número: ");

if (num1 == num2) {
    console.log("Los números son iguales");
} else if (num1 > num2) {
    console.log (`El primer número ${num1} es mayor que el segundo ${num2}`);
} else {
    console.log (` El segundo número ${num2} es mayor que el primero ${num1}`)
}

/*Ejercicio 2: Número positivo o negativo
Crea un programa que haga lo siguiente paso a paso:
Paso 1: Determina si un número es igual a cero.
Paso 2: Evalúa si un número es positivo.
Paso 3: Evalúa si un número es negativo.
Paso 4: Combina todas las evaluaciones en un único programa. */

let num3 = prompt("Escribe un número: ");

if (num3 == 0) {
    console.log(` El número es 0`);
} else if (num3 > 0) {
    console.log("El número es positivo")
} else {
    console.log("El número es negativo")
}

/*Crea un programa que haga lo siguiente:
Solicita al usuario que introduzca un nombre de usuario y una contraseña.
Compara las entradas con dos constantes predefinidas: USER y PASSWORD.
Si coinciden, muestra el mensaje "Acceso correcto".
Si no coinciden, muestra el mensaje "Acceso incorrecto" en rojo.*/

const chalk = require ("chalk");

let USER = "admin";
let PASSWORD = "1234";

let usuario = prompt("Usuario: ");
let contraseña = prompt("Contraseña: ");

if ((USER == usuario) && (PASSWORD == contraseña)) {
    console.log("Acceso correcto");
} else {
    console.log(chalk.red("Acceso incorrecto"));
    //console.log("Acceso incorrecto");
}

