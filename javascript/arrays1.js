/*Ejercicio 1: Crear un array y mostrar su contenido
    Crea un array con cinco nombres y muestra su contenido utilizando for.*/

let array1 = ["Ana", "Luis", "Javi", "Raul", "Antonio"];

console.log("con bucle for");
for (let i = 0; i < array1.length; i++) {
    console.log(array1[i]);
}
console.log("en orden inverso");
for (let i = array1.length-1; i>=0 ; i--) {
    console.log(array1[i]);
}
//o también
console.log("en orden inverso con reverse");
let array1reverse = array1.reverse();
for (let nombre of array1reverse){
    console.log(nombre)
}
console.log("en orden inverso con reverse alfabeticamente");
let ascendente = array1.sort().reverse();
for (let nombre of ascendente){
    console.log(nombre)
}

//let desdencente = array.sort().reverse()

console.log("Qué empiecen por A");
for (let i = 0; i < array1.length; i++) {
    let elemento = array1[i];
    if (elemento[0] == "A"){
        console.log(elemento);
    }    
}

console.log("devolviendo los nombres con funcion");
function comenzarPorA(nombre){
return nombre.toUpperCase()[0]=="A";
}
let nombreconA = array1.filter(comenzarPorA);

console.log("devolviendo el array con funcion flecha");
let nombresA = array1.filter(nombre=> nombre.toUpperCase()[0]=="A");
console.log(nombresA);


console.log("");
console.log("con for_of");
for (let nombre of array1){
    console.log(nombre)
}
console.log("");

function escribirNombre(nombre) {
    console.log(nombre)
}

console.log("");
console.log("con for_each y funcion flecha");
array1.forEach (nombre => console.log(nombre));

//o también
console.log("Con una función normal");
array1.forEach(escribirNombre);


console.log("");
console.log("Pruebas con reverse");
console.log (`Array Original: ${array1}`); 
let array1Inverso = array1.reverse();
console.log (`Array Inverso: ${array1Inverso}`);
console.log (`Array Original: ${array1}`); 

/*Ejercicio 2: Buscar un elemento en un array
    Pide al usuario un nombre y verifica si existe en un array de nombres utilizando indexOf().*/

    const prompt = require("prompt-sync")();
    let nombres = ["Ana", "Luis", "Pedro", "María", "Carlos"];
    let nombreBuscado = prompt("Introduce un nombre: ");
    
    let posicion = nombres.indexOf(nombreBuscado);
    if (posicion !== -1) {
        console.log(`El nombre está en la posición ${posicion}`);
    } else {
        console.log("Nombre no encontrado");
    }


// también
let encontrado = -1;
let i =0;
while (encontrado==-1 && i <(nombres.length)){
    if (nombres[i]== nombreBuscado){
        encontrado=i;
    }
    i++
}
if(encontrado >=0){
    console.log(`el nombre está en la posición ${encontrado}`);
}

/*Ejercicio 3: Uso de push() y pop()

    Crea un array vacío.
    Usa push() para agregar tres elementos.
    Usa pop() para eliminar el último elemento y mostrar el resultado. */

    let numeros = [];
    numeros.push(10, 20, 30);
    console.log(numeros);
    
    numeros.pop();
    console.log(numeros);
      
    /*Modifica el código para pedir al usuario los elementos a agregar hasta que ponga un 0. Si escribe -1 eliminamos el último elemento. En cada iteración mostramos el array.*/
    numeros = [];
    let num =-1;

    while(num!=0){
        num = parseInt (prompt("digite un numero: "));
        if (num>0){
            numeros.push(num);
        }else if(num==-1 && numeros.length>0){
           
            let elemento = numeros.pop();
            console.log(`elemento eliminado: ${elemento}`);-8
        }
        console.log(numeros);
    }


    /*Ejercicio 4: Filtrar elementos con filter()
    Crea un array de números.
    Usa filter() para obtener solo los números mayores de 50. */

numeros = [10, 55, 60, 32, 70];
const Max = 50;
const Min = 10;

