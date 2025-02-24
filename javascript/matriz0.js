//Recorrer un array multidimensional con for anidado

let matriz = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
];
console.log("Con bucle for clásico");
for (let i = 0; i < matriz.length; i++) {
    console.log(`Array [${[i]}]: ${matriz[i]}`);
    for (let j = 0; j < matriz[i].length; j++) {
        console.log(`Elemento [${i}][${j}] = ${matriz[i][j]}`);
    }
}
console.log("");
console.log("Con for of")
for (element of matriz){
    console.log(`Array [${[element]}]`);
    for(subelement of element){
        console.log(subelement);
    }   
}
// Modifica el código anterior para que muestre el array completo en forma de matriz.
       

console.log("");
console.log("Para ver la matriz completa");
for (let i = 0; i < matriz.length; i++) {
    let fila = '';  // Variable para construir la fila como una cadena de texto
    for (let j = 0; j < matriz[i].length; j++) {
        fila += matriz[i][j] + ' ';  // Agregar el elemento de la matriz a la fila
    }
    console.log(fila.trim());  // Mostrar la fila completa sin espacios al final
}

console.log("");
console.log("Para ver la matriz completa con for..of");
for (let element of matriz){
    let fila ='';    
    for(let subelement of element){
        fila += subelement+ '';        
    }
    console.log(fila.trim());   
}

/* Modifica el array completo para que muestre la diagonal principal de la matriz. (la diagonal principal son los elementos donde i y j son iguales). */

console.log("");
console.log("Para ver la diagonal principal ");
for (let i = 0; i < matriz.length; i++) {
    console.log(`Elemento [${i}][${i}] = ${matriz[i][i]}`);
}
