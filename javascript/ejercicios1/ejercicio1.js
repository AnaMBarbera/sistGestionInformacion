let a = 13;
let b = 5;
let c = 10;

let suma = a + b;
let resta = a - b;
let multiplicacion = a * b;
let division = a / b;
let modulo = a % b;

console.log("suma: " + suma);
console.log("resta: " + resta);
console.log("multiplicación: "  +multiplicacion);
console.log("division: " + division);
console.log("modulo: " + modulo );

console.log("La suma es: " + suma + ". La resta es: " + resta + ". La multiplicación: " + multiplicacion + ". La división: " + division + " y el módulo es: " + modulo);

console.log("La suma de a + b multiplicado por c es: " + suma*c);
console.log(`La suma de ${a} + ${b} multiplicado por ${c} es: ${suma*c}`);

console.log("El promedio de a, b y c es: " + (a+b+c)/3);
console.log(`El promedio de ${a}, ${b} y ${c} es:  ${(a+b+c)/3} `);

/* Ejercicio 3: Área de un rectángulo
Crea un programa que haga lo siguiente:
Declara dos variables largo y ancho con valores numéricos
Calcula el área del rectángulo.
Muestra el resultado. */

let largo = 10;
let ancho = 5;
let area = largo*ancho;
console.log(`El área del rectángulo de largo: ${largo} y ancho: ${ancho} es: ${area.toFixed(2)}`);
//toFixed para ajustar los decimales

/*Ejercicio 4: Perímetro y área de un círculo
Crea un programa que haga lo siguiente:
Declara una variable radio con un valor numérico.
Calcula el perímetro y el área del círculo.
Muestra ambos resultados. */

let radio = 3;
const pi = 3.141592;
let perim = 2 * pi * radio;
let area_circ = pi * radio * radio;

console.log(`El área del círculo de radio ${radio} es: ${area_circ.toFixed(2)} y el perímetro es ${perim.toFixed(2)}`);

/*Ejercicio 5: Cálculo del IVA
Crea un programa que haga lo siguiente:

Declara una variable precio con un valor numérico y otra iva con un porcentaje.
Calcula el importe del IVA y el precio total.
Muestra el IVA y el total.*/

let precio = 45;
let iva = 21;
let importeIva = precio * iva / 100;
let precioTotal = precio + importeIva;

console.log(`El iva del ${iva}% de ${precio} es ${importeIva}`);
console.log(`El precio total es ${precioTotal}`);

