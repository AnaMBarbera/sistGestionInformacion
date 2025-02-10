/*Ejercicio 5: Determinar si un número cumple múltiples condiciones
Crea un programa que haga lo siguiente:
Solicita al usuario que introduzca un número.
Determina si el número cumple al menos una de las siguientes condiciones:
Es divisible por 2 y mayor que 10.
O es divisible por 3 pero no mayor que 50.
Y que el número no sea negativo.*/

const prompt = require("prompt-sync")();
let num1 = parseInt(prompt("Introduce un número: "));

if (((num1 % 2 == 0 && num1 >10) || (num1 % 3 == 0 && num1 <= 50)) && num1 >=0) {
    console.log ("el número cumple una de las condiciones y es positivo")
} else {
    console.log("el número no cumple ninguna condición o es negativo")
}

/*Ejercicio 6: Validar si un texto cumple criterios mixtos
Crea un programa que haga lo siguiente:
Solicita al usuario que introduzca una cadena de texto.
Determina si la cadena cumple todas las siguientes condiciones:
Tiene entre 5 y 15 caracteres.
O comienza con la letra "A" pero no termina con la letra "Z".
Y no contiene espacios en blanco.*/

let cadena = prompt("Escribe un texto: ");
if ((cadena.length >= 5 && cadena.length <= 15) || (cadena.startsWith("A") && !cadena.endsWith("Z")) && !cadena.includes(" ")) {
    console.log("El texto cumple las condiciones");
} else {
    console.log("El texto no cumple las condiciones");
}