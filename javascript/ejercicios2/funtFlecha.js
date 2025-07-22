// Función tradicional
function sumar(a, b) {
    return a + b;
}
console.log(sumar(5, 3));

// Función de flecha
const sumarFlecha = (a, b) => a + b;
console.log(sumarFlecha(5, 3));

//varias instrucciones

// Función tradicional
function sumar2(a, b) {
    let s = a+b;
    return s;
}
console.log(sumar2(5, 9));

// Función de flecha
const sumarFlecha2 = (a, b) => {
    let s = a + b;
    return s; };

console.log(sumarFlecha2(5, 5));