/*Crea una función pedirNumero que solicite un número al usuario.
Usa try...catch para asegurarte de que el usuario ingrese un número válido.
Si el usuario ingresa algo que no sea un número, lanza un error con throw y captura el error.*/

const prompt=require("prompt-sync")();

function pedirNum() {
    let num = prompt ("Escribe un número: ");
    try {
        if (isNaN(num)) {
            throw new Error("El número no es válido");
        }
    } catch (error) {
        console.log("Se ha producido un error:", error.message);
    }
}

pedirNum();
//----------------------------------

console.log("");
function pedirNumero() {
    let num = prompt ("Escribe un número: ");    
        if (isNaN(num)) {throw new Error("El dato no es numérico");}
        if (num<1 || num>100) {throw new Error("Número fuera de rango");}
}
try{
num=pedirNumero();
console.log ('numero introducido: ',num);
} catch(error) {
    console.log(error.message)} 

