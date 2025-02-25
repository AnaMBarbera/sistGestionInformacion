/*Crear un objeto vehiculo.
propiedades: matricula, marca, modelo, velocidad estado
Metodos: arrancar, parar, acelerar(valor), frenar(valor)
inicialmente la velocidad será 0 y estado parado
si aceleramos con el motor parado nos dará error
si arrancamos con el motor en marcha nos dará error
acelerar y frenar aumentan o disminuyen la velocidad
estado será true si está arrancado, false si está parado
*/

/* Crear un objeto conductor (nombre, dni y carné)
añadir una porpiedad conductor al objeto anterior */

let vehiculo = {
    matricula: "9393CHJ",
    marca: "Dacia",
    modelo: "Sandero",
    velocidad: 0,
    estado: false,
    arrancar: function(){
        if(this.estado==true){
            console.log("¡El coche ya está en marcha")
        } else {
        this.estado=true;
        console.log("coche arrancado") }
        return this.estado;
    },
    parar: function(){
        if(!this.estado){
            console.log("¡El coche ya está parado")
        } else {
        this.estado=false;
        console.log("coche parado") }
        return this.estado;
    },
    acelerar: function(valor){
        this.velocidad = this.velocidad+valor;
        console.log("Velocidad: "+this.velocidad)
        return this.velocidad;

    },
    frenar: function(valor){
        this.velocidad = this.velocidad-valor;
        console.log("Velocidad: "+this.velocidad)
        return this.velocidad;
    }
}
console.log(vehiculo.marca);
console.log(vehiculo.modelo);
console.log(vehiculo.matricula);
vehiculo.arrancar();
vehiculo.parar();
vehiculo.acelerar(40);
vehiculo.frenar(20);



// otra forma
function vehiculos (matricula, marca, modelo){
    this.matricula = matricula;
    this.marca = marca;
    this.modelo = modelo;
    this.velocidad = 0;
    this.estado = false;
    this.arrancar = function(){
        if(!this.estado){
            this.estado=true;
            console.log("Coche arrancado");
        } else {
            console.log("ERROR!!El coche ya está en marcha");
        }
    },
    this.parar = function(){
        if(this.estado){
            this.estado=false;
            console.log("Coche parado");
        } else {
            console.log("ERROR!! El coche ya está parado")
        }
    },
    this.acelerar = function(valor){
        this.velocidad = this.velocidad+valor;
        return this.velocidad;
    },
    this.frenar = function(valor){
        this.velocidad = this.velocidad-valor;        
        if(this.velocidad <0) this.velocidad = 0;
        return this.velocidad;
    }
}

let coche1 = new vehiculos("25698KLO", "DACIA", "SANDERO");
console.log(`${coche1.marca} ${coche1.modelo} ${coche1.matricula}`);
coche1.arrancar();
coche1.parar();
console.log("Velocidad: "+coche1.acelerar(30));
console.log("Velocidad: "+coche1.frenar(20));
