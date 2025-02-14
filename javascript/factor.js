/*Ejercicio 3: Calculadora de factorial
Crea un programa que solicite al usuario un número entero positivo y calcule su factorial. El factorial de un número n se define como el producto de todos los enteros positivos menores o iguales a n.
Por ejemplo, el factorial de 5 (5!) es 5 x 4 x 3 x 2 x 1 = 120.*/

const prompt = require("prompt-sync")();

let num = parseInt(prompt("Introduce un número positivo: "));
if (num < 0 || isNaN(num)){
    console.log("El número introducido no es positivo o no es un número")
} else {
    let fact = 1;    
    for (let i = 1; i<=num; i++){        
        fact = fact * i; //fact *=i
    }
    console.log(`El factorial de (${num}!) es ${fact}`)
}



