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
let rectangulo = {
    base : 20,
    altura: 10,
    area : function(){        
        area=this.base * this.altura;
        console.log("el area es: "+area.toFixed(2));

    },
    perimetro : function(){        
        perim=this.base*2+this.altura*2;
        console.log("el perimetro es: "+perim.toFixed(2));
    }
}
console.log(`La base y altura del rectántulo son: ${rectangulo.base} y ${rectangulo.altura}`);
rectangulo.area();
rectangulo.perimetro();

//con constructores

function Circulos (radio){
    this.radio = radio;    
    this.area = function(){
        const pi =  Math.PI;
        area=pi*this.radio*this.radio;
        console.log("el area de este círculo es: "+area.toFixed(2));
    }
}
let circulo1 = new Circulos (40);
circulo1.area();

//¡OJO NO FUNCIONA BIEN
function Rectangulos (base, altura){
    this.base = 20,
    this.altura= 10,
    this.area = function(){        
        area=this.base * this.altura;
        console.log("el area de este rectángulo es: "+area.toFixed(2));
    },
    this.perimetro = function(){        
        perim=this.base*2+this.altura*2;
        console.log("el perimetro de este rectángulo es: "+perim.toFixed(2));
    }
}
let rectangulo1 = new Rectangulos(15,9);
console.log(`La base y altura del rectántulo son: ${rectangulo1.base} y ${rectangulo1.altura}`);
rectangulo1.area();
rectangulo1.perimetro();


