/*console.log('Inicio de la función de prueba.');
    sleepES5(3000);    //Dormimos la ejecución durante 3 segundos*/

/*Crea un programa que solicite al usuario un PIN de seguridad de 4 dígitos. Si el PIN ingresado no es correcto, el programa debe mostrar un mensaje de error y permitir al usuario intentarlo nuevamente. El programa debe finalizar cuando el PIN ingresado sea correcto. O si el usuario ha intentado 3 veces.
Ampliación: Si el usuario ha intentado 3 veces, el programa debe bloquearse durante 30 segundos antes de permitir nuevos intentos, investiga como bloquear el rograma 30 segundos.*/

const prompt = require("prompt-sync")();
let intento=0;
const code ="12345";
let pin ="";

    do{
        pin = prompt("Introduce el pin de 5 dígitos: ");    
        if (code != pin){
            console.log("El código no es correcto. Inténtelo de nuevo");
            intento++
        } else {
            console.log("Código correcto");
        }
    } while ((intento < 3) && (code!=pin));

    if (intento ==3 && (code!=pin)) {
            console.log("has superado los tres intentos tienes que esperar 30 segundos para volver a intentarlo");
    }

   console.log(" ----------------------");   
    intento=1;
    pin ="";    
    const TIMER = 30000;
do { 
    intento = 1;  
    do{
        pin = prompt(`(${intento} intento) Introduce el pin de 5 dígitos: `);
        if (code != pin){
            console.log("El código no es correcto. Inténtelo de nuevo");
            intento++            
        } else {
            console.log("Código correcto");
        }
    } while ((intento <= 3) && (code!=pin));    
    if (intento ==3 && (code!=pin)) {
            console.log("has superado los tres intentos");
            console.log("espere 30 segundos...");
            const start =Date.now();
            while (Date.now()-start < TIMER);
    }
    } while (code!=pin);

console.log(" ----------------------");

const INTENTOS = 3;
pin ="";
let contador = 1;
do {
    contador = 1;
    do{
        pin = prompt(`(${contador} intento) Introduce el pin de 5 dígitos: `);
        contador ++;
    } while ((contador <= INTENTOS) && (code!=pin));

        if (code == pin){
            console.log("El código es correcto");            
        } else {
            console.log("Código incorrecto, ha agotado los intentos");
            console.log("espere 30 segundos...");
            const start =Date.now();
            while (Date.now()-start < TIMER);
        }  
    
    } while (code!=pin);