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