let mayoresDe50 = numeros.filter(num => num > 50);
console.log(mayoresDe50); // [55, 60, 70]

let intervalo = numeros.filter(num=> num>Min && num<Max);
console.log(intervalo);

function limits(num){
return num>Min && num<Max
}
let intervalo2 = numeros.filter(limits);
console.log(intervalo2);

/*Ejercicio 5: Transformar elementos con map()
    Dado un array de precios en euros, conviértelos a dólares (suponiendo que 1€ = 1.1$). */

    let preciosEuros = [10, 20, 30];
    let preciosDolares = preciosEuros.map(precio => precio * 1.1);
    console.log(`precios en Euros: ${preciosEuros}`);
    console.log(`precios en Dolares: ${preciosDolares}`);

    // Array de cambios (1: dólares, 2: yenes, 3: libras)
    let cambios = [1.1, 140.0, 0.85];  // Cambios respecto al euro: [dólares, yenes, libras]

    // Pedir al usuario la moneda a la que quiere cambiar (1 - dólares, 2 - yenes, 3 - libras)
    let seleccion = parseInt(prompt("¿A qué moneda deseas cambiar los precios?\n1 - Dólares\n2 - Yenes\n3 - Libras :")); 
        // Verificamos que la selección sea válida (1, 2 o 3)   
        if (seleccion >= 1 && seleccion <= 3) {
            // Convertimos los precios a la moneda seleccionada usando el tipo de cambio correspondiente
            let preciosConvertidos = preciosEuros.map(precio => precio * cambios[seleccion - 1]);

            // Mostrar los precios convertidos
            console.log(`Precios en la moneda seleccionada (opción ${seleccion}): `);
            console.log(preciosConvertidos);
        } else {
            // Si la selección no es válida, mostrar un mensaje de error
            console.log("Selección no válida. Por favor elige entre 1, 2 o 3.");
        }
   



    //otra forma
    const CAMBIO_DOLAR= 1.1;
    function cambioDolar(precio){
        return precio * CAMBIO_DOLAR;
    }
    let preciosDolares3 = preciosEuros.map(cambioDolar);
    console.log ("Con funcion: ", preciosDolares3)

    //con funcion flecha
    let preciosDolares2= preciosEuros.map(precio => precio*CAMBIO_DOLAR);    
    console.log ("con funcion flecha: ", preciosDolares2)

    //con for_of
    let resultado = [];
    for (valor of preciosEuros){        
        resultado.push(valor*CAMBIO_DOLAR);
    }
    console.log("Utilizando for_of: ", resultado)
       


/*Ejercicio 6: Recorriendo un array con forEach()
Dado un array de nombres, usa forEach() para mostrarlos en la consola.
    a. Modifica el código para que muestre los nombres en mayúsculas.
    b. Modifica el código para que muestre los nombres con su longitud.
    c. Modifica el código para conseguir un array con el orden inverso. */

    nombres = ["Ana", "Luis", "Pedro", "María", "Carlos"];
    nombres.forEach((nombre,i) => {
        console.log(`${nombre} está en la posición ${i}`)
        console.log(nombre.toUpperCase());
        console.log(`${nombre} [${nombre.length}]`)
    }
    );

    for (let nombre of nombres){
        console.log(nombre.toUpperCase());
    }

    for (let nombre of nombres){
        console.log(`${nombre} [${nombre.length}]`)
    }

    let nombres_low = nombres.map(nombre => nombre.toLowerCase());
    console.log(nombres_low)

    let nombresReverso = nombres;
    nombresReverso.reverse();
    console.log(nombresReverso)

    /*Ejercicio 7: Uso de splice() para modificar un array
    Dado un array de colores [rojo, verde, azul, amarillo], usa splice() para eliminar el segundo elemento y agregar un nuevo color en su lugar.    
    a. Modifica el código para que el usuario pueda elegir el color a agregar y en qué posición lo quiere. Si el color está repetido, mostrar un mensaje de error.
    b. Modifica el código para que el usuario pueda elegir el color a eliminar. Si el color no se encuntra dar un mensaje de error.
*/


    let colores = ["Rojo", "Verde", "Azul"];
    colores.splice(1, 1, "Amarillo");
    console.log(colores); // ["Rojo", "Amarillo", "Azul"]    
        let colorNuevo = prompt("Escribe un nuevo color: ");
        let posicionColor = prompt("¿En que posición lo quieres? [1,2,3,4]: ");
        if (colores.includes(colorNuevo)){
            console.log("Ese color está repetido")
        } else {
            colores.splice(posicionColor-1,0,colorNuevo);
            console.log(colores);
        }

