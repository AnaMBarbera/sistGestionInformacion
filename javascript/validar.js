/*Ejercicio 4: Validación entrada de datos
Crea un programa que solicite al usuario un número entero positivo. Si el usuario ingresa un valor no numérico o un número negativo, el programa debe mostrar un mensaje de error y solicitar al usuario que ingrese un número válido. El programa debe continuar solicitando al usuario que ingrese un número válido hasta que lo haga.*/

const prompt = require("prompt-sync")();
let num=0;
do{
num = parseInt(prompt("Introduce un número positivo: "));
if (num < 0 || isNaN(num)){
    console.log("Debes introducir un número entero positivo")
}
} while (num < 0 || isNaN(num));
console.log("El número es correcto");