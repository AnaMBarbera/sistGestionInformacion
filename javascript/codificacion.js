/*Ejercicio 3: Codificación de cadenas

    Diseña un programa que permita codificar y decodificar cadenas de texto.
        Solicita una cadena de texto
        Codifica y decodifica la cadena según la cadena de codificación.
        La cadena de codificación será: ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz por DEFGHIJKLMNOPQRSTUVWXYZABCdefghijklmnopqrstuvwxyzabc.
*/
const prompt = require("prompt-sync")();

//PARA CODIFICAR
const original =     "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
const codificacion = "DEFGHIJKLMNOPQRSTUVWXYZABCdefghijklmnopqrstuvwxyzabc";
let cadenaCodificada = '';
let cadenaDecodificada = '';

// Solicitar la cadena al usuario
let cadena = prompt("Introduce una cadena de texto para codificar:");


//CODIFICAR
for (let i = 0; i < cadena.length; i++) {
    let indice = original.indexOf(cadena[i]); //indexOf(): Encuentra la posición de un carácter de la cadena introducida dentro de la cadena original.
    if (indice !== -1) {
        cadenaCodificada += codificacion[indice]; //vamos añadiendo los caracteres de la cadena de codificación que corresponden a la posición de la cadena original
    } else {
        // Si el carácter no está en la cadena de letras (como espacios, números, etc.), lo dejamos igual
        cadenaCodificada += cadena[i];
    }
}
console.log (`La cadena codificada es: ${cadenaCodificada}`);

//DECODIFICAR

// Solicitar la cadena al usuario
let cadena2 = prompt("Introduce una cadena de texto para decodificar:");

for (let i = 0; i < cadena2.length; i++) {
    let indice = codificacion.indexOf(cadena2[i]); //indexOf(): Encuentra la posición de un carácter de la cadena introducida dentro de la cadena codificación.
    if (indice !== -1) {
        cadenaDecodificada += original[indice]; //vamos añadiendo los caracteres de la cadena original que corresponden a la posición de la cadena codificación
    } else {
        // Si el carácter no está en la cadena de letras (como espacios, números, etc.), lo dejamos igual
        cadenaDecodificada += cadena2[i];
    }
}

console.log (`La cadena decodificada es: ${cadenaDecodificada}`);


