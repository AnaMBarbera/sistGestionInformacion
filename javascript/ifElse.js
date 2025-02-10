/*Ejercicio 1: Clasificación de edades
Crea un programa que solicite al usuario su edad.
Según la edad introducida, muestra:
"Niño" si la edad es menor a 12.
"Adolescente" si la edad está entre 12 y 17.
"Adulto" si la edad es 18 o mayor. */

const prompt = require("prompt-sync")();

let edad = parseInt(prompt("Introduce tu edad: "));
if (edad < 12) {
    console.log ("Eres un niño");
} else if (edad >= 12 && edad <= 17){
    console.log ("Eres un adolescente")
} else {
    console.log("Eres un adulto")
}

/* o también
if ...
} else {
    if (edad <= 17) {
        console.log("Adolescente");
   } 
        ...*/