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
//ponemos constansten para mejores prácticas
let MAX = 100;
let MIN = 1;
i = MIN;
while (i <=MAX){
    if (i%2==0){
        console.log (i)
    }
    i++ 
}

/*Modifica el programa para que solicite al usuario un número N y muestre los números pares desde 1 hasta N.*/
const prompt = require("prompt-sync")();

let N = parseInt(prompt("Introduce un número entre 2 y 100: "));

console.log("bucle for");
let salida = "";
for (let i = 1; i <= N; i++) {
    if (i%2==0 && i!=N){
        salida = salida +i + ", "; //para colocarlos en la misma línea
        
    } if (i==N) {
        salida = salida +i;
    }
}
console.log (salida);

// o también
console.log("bucle for");
salida = "";
for (let i = MIN; i <= N; i++) {
    if (i%2==0){
        salida += (salida.length == "")? +i : ", "+i; //si la cadena está vacía no empieza con ,
        
    }     
}
console.log (salida);


console.log("")
console.log("bucle while");
i = 1;
while (i <=N){
    if (i%2==0){
        console.log (i)
    }
    i++ 
}