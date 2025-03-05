/**
     Crea una función esPalindromo que reciba una palabra y devuelva true si se lee igual de izquierda a derecha que de derecha a izquierda, y false en caso contrario.
 */

function esPalindromo(palabra) {
    // Convertir la palabra a minúsculas y eliminar espacios
    palabra = palabra.toLowerCase().replace(/\s+/g, '');

    // Crear la versión invertida de la palabra
    let palabrainv = palabra.split("").reverse().join("");

    // Comparar la palabra original con la invertida
    if (palabra === palabrainv) {
        return true; // Es un palíndromo
    } else {
        return false; // No es un palíndromo
    }
}

let palabra = "holakkh"; 
let palabra2 = "reconocer"
console.log("La palabra: ",palabra, " es palíndromo: ", esPalindromo(palabra));
console.log("La palabra: ",palabra2, " es palíndromo: ", esPalindromo(palabra2));
