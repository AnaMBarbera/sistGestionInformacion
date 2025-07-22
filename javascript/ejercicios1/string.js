/*Ejercicio 1: Manipulación básica de cadenas
    Declara una cadena con el texto: "Bienvenido a JavaScript".
    Convierte todo el texto a mayúsculas.
    Extrae la palabra "JavaScript".
    Reemplaza la palabra "Bienvenido" por "Hola".*/

    let cadena = "Bienvenido a JavaScript";

    console.log("En mayúsculas:", cadena.toUpperCase());
    console.log("Extraer 'JavaScript':", cadena.slice(13)); //extrae la palabra a partir de la posición 13
    console.log("Reemplazar 'Bienvenido':", cadena.replace("Bienvenido", "Hola"));

   /*Ejercicio 2: Contar palabras
    Escribe un programa que cuente el número de palabras en una cadena ingresada por el usuario.*/
 
    const prompt = require("prompt-sync")();

    let cadena2 = prompt("Introduce una cadena: ");
    let palabras = cadena2.trim().split(" ").length; 
    //con trim quita los espacios sobrantes y split (" ") cuenta los espacios interiores como separación de palabras
    
    console.log("Número de palabras:", palabras);
    
/*Ejercicio 3: Verificar contenido
    Solicita al usuario una frase y verifica si contiene la palabra "JavaScript".*/

    let frase = prompt("Introduce una frase: ");
    console.log("¿Contiene 'JavaScript'?:", frase.includes("JavaScript"));
      
/*Ejercicio 4: Formatear una lista
    Dada una cadena con elementos separados por comas, conviértela en una lista con viñetas.*/

    let cadena3 = "Renault,Opel,Peugeot";
    let elementos = cadena3.split(",");
    
    console.log("Lista con viñetas:");
    elementos.forEach(item => console.log("-", item));
      
/*Ejercicio 5: Eliminar espacios
    Solicita al usuario una frase y elimina todos los espacios en blanco*/

    let frase2 = prompt("Introduce una frase: ");
    console.log("Sin espacios:", frase2.replace(/\s/g, ""));
     //expresión regular donde la \s significa "coincidir con espacios en blanco" y la g es una bandera que significa "global", es decir, coincide con todos los espacios en blanco, no sólo el primero 
    console.log("Sin espacios (otra):", frase2.replace(" ", ""));  //sólo reemplaza el primer espacio