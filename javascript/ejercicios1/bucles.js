
for (let n = 1; n <= 5; n++) {
    console.log(n);
}
console.log(" ");

/* Ejercicio 1: Imprimir un asterisco
Usa un bucle para imprimir un * (*) en 10 veces. Resuelve este ejercicio utilizando los tres tipos de bucles: for, while y do-while. */
console.log("bucle for ");
for (let i = 1; i<=10; i++){
    console.log("*");
}
//para averiguar el valor de i fuera del bucle debemos inicializarla fuera igual que en los bucles while y do-while

console.log("bucle while");
let j = 1;
while (j<=10){
    console.log("*");
    j++;
}
console.log(`Se han imprimido ${j-1} asteriscos`);
console.log(" ");

console.log("bucle do while");
let k = 1;
do {
    console.log("*");
    k++;
} while (k<=10)
    console.log(`Se han imprimido ${k-1} asteriscos`);

console.log(" ");

