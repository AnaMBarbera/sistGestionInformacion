/* Convierte una función tradicional que multipique dos números una función de flecha.
Crea una función que reciba dos arrays y los combine en uno solo usando el operador spread.
A partir del objeto coche {marca: " Toyota", modelo: "Corolla" }, desestructura las propiedades marca y modelo y muéstralas en la consola. */

// Función de flecha
const mult = (a, b) => a * b;
console.log(mult(5, 3));

//combinar arrays
const array1 = [1, 2, 3];
const array2 = [4, 5, 6];
const combinado = [...array1, ...array2];
console.log(combinado); // [1, 2, 3, 4, 5, 6]


const coche = {marca: " Toyota", modelo: "Corolla" };
const { marca } = coche;
const { modelo } = coche;
console.log(marca);
console.log(modelo);


//SOLUCIONES
const multiplicar = (a, b) => a * b;
console.log(multiplicar(4, 5)); // 20

function combinarArrays(arr1, arr2) {
    return [...arr1, ...arr2];
}

arr1=[9,8,7];
arr2=[6,5,4];
console.log(combinarArrays(arr1, arr2));


const coche2 = { marca2: "Toyota", modelo2: "Corolla" };
const { marca2, modelo2 } = coche2;
console.log(marca, modelo); // Toyota Corolla

