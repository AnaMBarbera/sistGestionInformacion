export function suma(a, b) {
    return a + b;
}

export function resta(a, b) {
    return a - b;
}

export const PI = 3.1416;

// sólo se exportarán las funciones con export

//Si solo queremos exportar un elemento principal de un archivo, usamos export default.


export default function multiplicar(a, b) {
    return a * b;
}


// método mixto (más habitual)
// Archivo operaciones.js
function sumar(a, b) {
    return a + b;
}

function restar(a, b) {
    return a - b;
}

const PI = 3.1416;

export { sumar, restar, PI };