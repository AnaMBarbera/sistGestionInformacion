const prompt = require("prompt-sync")();
const fs = require("fs");

let datos = {};

let jsonFile= fs.readFileSync("datos.json", "utf-8");
datos = JSON.parse(jsonFile);

//datos = JSON.parse(fs.readFileSync("datos.json", "utf-8"));

// mostrar por pantalla los códigos empleados
for (let empleado of datos){
    console.log(`Código: ${empleado.codigo}, Nombre: ${empleado.nombre}, 
                Edad: ${empleado.edad}, Salario: ${empleado.sueldo}` 
    );
}

let codigo = prompt("Ingrese el código del empleado: ");

// método 1.. buscar con un for...

let indice = -1;
for (let i = 0; i < datos.length; i++){
    if (datos[i].codigo == codigo){
        indice = i;
    }
}

if (indice != -1){
    console.log(`Empleado encontrado: ${datos[indice].nombre}`);
}
else {
    console.log("Empleado no encontrado");
}

// método 2 ... buscar con find

let empleado = datos.find(empleado => empleado.codigo == codigo);
if (empleado != undefined){
    console.log(`Empleado encontrado: ${datos[indice].nombre}`);
}
else {
    console.log("Empleado no encontrado");
}


let opcion = prompt("Desea modificar el salario del empleado? (s/n): ");

if (opcion == "s"){
    let nuevoSalario = prompt("Ingrese el nuevo salario: ");
    empleado.sueldo = nuevoSalario;
}

opcion = prompt("Desea modificar la edad del empleado? (s/n): ");

if (opcion == "s"){
    let nuevaEdad = prompt("Ingrese la nueva edad: ");
    empleado.edad = nuevaEdad;
}

// Guardar los datos en el archivo

jsonFile = JSON.stringify(datos, null, 2);
fs.writeFileSync("datos.json", jsonFile);