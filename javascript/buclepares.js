/*Ejercicio 5: Números pares entre 1 y N
Escribe un programa que simprima en la consola todos los números pares desde 1 hasta 100.*/

console.log("bucle for");
for (let i = 1; i <= 100; i++) {
    if (i%2==0){
        console.log (i)
    }
}
console.log("")
console.log("bucle while");
i = 1;
while (i <=100){
    if (i%2==0){
        console.log (i)
    }
    i++ 
}

/*Modifica el programa para que solicite al usuario un número N y muestre los números pares desde 1 hasta N.*/
const prompt = require("prompt-sync")();

let N = parseInt(prompt("Introduce un número entre 2 y 100: "));

console.log("bucle for");
for (let i = 1; i <= N; i++) {
    if (i%2==0){
        console.log (i)
    }
}
console.log("")
console.log("bucle while");
i = 1;
while (i <=N){
    if (i%2==0){
        console.log (i)
    }
    i++ 
}