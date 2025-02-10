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
} else if (edad <= 17){
    console.log ("Eres un adolescente")
} else {
    console.log("Eres un adulto")
}

/* o también
if (edad < 12) {
    console.log ("Eres un niño");
} else {
    if (edad <= 17) {
        console.log("Adolescente");
   } else {
    console.log("Eres un adulto")
    }
}
...*/

/*Ejercicio 2: Determinar un descuento
Crea un programa que solicite el importe de una compra.
Calcula y muestra el descuento según las siguientes reglas:
20% si el importe es mayor o igual a 100.
10% si el importe está entre 50 y 99.
Sin descuento si el importe es menor a 50*/

let importe = prompt("Introduce el importe: ");
if(importe>=100){
    console.log("el descuento es del 20%")
} else {
    if (importe >= 50){
        console.log("el descuento es del 10%")
    }
    else {
        console.log("no hay descuento")
    }
}

/*Ejercicio 3: Clasificación de temperaturas
Crea un programa que solicite una temperatura en grados Celsius.
Clasifica la temperatura según los siguientes rangos:
"Frío" si es menor a 10°C.
"Templado" si está entre 10°C y 25°C.
"Calor" si es mayor a 25°C.*/

let temp = prompt("Introduce una temperatura: ");
if (temp <10){
    console.log("Frío")
} else if (temp <= 25) {
    console.log("Templado")
} else {
    console.log(" Calor")
}

