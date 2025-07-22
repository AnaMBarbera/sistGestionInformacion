/*Ejercicio 3: Suma de los primeros 100 números
Crea un programa que calcule la suma de los números del 1 al 100.*/

let suma = 0;
console.log("bucle for")
for (let i = 1; i<=100; i++) {
    suma = suma+i;
}
console.log(suma);

console.log("bucle while");
suma = 0;
let j = 1;
while (j<=100){
    suma = suma+j;
    j++
}
console.log(suma);

console.log("bucle do-while");
suma = 0;
let k = 1;
do {
    suma = suma + k;
    k++
} while (k<=100);
console.log(suma);


const prompt = require("prompt-sync")();
let N = parseInt(prompt("Introduce un número: "));

suma = 0;
console.log("bucle for")
for (let i = 1; i<=N; i++) {
    suma = suma+i;
}
console.log(suma);

console.log("bucle while");
suma = 0;
j = 1;
while (j<=N){
    suma = suma+j;
    j++
}
console.log(suma);

console.log("bucle do-while");
suma = 0;
k = 1;
do {
    suma = suma + k;
    k++
} while (k<=N);
console.log(suma);

/*Calcula ahora la suma y la media de los números divisibles por 3 entre 0 y N. Recuerda que para saber si es divisible por 3: i % 3 === 0. Y para calcular la media tienes que contar cuántos números divisibles hay.*/

console.log("Bucle for");
let suma3 = 0;
let media =0;
for (i = 1; i<=N; i++){
    if (i % 3 ===0){
        suma3 = suma3+i;
        media = media + 1;        
    }    
}
console.log (`La suma de los números divisibles por 3 es ${suma3}`);
console.log (`la media los números divisibles por 3 es ${suma3/media}`);

console.log("Bucle while");
suma3 = 0;
media = 0;
i = 1;
while(i <= N) {
    if (i % 3 ===0){
        suma3 = suma3+i;
        media = media + 1; 
    }
    i++;
}
console.log (`La suma de los números divisibles por 3 es ${suma3}`);
console.log (`la media los números divisibles por 3 es ${suma3/media}`);

console.log("Bucle do-while");
suma3 = 0;
media = 0;
i = 1;
 do {
    if (i % 3 ===0){
        suma3 = suma3+i;
        media = media + 1; 
    }
    i++;
} while(i <= N)
console.log (`La suma de los números divisibles por 3 es ${suma3}`);
console.log (`la media los números divisibles por 3 es ${suma3/media}`);