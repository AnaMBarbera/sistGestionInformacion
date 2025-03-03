
const fs = require('fs');

let empleados = [
    { "codigo": 101, "nombre": "Carlos Pérez", "edad": 35, "sueldo": 2500 },
    { "codigo": 102, "nombre": "Ana López", "edad": 28, "sueldo": 2200 }
];

// para almacenar en un fichero 

let jsonData = JSON.stringify(empleados, null, 2);

fs.writeFileSync('empleados1.json', jsonData, 'utf-8'); //ahora tenemos un fichero empleados.json en nuestro ordenador
console.log('Archivo JSON guardado exitosamente.');

// para recuperar el fichero almacenado

let datos = fs.readFileSync('empleados1.json', 'utf-8');
let empleados2 = JSON.parse(datos);

console.log(empleados2);

