/*Ejercicio 1: Crear un objeto círculo con métodos para calcular su área y perímetro
Crea un objeto círculo con la propiedad radio.
Agrega métodos para calcular el área y el perímetro.*/

let circulo = {
    radio : 20,
    area : function(){
        const pi =  Math.PI;
        area=pi*this.radio*this.radio;
        console.log("el area es: "+area.toFixed(2));

    },
    perimetro : function(){
        const pi =  Math.PI;
        perim=2*pi*this.radio;
        console.log("el perimetro es: "+perim.toFixed(2));
    }
}
console.log("El radio del círculo es: "+circulo.radio);
circulo.area();
circulo.perimetro();

////////////////////////////

/*Ejercicio 2: Crear un objeto rectángulo con métodos para calcular su área y perímetro
Agrega métodos para calcular el área y el perímetro.*/


