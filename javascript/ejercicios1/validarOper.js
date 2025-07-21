/*Ejercicio 5: Validación de datos con operación
Pide al usuario que introduzca un número entero y positivo. Si es correcto que lo sume en un acumulador. Si el usuario introduce un número negativo o no entero, debe mostrar un mensaje de error y solicitar al usuario que introduzca un número válido. El programa finalizará cuando el usuario introduzca un 0, en ese caso mostrará el total acumulado
Ampliación: Calcula también la media de los números introducidos.*/

const prompt = require("prompt-sync")();
let num=0;
let acum = 0;
let contador =0;

do{
    num = parseInt(prompt("Introduce un número positivo [0 para terminar]: "));
    if (num < 0 || isNaN(num)){
        console.log("Debes introducir un número entero positivo")
    } else {
        acum = acum+num;
        contador++
        console.log(`Acumulado: ${acum}`)

    }
} while (num!==0);
console.log(`El acumulado total es ${acum}`);
console.log(`la media de los números es ${(acum/(contador-1)).toFixed(2)}`); //contador -1 = --contador