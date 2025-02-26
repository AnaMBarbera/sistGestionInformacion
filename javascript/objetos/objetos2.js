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
        return area;
    }
    this.perimetro = function(){
        const pi =  Math.PI;
        perim=2*pi*this.radio;
        console.log("el perimetro es: "+perim.toFixed(2));
        return perim;
    }
}
let circulo1 = new Circulos (40);
circulo1.area();


function Rectangulos (base, altura){
    this.base = base,
    this.altura= altura,
    this.nombre = "Réctangulo",
    this.area = function(){        
        area=this.base * this.altura;
        console.log("el area de este rectángulo es: "+area.toFixed(2));
        return area;
    },
    this.perimetro = function(){        
        perim=this.base*2+this.altura*2;
        console.log("el perimetro de este rectángulo es: "+perim.toFixed(2));
        return perim;
    };

    
}
let rectangulo1 = new Rectangulos(15,9);
console.log(`La base y altura del rectántulo son: ${rectangulo1.base} y ${rectangulo1.altura}`);
rectangulo1.area();
rectangulo1.perimetro();


//////////////////////////////

/*Ejercicio 3: 
Crea un objeto triángulo con propiedades base, altura y lados.
Agrega métodos para calcular el área y el perímetro.*/

function Triangulos (base, altura, lado1,lado2,lado3 ){
    this.base = base,
    this.altura= altura,
    this.lado1 = lado1,
    this.lado2 = lado2,
    this.lado3 = lado3,
    this.area = function(){        
        area=this.base * this.altura / 2;
        console.log("el area de este triángulo es: "+area.toFixed(2));
        return area;
    },
    this.perimetro = function(){        
        perim=this.lado1+this.lado2+this.lado3;
        console.log("el perimetro de este triangulo es: "+perim.toFixed(2));
        return perim;
    }
}
let triangulo1 = new Triangulos(15,9,3,5,9);
console.log(`La base y altura del triangulo son: ${triangulo1.base} y ${triangulo1.altura}`);
triangulo1.area();
triangulo1.perimetro();

////

let figuras = [];
figuras.push(new Rectangulos(2,4),
            new Circulos(5),
            new Triangulos(5,8,3,8,9)
);
for (let figura of figuras){
    console.log(`El elemento es un ${typeof figura}`);
    console.log(`perímetro: ${figura.perimetro()}`);
    console.log(`área: ${figura.area()}`)
}
//si colocamos una propiedad con el nombre de la figura podríamos definirla en el console logf