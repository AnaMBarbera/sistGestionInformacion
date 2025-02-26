class Figura {
    constructor(nombre) {
        this.nombre = nombre;
    }   
    area() { throw "Método no implementado"; } // depende de la clase hija
    perimetro() { throw "Método no implementado"; }
}

class Rectangulo extends Figura {
    constructor(nombre, base, altura) {
        super(nombre);
        this.base = base;
        this.altura = altura;
    }
    area() { return this.base * this.altura; }
    perimetro() { return 2 * (this.base + this.altura); }
}

class Circulo extends Figura {
    constructor(nombre, radio) {
        super(nombre);
        this.radio = radio;
    }  
    area() { return Math.PI * this.radio ** 2; }
    perimetro() { return 2 * Math.PI * this.radio; }
}

class Triangulo extends Figura{
    constructor(nombre, base, altura, lado1, lado2, lado3) {
        super(nombre);
        this.base = base;
        this.altura = altura;
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }
    area() { return this.base * this.altura / 2 }
    perimetro() { return this.lado1 + this.lado2 + this.lado3 }

}

let r = new Rectangulo('Rectangulo', 10, 5);
let c = new Circulo('Círculo', 5);
let t = new Triangulo ('Triangulo', 5, 10, 6, 7, 8)

console.log("Área de :", r.nombre, r.area());
console.log("Perímetro de :", r.nombre, r.perimetro());
console.log("Área de :", c.nombre, c.area());
console.log("Perímetro de :", c.nombre, c.perimetro());
console.log("Área de :", t.nombre, t.area());
console.log("Perímetro de :", t.nombre, t.perimetro());

//////////////////////////


class Animal {
    constructor(nombre, edad) {
        this.nombre = nombre;
        this.edad = edad;
    }   
    presentarse() { throw "Método no implementado"; } // depende de la clase hija    
}

class Gato extends Animal {
    constructor(nombre, edad) {
        super(nombre, edad);       
    }
    presentarse() { return console.log(`Soy un gato me llamo ${this.nombre} y tengo ${this.edad} años`); }    
}

class Perro extends Animal {
    constructor(nombre, edad) {
        super(nombre, edad);       
    }  
    presentarse() { return console.log(`Soy un perro me llamo ${this.nombre} y tengo ${this.edad} años`); }    
}


let gato1 = new Gato('Tobi', 10);
gato1.presentarse();
let perro1 = new Perro('Manolo', 8);
perro1.presentarse();