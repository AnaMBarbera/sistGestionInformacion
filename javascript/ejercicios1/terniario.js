/*Sintaxis del Operador Ternario

condición ? expresión_si_verdadero : expresión_si_falso;
Ejemplo: Determinar si un número es par o impar.*/
const numero = 5;
const resultado = (numero % 2 === 0) ? "Par" : "Impar";
console.log(resultado);


/*
Ejercicio: Calificación rápida
Crea un programa que solicite al usuario una calificación numérica.
Muestra "Aprobado" si la calificación es mayor o igual a 5, o "Suspendido" si es menor.*/

const prompt = require("prompt-sync")();

let calif = parseInt(prompt("Introduce la calificación (numérica): "));
const result = (calif >=5) ? "Aprobado" : "Suspendido";
console.log (result);

