const prompt = require("prompt-sync")();
const MAX_COLS = 7;
const MAX_ROWS =4;


class Tablero {  
    celdas = [];
    constructor(filas, columnas) {
        this.filas = filas;
        this.columnas = columnas;
        this.inicializar();
    }

    inicializar(){
        for (let i =0; i <this.columnas; i++){
            this.celdas.push([]);
            for(let j=0; j<this.filas; j++){
                this.celdas[i].push("_");
            }
        }
    }

    colocarFicha(col, ficha){        
        let pos = this.celdas[col].lastIndexOf(CELDA_VACIA); //busca el último cero en la columna indicada
        if (pos >=0 ){
            if (jugador=="1")
            this.celdas[col][pos]="X";
            if (jugador=="2")
                this.celdas[col][pos]=ficha;

        } else {
           //"La fila está llena"
           return -1;
        }
    }

    finPartida(){
        let lleno = true;
        for(let col of this.celdas){
            lleno = lleno && col[0]!=CELDA_VACIA;
        }
        return lleno;
    }
    
    pintar(){
        let salida = [];
        for (let i = 0; i<MAX_ROWS; i++){
                let fila = "";
                for (let j =0; j < MAX_COLS; j++){
                    fila = fila + " "+ this.celdas [j][i];
                }
                salida.push(fila);
        }        
        return salida;
    }
}

let tablero = new Tablero (MAX_ROWS, MAX_COLS);
for (fila of tablero.pintar()){
    console.log(fila);
}

while (!tablero.finPartida()){
    let jugador = prompt("Jugador?  [1 , 2]: ");
    let col = parseInt(prompt("Columna? "));
    if (col<0 || col>=MAX_COLS){
        console.log ("La columna no es válida")
    } else {
        if (tablero.colocarFicha(col, jugador)===-1){
            console.log(`la columna ${col} está llena`);
        }
    }

    for (fila of tablero.pintar()){
        console.log(fila);
    }
}

/////////////////