
/**
 * 
 * @param {*} valor cuaquier valor numérico
 * @returns devuelve Error si valor no es numérico
 * @returns {string} devuelve "Positivo" si valor es mayor a 0
 * @returns {string} devuelve "Negativo" si valor es menor a 0
 * @returns {string} devuelve "Cero" si valor es igual a 0
 */

function determinarSigno(valor){
    
    if (isNaN(valor)){
        return "Error: No es un número";
    }
    // if (valor > 0){
    //     return "Positivo";
    // } else if (valor < 0){
    //     return "Negativo";
    // } else {
    //     return "Cero";
    // }

    return (valor > 0) ? "Positivo" : (valor < 0) ? "Negativo" : "Cero";
}


console.log("determinarSigno(5)", determinarSigno(5)); // Positivo
console.log("determinarSigno(-5)" ,determinarSigno(-5)); // Negativo
console.log("determinarSigno(0)", determinarSigno(0)); // Cero

/**
 * 
 * @param {string} palabra 
 * @returns devuelve true si palabra es palíndromo, false en caso contrario
 */
function esPalindromoBis(palabra){ // versión corta
    let arbalap = palabra.split("").reverse().join("");
    return palabra === arbalap;
}

function esPalindromo(Palabra){
    let palabra = [];
    let arbalap = [];

    /*
    for (let i = 0; i < Palabra.length; i++){
        palabra.push(Palabra[i]);
    }

    for (let i = Palabra.length - 1; i >= 0; i--){
        arbalap.push(Palabra[i]);
    }
    */
    
    palabra = Palabra.split("");
    arbalap = Palabra.split("").reverse()

    let i = 0;
    let palindromo = true;

    while (i < palabra.length && palindromo){
        if (palabra[i] !== arbalap[i]){
            palindromo = false;
        }
        i++;
    }
    return palindromo;
}

console.log("oso", esPalindromo("oso"));
console.log("reconocer", esPalindromo("reconocer"));
console.log("huerta", esPalindromo("huerta"));

// ejerccio 3
/**
 * 
 * @param {Number} a 
 * @param {Number} b 
 * @param {Number} c 
 * @returns la media ponderada de los tres valores
 * @returns "Error: No es un número" si alguno de los valores
 */

function media3(a,b,c){
    if (isNaN(a) || isNaN(b) || isNaN(c)){
        return "Error: No es un número";
    }
    return (a + b + c) / 3;
}

/**
 * 
 * @param  {...Number} valores 
 * @returns media de los valores o error si alguno no es un número
 */
function media(...valores){

    if (valores.some(valor => isNaN(valor))) 
            return "Error: No es un número";
    
    return valores.reduce((acum, valor) => acum + valor, 0) / valores.length;

    // let suma = 0;
    // for (let i = 0; i < valores.length; i++){
    //     suma += valores[i];
    // }
    // return suma / valores.length;
}

console.log("media3(2,3,4)", media3(2,3,4));
console.log("media(2,3,4,5,6)", media(2,3,4,5,6));
console.log("media(2,3,4,5,6, 'hola')", media(2,3,4,5,6, 'hola'));

// ejercicio 4
function esPrimo(numero){
    // divisible solo por sí mismo y por 1: 2, 3, 5, 7 ..
    //38 -- > no es divisible (2,3,4,5 ... 19) (basta con comprobar la mitad)

    if (isNaN(numero) || numero < 2){
        return "Error: No es un número primo";
    }

    let esPrimo = true; // variable bandera
    let i = 2;

    while (i < (numero/2) && esPrimo){
        if (numero % i === 0){
            esPrimo = false;
        }
        i++;
    }
    return esPrimo;
}

console.log("esPrimo(7)", esPrimo(7));
console.log("esPrimo(38)", esPrimo(38));

// ampliación --> 

// Dado un vector de números enteros y teniendo la función esPrimo()

// crear una función que me diga si algún número del vector es primo
// crear una función que me diga si todos los números del vector son primos
// crear una función que me devuelva un array con los primos