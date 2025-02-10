let a = 10;
let b = 20;

if ((a > 10) && (b > 20)) {
    console.log ("resultado cierto")
}

if ((a >= 10) || (b >= 20)) {
    console.log ("resultado cierto")
}

console.log("" == true) //resultado false
console.log("1" == true) // resultado true
console.log(25 == true) // resultado false
console.log (1 == true) // resultado true

console.log("not true = " + !true); //resultado not true = false
console.log("Not false = " + !false); //resultado not false = true

/* while (a < 100) {
    if ((4 < 2) && (a++ > b)) {
    console.log ("");
    }
}
// el bucle sería infinito pues la primera condición antes del && es falsa y ya no se incrementa la variable a
*/

let A = true;
let B = false;

//1ª ley de Morgan: La negación de una conjunción (A && B) es equivalente a la disyunción de las negaciones (!A || !B).
console.log(!(A && B));  // true
console.log(!A || !B);   // true (equivalente por De Morgan)

//2ª ley de Morgan:  La negación de una disyunción (A || B) es equivalente a la conjunción de las negaciones
console.log(!(A || B));  // false
console.log(!A && !B);   // false (equivalente por De Morgan)

/*Ejercicio 4: Validar acceso según edad y rol
Crea un programa que haga lo siguiente:

Solicita al usuario que introduzca su edad y su rol.
Permite el acceso solo si:
El usuario tiene 18 años o más y es administrador.
O si tiene menos de 18 años pero el rol es "invitado".
Y se asegura de que el rol no esté vacío.*/

const prompt = require("prompt-sync")();

let edad = parseInt(prompt("Edad: "));
let rol = prompt("Rol: (administrador / invitado) ");

if (rol==""){
    console.log("El rol está vacío")
} else if ((edad >= 18 && rol == "administrador") || (edad < 18 && rol == "invitado")) {
    console.log("Acceso permitido")
} else {
    console.log("Acceso no permitido")
 }

