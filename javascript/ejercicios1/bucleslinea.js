
/*Ejercicio 2: Imprimir una secuencia de números
Escribe un programa que imprima en la consola los números del 1 al 10, uno por línea.*/

console.log("bucle for ");
for (let i = 1; i<=10; i++){
    console.log(i);
}
console.log(" ");

console.log("bucle while");
let j = 1;
while (j<=10){
    console.log(j);
    j++;
}
console.log(`Se han imprimido ${j-1} números`);
console.log(" ");

console.log("bucle do-while");
let k = 1;
do {
    console.log(k);
    k++;
} while (k<=10)
    console.log(`Se han imprimido ${k-1} números`);

console.log(" ");

/*Retos adicional
Modifica el programa para que imprima los números del 10 al 1, en orden descendente.
Define una constante N que determine cuántos números se imprimirán.*/



console.log("bucle for descendente");
for (let i = 10; i > 0; i--){
    console.log(i);
}
console.log(" ");

console.log("bucle while descendente");
j = 10;
while (j>0){
    console.log(j);
    j--;
}
console.log(" ");

console.log("bucle do-while descendente");
k = 10;
do {
    console.log(k);
    k--;
} while (k>0)   

console.log(" ");



const x = 5;

console.log("bucle for descendente");
for (let i = x; i > 0; i--){
    console.log(i);
}
console.log(" ");

console.log("bucle while descendente");
j = x;
while (j>0){
    console.log(j);
    j--;
}
console.log(" ");

console.log("bucle do-while descendente");
k = x;
do {
    console.log(k);
    k--;
} while (k>0)   

console.log(" ");
