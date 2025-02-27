/* 7 columnas por 4 filas
tablero 4 en raya
clase Tablero
metodo nueva ficha
si se intenta meter una ficha en una columna llena dará error.
El programa pide al usuario en que columna quiere meter la ficha. hasta que el tablero se llene */

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
                this.celdas[i].push(0);
            }
        }
    }

    colocarFicha(col){
        let pos = this.celdas[col].lastIndexOf(0); //busca el último cero en la columna indicada
        if (pos >=0 ){
            this.celdas[col][pos]="X";

        } else {
           //"La fila está llena"
           return -1;
        }
    }

    finPartida(){
        let lleno = true;
        for(let col of this.celdas){
            lleno = lleno && col[0] == "X"
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
    let col = parseInt(prompt("Columna? "));
    if (col<0 || col>=MAX_COLS){
        console.log ("La columna no es válida")
    } else {
        if (tablero.colocarFicha(col)===-1){
            console.log(`la columna ${col} está llena`);
        }
    }
    for (fila of tablero.pintar()){
        console.log(fila);
    }
}

tablero.colocarFicha(0);
tablero.colocarFicha(2);
tablero.colocarFicha(0);
tablero.colocarFicha(4);
tablero.colocarFicha(6);
tablero.colocarFicha(3);
tablero.colocarFicha(0);
tablero.colocarFicha(6);

for (fila of tablero.pintar()){
    console.log(fila);
}


///////////////////////////////

/*colocarFicha(){
        this.tablero = [[0,0,0,0],
                       [0,0,0,0],
                       [0,0,0,0],
                       [0,0,0,0],
                       [0,0,0,0],
                       [0,0,0,0],
                       [0,0,0,0],
                       ]

        do {
            this.columna=prompt("¿En qué columna vas a colocar la ficha? [1, 2, 3, 4, 5, 6, 7]: ");
            
                tablero[this.tablero.lentht-1][columna]=1;
                if (tablero[this.tablero.lentht-1][columna]=1){

                }
                

            
            if (tablero[0]==[1,1,1,1,1,1]){
                console.log("El tablero ya está lleno")
            }
            else {
                for (col of tablero){
                    if (tablero[0][col]==1){
                        console.log("la columna ya está llena. Elige otra")
                    } 
                } 
            }

        } while (tablero[0]==[1,1,1,1,1,1]);

    }*/