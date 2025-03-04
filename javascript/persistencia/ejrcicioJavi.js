const fs = require('fs');
const prompt = require("prompt-sync")();

// para recuperar el fichero almacenado

let datos = fs.readFileSync('empleados.json', 'utf-8');
let empleados = JSON.parse(datos); //array de objetos

console.log(empleados);

//Solicitar al usuario un código de empleado.
codigo = parseInt(prompt(`Introduce el código del empleado:`));

for (empleado of datos) {
    console.log(`Código: ${empleado.codigo}, Nombre: ${empleado.nombre}, Edad: ${empleado.edad}, Salario: ${empleado.salario}`);    
}

let indice = -1;
for (let i = 0; i<datos.length; i++){
    if (datos [i].codigo == codigo){
        indice = i;
    }
}


indice = parseInt(prompt(`Introduce un índice entre 0 y ${empleados.length - 1} para ver un empleado (introduce otro número para salir):`));

if (indice >= 0 && indice < empleados.length) {
    const empl = empleados[indice];
    console.log(`\nInformación del empleado:`);
    console.log(`Nombre: ${empl.nombre}`);
    console.log(`Edad: ${empl.edad}`);
    console.log(`Sueldo: ${empl.sueldo}`);
 

    //Permitir al usuario modificar la edad o el sueldo.    

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

    //Guardar de nuevo el array modificado en el archivo JSON
  
    //fs.writeFileSync('empleados.json', empl_string, 'utf-8');
    fs.writeFileSync('empleados.json', JSON.stringify(empleados, null, 2), 'utf-8');

  }  else {
        console.log("Saliendo de la aplicación...");
    }  

   console.log(empleados);



   //METODO 2 ... Buscar con find
   let empleado = datos.find (empleado => empleado.codigo == codigo);
   if (empleado != undefined){
    console.log (`Empleado encontrado: ${}`)
   }