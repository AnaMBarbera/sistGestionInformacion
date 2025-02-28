const prompt = require("prompt-sync")();
const MAX_COLS = 7;
const MAX_ROWS = 4;

const PLAYER_A = "X";
const PLAYER_B = "0";
const CELDA_VACIA = "_";


class Tablero {
    celdas = [];
    // celdas = [ [0,0,0,0], [0,0,X,X] , [0,0,0,0]   ]
 
    //0 0 0
    //0 0 0
    //0 X 0
    //0 X 0


    inicializar() {
        for (let i = 0; i < this.columnas; i++){
            this.celdas.push([]);
            for(let j = 0; j < this.filas; j++){
                this.celdas[i].push(CELDA_VACIA);
            }
        }
    }

    constructor (filas, columnas) {
        this.filas = filas;
        this.columnas = columnas;
        this.inicializar();
    }

    colocarFicha(col, ficha) {
        let pos = this.celdas[col].lastIndexOf(CELDA_VACIA);
        if (pos >= 0) {
            this.celdas[col][pos] = ficha;
        } else {
            // La ficha no cabe en esta columna
            return -1;
        }
    }

    estarLLeno() {
        let lleno = true;
        for (let col of this.celdas) {
            lleno = lleno && (col[0] !== CELDA_VACIA); 
        }
        return lleno;
    }

    pintar(){
        let salida = [];
        for (let i = 0 ; i < MAX_ROWS; i++) {
            let fila = "";
            for (let j = 0; j < MAX_COLS; j++) {
                fila = fila + " " + this.celdas[j][i];
            }
            salida.push(fila);
        }
        return salida;
    }

}

let tablero = new Tablero(MAX_ROWS, MAX_COLS);
let jugador = "A";

for (fila of tablero.pintar()) {
    console.log(fila);
}

while (!tablero.estarLLeno()) {
    let col = parseInt(prompt("Columna? "));
    
    let ficha = (jugador === "A" ? PLAYER_A : PLAYER_B);

    if (col < 0 || col >= MAX_COLS) {
        console.log("El número de columna no es válido");
    } else {
        if (tablero.colocarFicha(col, ficha) === -1) {
            console.log(`La columna ${col} está llena`);
        } else {
            jugador = (jugador === "A") ? "B" : "A";
        }
    }
    console.log("*****************************")
    console.log("TURNO", jugador);
    console.log("*****************************")
    for (let fila of tablero.pintar()) {
        console.log(fila);
    }
    console.log("*****************************")
};


