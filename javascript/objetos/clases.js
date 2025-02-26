class Rectangulos {
    constructor (base, altura){    
    this._base = base,
    this._altura= altura,
    this._nombre = "Réctangulo" //con el guión bajo establecemos las propiedades como privadas
    }
    get nombre(){
        return this._nombre;
    }
    get base(){
        return this._base;
    }
    get altura(){
        return this._altura;
    }
    set base(valorNuevo) {
        this._base = valorNuevo;
    }
    set altura(valorNuevo) {
        this._altura = valorNuevo;
    }

    area(){        
       let area=this.base * this.altura;
        console.log("el area de este rectángulo es: "+area.toFixed(2));
        return area;
    }

    perimetro(){        
       let perim=this.base*2+this.altura*2;
        console.log("el perimetro de este rectángulo es: "+perim.toFixed(2));
        return perim;
    }
}
   

let rectangulo1 = new Rectangulos(15,9);
console.log(`La base y altura del rectángulo son: ${rectangulo1.base} y ${rectangulo1.altura}`);
rectangulo1.area();
rectangulo1.perimetro();

rectangulo1.altura = 20;
rectangulo1.base = 10;
console.log(`La base y altura del rectángulo son: ${rectangulo1.base} y ${rectangulo1.altura}`);
rectangulo1.area();
rectangulo1.perimetro();