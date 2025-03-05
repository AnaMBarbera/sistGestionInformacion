/*Crea una función llamada calcularMedia que reciba tres números como parámetros y devuelva la media aritmética de los tres.*/

function calcularMedia(a,b,c){
    let suma = a + b + c;
    return "la media de los números es: ", suma/3;
}

console.log(calcularMedia(2,6,8).toFixed(2));

//-----------------

//Crea una función esPrimo que reciba un número entero positivo y devuelva true si es primo y false en caso contrario.

function esPrimo(num){
    if (num < 2) return true;
    for (let i = 2; i < num; i++) {
        if (num % i === 0) {
            return false;
        }
    }
    return true;
}

console.log(esPrimo(8));
console.log(esPrimo(7));
console.log(esPrimo(2));


//Dado un vector de números enteros y teniendo la función esPrimo()
//crear una función que me diga si algún número del vector es primo
//crear una función que me diga si todos los números del vector son primos
//crear una función que me devuelva un array con los primos

// Función que dice si algún número del vector es primo
function algunPrimo(vector) {
    for (let num of vector) {
        if (esPrimo(num)) {
            return true; // Si algún número es primo, devuelve true
        }
    }
    return false; // Si ningún número es primo, devuelve false
}

// Función que dice si todos los números del vector son primos
function todosPrimos(vector) {
    for (let num of vector) {
        if (!esPrimo(num)) {
            return false; // Si algún número no es primo, devuelve false
        }
    }
    return true; // Si todos son primos, devuelve true
}

// Función que devuelve un array con los números primos del vector
function primosDelVector(vector) {
    let primos = [];
    for (let num of vector) {
        if (esPrimo(num)) {
            primos.push(num); // Añade los números primos al array
        }
    }
    return primos; // Devuelve el array con los primos
}

let vector = [2, 3, 4, 5, 6, 7, 8, 9, 10];
console.log("Vector: ",vector)
console.log("Algun Primo: ", algunPrimo(vector));  // true (porque hay números primos en el vector)
console.log("Todos primos: ", todosPrimos(vector)); // false (porque no todos son primos)
console.log("Primos del vector: ", primosDelVector(vector)); // [2, 3, 5, 7] (array de primos)





//-------------------
//Crea una función contarVocales que reciba una palabra y devuelva cuántas vocales contiene.

function contarVocales(palabra){
    let vocales ="aeiouAEIOU";    
    vocal = 0;
   
    i=0;
    while (i<= palabra.length){
        if (vocales.includes(palabra[i])){
            vocal++
        } //vocal += vocales.includes(cadena1[i])? 1 : 0;
        i++  
    }
    return `En esta palabra hay ${vocal} vocales`
}

console.log(contarVocales("Cataluña"));

/* solución de los apuntes
function contarVocales(palabra) {
    let contador = 0;
    let vocales = "aeiouAEIOU";
    for (let i = 0; i < palabra.length; i++) {
        if (vocales.includes(palabra[i])) {
            contador++;
        }
    }
    return contador;
} */

//-------------------------------

//Crea una función numeroAleatorio que reciba dos números (min y max) y devuelva un número entero aleatorio dentro de ese rango, incluyendo ambos valores.

function numeroAleatorio (min,max){
    return Math.floor(Math.random() * (max - min + 1)) + min;
}
/*Math.random(): genera un número decimal aleatorio entre 0 (inclusive) y 1 (exclusivo).
Math.random() * (max - min + 1): escalamos este número al rango deseado. El +1 asegura que el valor máximo (max) sea incluido en el rango.
Math.floor(): redondea hacia abajo para asegurarnos de que el número generado sea un entero.
+ min: desplazamos el número aleatorio generado para que comience desde el valor mínimo.*/

console.log(numeroAleatorio(1,10));

//--------
//Crea una función como expresión que calcule el cuadrado de un número y la almacene en una variable.
let cuadrado = function(num){
    return num*num;
}
console.log(cuadrado(6));

//--------------------
//Declara una función que intente modificar una variable primitiva y otra que modifique un objeto. Explica la diferencia.

function modificarPrim(num){
    num = 25;
}
function modificarObj(obj){
    obj.coche = "Ford";
}

let num = 40;
let obj = { coche: "Renault" };

modificarPrim(num);
modificarObj(obj);

console.log(num); // 40 - el número no ha cambiado (valor)
console.log(obj.coche); //el objeto ha cambiado (referencia)


