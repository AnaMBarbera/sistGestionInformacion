/*Ejercicio 2: Adivina el número
Crea un programa que genere un número aleatorio entre 1 y 100. Luego, solicita al usuario que adivine el número. Si el número ingresado es mayor que el número generado, muestra un mensaje indicando que el número es demasiado alto. Si el número ingresado es menor que el número generado, muestra un mensaje indicando que el número es demasiado bajo. El programa debe continuar solicitando al usuario que adivine el número hasta que lo adivine correctamente.*/

const prompt = require("prompt-sync")();
// Returns a random integer from 0 to max:
let max = 11;
const alea = Math.floor(Math.random() * max);

let num =0;

    do{
        num = prompt(`Introduce un número de 0 a ${max-1}: `);         
        if (alea == num) {
                console.log("¡Has acertado!, ¡Eres un crack!");   
            } else {
                if (num > alea){
                console.log("El número ingresado es mayor que el número generado. ");            
                } else {
                    console.log("El número ingresado es menor que el número generado. ");
                }
        }
    } while (alea!=num);
