/*Ejercicio 8: Números primos
Crea un programa que calcule y muestre todos los números primos entre 1 y 100.*/

const MAX = 100;
console.log("bucle for anidado en for");

for (let i = 1; i <= MAX; i++){
    //comprobar cada i si es primo
    let encontradoDivisor = false;
    for (let j = 2; j < i; j++) {
        if (i%j == 0){
            encontradoDivisor = true;
        }        
    }
    if (!encontradoDivisor) {
        console.log (`el número ${i} es primo`)
    }
}
console.log("")
//
console.log("bucle while anidado en for");

for (let i = 1; i <= MAX; i++){
    //comprobar cada i si es primo
    let encontradoDivisor = false;
    let j = 2;
    while (!encontradoDivisor && (j < i)){ //podemos poner j < (i / 2)+1 porque no serán divisibles por más de su mitad (sumamos 1 para evitar que salga el número 4)
        encontradoDivisor = (i % j === 0);
        j++;
    }
    if (!encontradoDivisor) {
        console.log (`el número ${i} es primo`)
    }
}