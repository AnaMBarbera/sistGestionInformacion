/*Solicita al usuario que introduzca dos cadenas.
Compara las cadenas considerando mayúsculas y minúsculas (ana es distinto de ANA).
Utiliza funciones como toUpperCase o toLowerCase para compararlas ignorando mayúsculas y minúsculas.
Comprueba si una cadena tiene un número de caracteres entre un mínimo y un máximo.
Explica que, según el orden lexicográfico, "ana" es menor que "ANA".*/

const prompt = require ("prompt-sync")();

let cadena1 = prompt ("Escribe la primera cadena: ");
let cadena2 = prompt ("Escribe la segunda cadena; ");

if (cadena1 == cadena2) {
    console.log ("Las cadenas son iguales")
} else {
    console.log ("Las cadenas no son iguales")
}

//ignorando mayúsculas y minúsculas
if (cadena1.toLowerCase == cadena2.toLowerCase) {
    console.log ("Ignorando mayúsculas y minúsculas, las cadenas son iguales")
} else {
    console.log ("Ignorando mayúsculas y minúsculas, las cadenas no son iguales")
}

// Verificar longitud entre un mínimo y un máximo
let longitudmin = 3;
let longitudmax = 10;
if (cadena1.length >= longitudmin && cadena1.length <= longitudmax) {
    console.log (`la longitud de la cadena "${cadena1}" está entre ${longitudmin} y ${longitudmax} caracteres`)
} else {
    console.log(`la cadena "${cadena1}" no tiene la longitud requerida`)
}

// Comparación lexicográfica
if ("ana" < "ANA") {
    console.log('"ana" es menor que "ANA" en orden lexicográfico.');
} else {
    console.log('"ana" no es menor que "ANA" en orden lexicográfico.');
}

