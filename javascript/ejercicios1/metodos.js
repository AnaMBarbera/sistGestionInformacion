/*Ejemplo Completo
Ejemplo de uso de la Clase Number*/

let valor = 123.456;

console.log("Valor original:", valor);
console.log("Redondeado a 2 decimales:", valor.toFixed(2));
console.log("¿Es un entero?:", Number.isInteger(valor));
console.log("Máximo valor representable:", Number.MAX_VALUE);
console.log("Valor en hexadecimal:", valor.toString(16));
console.log("Número desde cadena:", parseFloat("123.45"));


let base = 5;
let exponente = 3;

console.log("Potencia:", Math.pow(base, exponente));
console.log("Raíz cuadrada de 25:", Math.sqrt(25));
console.log("Número aleatorio entre 0 y 1:", Math.random());
console.log("Redondeado hacia abajo (4.7):", Math.floor(4.7));
console.log("Redondeado hacia arriba (4.2):", Math.ceil(4.2));


let frase = "  Aprende JavaScript, es genial!  ";

console.log("Longitud:", frase.length);
console.log("En mayúsculas:", frase.toUpperCase());
console.log("Primera palabra:", frase.slice(2, 9));
console.log("¿Incluye 'genial'?:", frase.includes("genial"));
console.log("Sin espacios alrededor:", frase.trim());



const ahora = new Date();

console.log("Fecha y hora actuales:", ahora);
console.log("Año:", ahora.getFullYear());
console.log("Mes:", ahora.getMonth() + 1); // Se suma 1 porque es 0-indexado
console.log("Día del mes:", ahora.getDate());
console.log("Hora actual:", ahora.getHours(), ":", ahora.getMinutes());
console.log("Formato local:", ahora.toLocaleDateString());


/*Ejercicio 2: Comparar dos fechas

    Solicita al usuario dos fechas en formato YYYY-MM-DD.
    Compara ambas fechas e indica cuál es anterior o si son iguales.*/

const prompt = require("prompt-sync")();

let fecha1 = new Date(prompt("Introduce la primera fecha (YYYY-MM-DD): "));
let fecha2 = new Date(prompt("Introduce la segunda fecha (YYYY-MM-DD): "));

if (fecha1 < fecha2) {
    console.log("La primera fecha es anterior.");
} else if (fecha1 > fecha2) {
    console.log("La segunda fecha es anterior.");
} else {
    console.log("Ambas fechas son iguales.");
}

/*Ejercicio 3: Calcular días entre dos fechas
    Solicita al usuario dos fechas en formato YYYY-MM-DD. (utilizamos la fechas del ejercicio anterior)
    Calcula la diferencia en días entre ambas fechas. */

    let diferencia = Math.abs(fecha2 - fecha1); // Diferencia en milisegundos
    let dias = diferencia / (1000 * 60 * 60 * 24); // Convertir a días
    
    console.log("Diferencia en días:", dias);
      
/*Ejercicio 4: Crear fecha a partir de valores
    Solicita al usuario que introduzca el año, mes y día por separado.
    Crea un objeto Date con esos valores y muestra la fecha en formato local.*/

    let aaaa = parseInt(prompt("Introduce el año: "));
    let mes = parseInt(prompt("Introduce el mes (1-12): ")) - 1; // Restar 1 porque es 0-indexado
    let dia = parseInt(prompt("Introduce el día: "));
    
    let fecha = new Date(aaaa, mes, dia);
    console.log("Fecha creada:", fecha.toLocaleDateString());




