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
    default:
        console.log("El tipo de vehículo no es válido");
}

/*Ejercicio 2: Meses del año
Crea un programa que solicite al usuario un número del 1 al 12.
Muestra el nombre del mes correspondiente:
1: Enero, 2: Febrero, etc.
Si el número no está en el rango, muestra un mensaje de error.*/

let num = parseInt(prompt("Introduce un número del 1 al 12: "));
switch (num){
    case 1:
        console.log("Enero");
        break;
    case 2:
        console.log("Febrero");
        break;
    case 3:
        console.log("Marzo");
        break;
    case 4:
        console.log("Abril");
        break;
    case 5:
        console.log("Mayo");
        break;
    case 6:
        console.log("Junio");
        break;
    case 7:
        console.log("Julio");
        break;
    case 8:
        console.log("Agosto");
        break;
    case 9:
        console.log("Septiembre");
        break;
    case 10:
        console.log("Octubre");
        break;
    case 11:
        console.log("Noviembre");
        break;
    case 12:
        console.log("Diciembre");
        break;
    default:
        console.log("El número no corresponde a ningún mes");  
}

/*Ejercicio 3: Clasificación de frutas
Crea un programa que solicite al usuario el nombre de una fruta ("manzana", "plátano", "naranja").
Muestra un mensaje indicando el color típico de la fruta:
"Manzana": Roja o verde.
"Plátano": Amarillo.
"Naranja": Naranja.*/

let fruta = prompt("Escribe una fruta (manzana, platano, naranja): ");

switch (fruta) {
    case "manzana":
        console.log(`El color de la fruta ${fruta} es roja o verde`);
        break;
    case "platano":
        console.log(`El color de la fruta ${fruta} es amarillo`);
        break;
    case "naranja":
        console.log(`El color de la fruta ${fruta} es naranja`);
        break;
    default:
        console.log("No es fruta de la lista");
}

