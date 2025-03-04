const prompt = require("prompt-sync")();
const fs = require("fs");

let datos = {};

let jsonFile= fs.readFileSync("superheroes.json", "utf-8");
datos = JSON.parse(jsonFile);

let members = datos.members;
// mostrar por pantalla los héroes

console.log("Información de los superhéroes");
console.log("==============================")
for (let heroe of members){
    console.log(`Nombre: ${heroe.name}, Edad: ${heroe.age}, 
                Identidad secreta: ${heroe.secretIdentity}, Poderes: ${heroe.powers}` 
    );
}

let nombre = prompt("Ingrese el nombre del heroe: ");

// método 1.. buscar con un for...
/*
let indice = -1;
for (let i = 0; i < members.length; i++){
    if (members[i].name == nombre){
        indice = i;
    }
}

if (indice != -1){
    console.log(`Heroe encontrado: ${members[indice].name}`);
}
else {
    console.log("Heroe no encontrado");
} */

    let superh = members.find(heroe =>heroe.name == nombre);
    if (superh != -1){
        console.log(`Heroe encontrado: ${superh.name}`);
    }
    else {
        console.log("Heroe no encontrado");
    }



let opcion = prompt("Desea modificar la edad del heroe? (s/n): ");

if (opcion == "s"){
    let nuevaEdad = prompt("Ingrese la nueva Edad: ");
    superh.age = nuevaEdad;
}



// Guardar los datos en el archivo

jsonFile = JSON.stringify(datos, null, 2);
fs.writeFileSync("superheroes.json", jsonFile); 