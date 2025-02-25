let empleado1 = {
    nombre: "Carlos Pérez",
    edad: 35,
    puesto: "Desarrollador Web"
};

let empleado2 = new Object();
empleado2.nombre = "María Pérez";
empleado2.edad = 30;
empleado2.puesto = "Desarrollador Web";

console.log(empleado1);
console.log(empleado2);

console.log(empleado2.nombre);
console.log(empleado1["puesto"]); //para acceder de forma dinámica si ponemos la clave en una variable


//Agregar Propiedades en Tiempo de Ejecución
empleado1.salario = 20000;
console.log(empleado1);

//Declaración y uso de métodos
let empleado = {
    nombre: "Carlos Pérez",
    edad: 35,
    puesto: "Desarrollador Web",
    saludar: function() {
        console.log("Hola, mi nombre es " + this.nombre);
    }
};

empleado.saludar();

let empleado3 = {
    nombre: "Carlos Pérez",
    edad: 35,
    puesto: "Desarrollador Web",
    mostrarInfo: function() {
       // console.log(`${this.nombre}, ${this.puesto}, ${this.edad} años`);
        return `${this.nombre}, ${this.puesto}, ${this.edad} años`
    }
};

// empleado3.mostrarInfo(); // Carlos Pérez, Desarrollador Web, 35 años
console.log(empleado3.mostrarInfo());

//Declaración de un objeto con constructor sin inicialzación de propiedades
function Empleado() {
    this.nombre = "Carlos Pérez";
    this.edad = 35;
    this.puesto = "Desarrollador";
}

let emp1 = new Empleado();
let emp2 = new Empleado();

console.log(emp1.nombre); // Carlos Pérez
console.log(emp2.nombre); // Carlos Pérez

/*Este método es útil para crear objetos con la misma estructura, pero si queremos personalizar los valores de las propiedades, podemos pasar parámetros al constructor.*/

function Empleado(nombre, edad, puesto) {
    this.nombre = nombre;
    this.edad = edad;
    this.puesto = puesto;
    this.mostrarNombre = function() {
        console.log(`Mi nombre es ${this.nombre}`);
    }
}
// Otra manera de declarar el objeto
function Articulo(nombre, precio) {
    let obj = {
        nombre: nombre,
        precio: precio,
        mostrarPrecio: function() {
            console.log(`El precio de ${this.nombre} es ${this.precio}`);
        }
    }
    return obj;
}

let emp3 = new Empleado("Carlos Pérez", 35, "Desarrollador");
let emp4 = new Empleado("Laura Gómez", 29, "Diseñadora");
let art1 = new Articulo("Camisa", 20);

console.log(emp3.nombre); // Carlos Pérez
console.log(emp4.nombre); // Laura Gómez
console.log(art1.nombre); // Camisa

function objcontacto (nombre, telefono, poblacion){
    this.nombre = nombre;
    this.telefono = telefono;
    this.call = function(){
                return `Llamar al número: , ${this.telefono} (${this.nombre})`
                }

}

const Agenda = [];
Agenda.push (new objcontacto ("Pepe", "12546589"));
Agenda.push (new objcontacto ("Maria", "25898752"));

for (contacto of Agenda){
    console.log(contacto.call());
}



