/*Ejercicio 1: Clasificación de vehículos
Crea un programa que solicite al usuario el tipo de vehículo ("coche", "moto" o "camión").
Muestra un mensaje con el número de ruedas típico para ese tipo de vehículo:
"Coche": 4 ruedas.
"Moto": 2 ruedas.
"Camión": más de 4 ruedas.*/

const prompt = require("prompt-sync")();

let tipo = prompt("Introduce el tipo de vehículo (coche, moto, camion): ")
switch (tipo){
    case "coche":
        console.log("4 ruedas");
        break;
    case "moto":
        console.log("2 ruedas");
        break;
    case "camion":
        console.log("más de 4 ruedas");
        break;
}