/*
        do{
            let colorNuevo = prompt("Escribe un nuevo color: ");
            if (colores.includes(colorNuevo)){
                console.log("Ese color está repetido")
            }
        } while (colores.includes(colorNuevo));
        colores.splice(posicionColor-1,0,colorNuevo);
        console.log(colores);
*/
let color="";
let opcion = prompt ("Ingrese una acción ('a'gregar, 'e'liminar, 'l'istar): ");
switch(opcion){
    case 'a':
        if (colores.includes(color)) {
            console.log ("el color ya existe");            
        } else {
            colores.push(color);
            console.log("color agregado");
            console.log(colores);
        }
        break;

    case 'e':
        if (colores.indexOf(color)===-1) {
            console.log ("el color no existe");            
        } else {
            colores.splice(colores.indexOf(color), 1);
            console.log("color eliminado");
            console.log(colores);
        }
        break;
    case 'l':
        colores.forEach(color=>{console.log(color)});        
        break;
    default:
        console.log("opción inválida");    
}
//en lugar de colocar console.log(colores) en cada opción lo podemos colocar después del switch

//utilizando indexOf crear un array con todas las posiciones de un colot
    colores = ["rojo", "verde", "rojo", "azul", "amarillo", "rojo"];
    const SEARCH = "rojo";
    let posiciones = []; //0,2,5
    let index = colores.indexOf(SEARCH); // Primer índice encontrado

    while (index !== -1) {
        posiciones.push(index);
        index = colores.indexOf(SEARCH, index + 1); // Buscar siguiente aparición después de la última posición
    }    
    console.log(posiciones);

    let hayMas = true; //variable bandera para el bucle while
    let indice = -1; //se inicializa en -1 porque no queremos que indexOf empiece a buscar desde el primer índice del array (es decir, el valor -1 significa que no se ha encontrado ninguna coincidencia aún).
    while (hayMas) {
        indice = colores.indexOf(SEARCH, indice + 1);
        //Usamos el método indexOf para buscar la siguiente aparición de SEARCH en el array colores. El parámetro de indexOf (indice + 1) le dice a indexOf que comience la búsqueda justo después del índice actual (indice + 1). Es decir, indexOf no empezará desde el principio del array, sino desde donde terminó la última búsqueda.
        if (indice === -1){            
            haymas = false;
        }
        //Si indexOf no encuentra la próxima coincidencia, devolverá -1. En ese caso, indice será -1, lo que indica que ya no hay más coincidencias en el array. Entonces, se establece haymas = false, lo que hará que el ciclo while termine.
        else {
            posiciones.push(indice);
        }
       // Si indice no es -1, significa que se ha encontrado una coincidencia, por lo que se agrega ese índice al array posiciones.
    }
    console.log(posiciones);



     

  /*Ejercicio 8: Uso de sort() y reverse()
    Dado un array de palabras, ordénalas alfabéticamente y luego en orden inverso. */
    let palabras = ["manzana", "banana", "cereza", "durazno"];
    palabras.sort();
    console.log(palabras);
    
    palabras.reverse();
    console.log(palabras);


    



    
  /*Ejercicio 9: Matriz bidimensional
    Crea una matriz 3x3 e imprime todos sus elementos con un for anidado. */

    let matriz = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
    ];
    
    for (let i = 0; i < matriz.length; i++) {
        for (let j = 0; j < matriz[i].length; j++) {
            console.log(`Elemento [${i}][${j}] = ${matriz[i][j]}`);
        }
    }  
  
      





