const fs = require('fs');
const prompt = require("prompt-sync")();

// para recuperar el fichero almacenado

let datos = fs.readFileSync('empleados.json', 'utf-8');
let empleados = JSON.parse(datos);

console.log(empleados);

// para convertirlo en cadena

let empl_string = JSON.stringify(empleados);
console.log(empl_string);


/*Solicitar al usuario un código de empleado.
Mostrar la información del empleado correspondiente.*/

indice = parseInt(prompt(`Introduce un índice entre 0 y ${empleados.length - 1} para ver un empleado (introduce otro número para salir):`));

if (indice >= 0 && indice < empleados.length) {
    const empl = empleados[indice];
    console.log(`\nInformación del empleado:`);
    console.log(`Nombre: ${empl.nombre}`);
    console.log(`Edad: ${empl.edad}`);
    console.log(`Sueldo: ${empl.sueldo}`);
 

    /*Permitir al usuario modificar la edad o el sueldo.
    Guardar de nuevo el array modificado en el archivo JSON.*/

    let prop = parseInt(prompt("¿qué propiedad deseas modificar? [1 - edad][2 - sueldo][0 - salir]: "));
    if (prop ==1){
        nuevaEdad = parseInt(prompt("Escribe la nueva edad: "));
        empl.edad = nuevaEdad;
    } else if(prop==1){
        nuevoSueldo = parseInt(prompt("Escribe el nuevo sueldo: "));
        empl.sueldo = nuevoSueldo;

    } else if(prop==0){
        console.log("Saliendo de la aplicación...");
    } else {
        console.log("Opción no válida");
    }

    console.log(`\nInformación del empleado actualizado:`);
        console.log(`Nombre: ${empl.nombre}`);
        console.log(`Edad: ${empl.edad}`);
        console.log(`Sueldo: ${empl.sueldo}`);

  }  else {
        console.log("Saliendo de la aplicación...");
    }

   //Guardar de nuevo el array modificado en el archivo JSON
  
   fs.writeFileSync('empleados.json', empleados, 'utf-8');

   console.log(empleados);