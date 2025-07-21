/*Ejercicio 6: Invertir una cadena
Crea un programa que pida al usuario una cadena de texto y luego imprima la cadena invertida.
Aunque aún no hemos vista arrays, saber que con la expresión texto[i] se puede acceder a cada carácter de la cadena (la i debe estar entre 0 y la longitud de la cadena(length)).*/

const prompt = require("prompt-sync")();

let cadena = prompt("Escribe una frase: ");
let cadena2 = "";

console.log("bucle for")
for (let i = cadena.length-1; i >= 0; i--){
    cadena2 = cadena2 + cadena[i]; 
    //cadena2 += cadena[i];
}
console.log(cadena2);
// hemos inicializado i con cadena.length-1 por que la longitud de la cadena es la posición del último caracter -1 (al empezar por 0)

console.log("");
console.log("bucle while")
cadena2 = "";
i= cadena.length-1;
while (i >=0){
    cadena2 = cadena2 + cadena[i];
    i--;
}
console.log(cadena2);

console.log("");
console.log("bucle do-while")
cadena2 = "";
i= cadena.length-1;
do {
    cadena2 = cadena2 + cadena[i];
    i--;
} while (i >=0)
console.log(cadena2);
console.log("");
console.log(cadena+cadena2);
console.log("");
/* Contar vocales en una cadena
Desarrolla un programa que solicite al usuario una cadena de texto y cuente cuántas vocales contiene.
Para saber si una letra es una vocal podemos utilizar un if o utilizar el método includes() de los strings*/

console.log("Bucle for");
let vocal = 0;
let cadena1 = cadena.toLowerCase();
for ( let i = 0; i<=cadena1.length; i++){
    if (cadena1[i]=="a" || cadena1[i]=="e" || cadena1[i]=="i" || cadena1[i]=="o" || cadena1[i]=="u"){
        vocal++
    }    
}
console.log(`En esta cadena hay ${vocal} vocales`);

console.log("");

console.log("Bucle while con includes()")
vocal = 0;
let vocales = "aeiou";
i=0;
while (i<= cadena1.length){
    if (vocales.includes(cadena1[i])){
        vocal++
    } //vocal += vocales.includes(cadena1[i])? 1 : 0;
    i++  
}
console.log(`En esta cadena hay ${vocal} vocales`);

console.log("");

console.log("Bucle do-while con includes y terniario");
vocal = 0;
vocales = "aeiou";
i=0;
do {
     vocal += vocales.includes(cadena1[i])? 1 : 0;
    i++  
} while (i<= cadena1.length)
console.log(`En esta cadena hay ${vocal} vocales`);