/*Ejercicio 6: Concatenar cadenas
Crea un programa que haga lo siguiente:
Declara dos variables nombre y edad.
Crea una nueva variable concatenando ambas cadenas: mi nombre es [nombre] y tengo [edad] años.
Muestra la cadena completa.*/

let nombre = "Ana";
let edad = 38;
let cadena = `Mi nombre es ${nombre} y tengo ${edad} años. `
console.log(cadena);

/*Ejercicio 7: Longitud de una cadena
Crea un programa que haga lo siguiente:
Declara una variable frase con una oración: Hola, ¿cómo estás?.
Calcula la longitud de la cadena.
Muestra el resultado.*/

let frase = "Hola, ¿cómo estás?";
console.log(`La longitud de la frase "${frase}" es ${frase.length}`);
//o también
let longitud = frase.length;
console.log (`la frase "${frase}" tiene ${longitud} caracteres`);

/*Ejercicio 8: Convertir a mayúsculas y minúsculas
Crea un programa que haga lo siguiente:
Declara una variable texto: JavaScript es divertido.
Convierte el texto a mayúsculas y a minúsculas.
Muestra ambos resultados. */

let texto = "JavaScript es divertido";
let textoMay = texto.toUpperCase();
let textoMin = texto.toLowerCase();

console.log(texto);
console.log(textoMay);
console.log(textoMin);

/*Ejercicio 9: Extraer parte de una cadena
Crea un programa que haga lo siguiente:
Declara una variable mensaje con una oración: JavaScript es muy poderoso.
Extrae una parte de la cadena (primeras 10 letras).
Muestra la parte extraída.*/

let mensaje = "JavasCript es muy poderoso";
let cadenaParte = mensaje.slice(0, 10);
console.log(cadenaParte);

/*Ejercicio 10: Reemplazar palabras en una frase
Crea un programa que haga lo siguiente:
Declara una variable frase con el texto: "El cielo es azul y el mar también es azul".
Usa .replace() para cambiar la primera ocurrencias de la palabra "azul" por "verde".
Muestra la frase modificada*/

let texto10 = "El cielo es azul y el mar también es azul";
let textoReplace = texto10.replace("azul", "verde");
console.log(textoReplace);
