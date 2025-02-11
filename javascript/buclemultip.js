/*Ejercicio 4: Tabla de multiplicar
Desarrolla un programa que pida al usuario un número entero y muestre en la consola la tabla de multiplicar de ese número del 1 al 10. El formato debe ser:
2 x 1 = 2
2 x 2 = 4
...
...
2 x 10 = 20.*/


const prompt = require("prompt-sync")();
let N = parseInt(prompt("Introduce un número: "));


console.log("bucle for")
for (let i = 1; i<=10; i++) {
    let mult = N * i;
    console.log(`${N} x ${i} = ${mult}`)
}


console.log("bucle while");
mult = 0;
let j = 1;
while (j<=10){
    mult = N * j;
    console.log(`${N} x ${j} = ${mult}`);
    j++
}


console.log("bucle do-while");
mult = 0;
let k = 1;
do {
    mult = N * k;
    console.log(`${N} x ${k} = ${mult}`);
    k++
} while (k<=10);

/*Reto adicional
Modifica el programa tenga dos constantes MIN y MAX. Por ejemlo, si MIN = 5 y MAX = 15, el programa mostrará la tabla de multiplicar del 5 al 15.*/

const MIN = 5;
const MAX = 15;

console.log("bucle for")
for (let i = MIN; i<=MAX; i++) {
    let mult = N * i;
    console.log(`${N} x ${i} = ${mult}`)
}


console.log("bucle while");
mult = 0;
j = MIN;
while (j<=MAX){
    mult = N * j;
    console.log(`${N} x ${j} = ${mult}`);
    j++
}


console.log("bucle do-while");
mult = 0;
k = MIN;
do {
    mult = N * k;
    console.log(`${N} x ${k} = ${mult}`);
    k++
} while (k<=MAX);
