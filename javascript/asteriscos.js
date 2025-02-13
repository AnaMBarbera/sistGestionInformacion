/*Ejercicio 9, triángulo rectángulo
Usa un bucle para imprimir un triángulo rectángulo de asteriscos:*/

for (i=1; i<=5; i++){
    let j = 1;
    let ast = "";
    while (j <= i){
        ast = ast + "*";        
        j++
    }
    console.log(ast)
}

