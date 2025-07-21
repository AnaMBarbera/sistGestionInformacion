/*Ejercicio 9, triángulo rectángulo
Usa un bucle para imprimir un triángulo rectángulo de asteriscos:*/

for (i=1; i<=5; i++){
    let j = 1;
    let ast = "";
    while (j <= i){
        ast = ast + "*";        
        j++
    }
    console.log(ast);
}

/*Reto adicional
Intenta imprimir el triángulo al revés.*/

console.log("");
console.log("bucle al reves");

for (let i= 5; i>=0; i--){
    let j = 1;
    let ast = "";
    while (j <= i){
        ast = ast + "*";    //la cadena empieza con 5 asteriscos  según la i del bucle for    
        j++;
    }
    console.log(ast);
} 

    