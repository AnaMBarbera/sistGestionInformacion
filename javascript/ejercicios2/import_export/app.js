import { suma, resta, PI } from './math.js';

console.log(suma(4, 5)); // 9
console.log(resta(10, 3)); // 7
console.log(PI); // 3.1416

//si hay un package.json hay que poner "type": "module", (antes de las dependencias)


import multiplicar from './math.js';

console.log(multiplicar(4, 5)); // 20
//En este caso, al importar la función, no es necesario usar llaves {}. Además, podemos cambiar el nombre de la función al importarla si lo deseamos.