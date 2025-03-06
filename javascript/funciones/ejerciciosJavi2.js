// función esPrimo(numero)


function esPrimo(numero) {
    if (numero < 2) return false;
    for (let i = 2; i < numero; i++) {
        if (numero % i === 0) {
            return false;
        }
    }
    return true;
}

/**
* a- Devuelva un array con los números primos.
* b- Compruebe si exeiste algún número primo en el array.
* c- Compruebe si todos los números del array son primos.
* d- Devuelva la cantidad de números primos en el array.
 */

function crearArray(longitud) {
    let array = [];
    for (let i = 0; i < longitud; i++) {
        array.push(Math.floor(Math.random() * 100));
    }
    return array;
}

function primosArray(array) {
    let primos = [];
    for (let numero of array) {
        if (esPrimo(numero)) {
            primos.push(numero);
        }
    }
    //return primos;
    //Soluión alternativa
    return  array.filter(numero => esPrimo(numero));
}

function existePrimo(array) {
    let existe = false;
    let i = 0;

    while (i < array.length && !existe) {
        if (esPrimo(array[i])) {
            existe = true;
        }
        i++;
    }
    //return existe;

    // solución con some
    return array.some(numero => esPrimo(numero));
}

function todosPrimos(array) {
    let todos = true;
    let i = 0;

    while (i < array.length && todos) {
        if (!esPrimo(array[i])) {
            todos = false;
        }
        i++;
    }
    //return todos;

    // solución con every
    return array.every(numero => esPrimo(numero));

}

function cantidadPrimos(array) {
    let cantidad = 0;
    for (let numero of array) {
        if (esPrimo(numero)) {
            cantidad++;
        }
    };
    //return cantidad;

    //solución con reduce
    //return array.reduce((acum, numero) => {if (esPrimo(numero)) return acum++;}, 0);

    return array.reduce((cantidad, num) => (esPrimo(num)) ? cantidad + 1 : cantidad, 0);
}

let array = crearArray(10);
console.log(array);
console.log("Números primos del array: " + primosArray(array));
console.log("Existe algún primo en el array: " + existePrimo(array));
console.log("Todos son primos: " + todosPrimos(array));
console.log("Hay " + cantidadPrimos(array) + " primos en el array"); 
console.log("Todos los números del array son primos: " + todosPrimos([2,5,7,11,19]));
console.log("Existe algún primo: " + todosPrimos([10,12,18,24,33]));