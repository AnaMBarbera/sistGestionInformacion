/**
 * Crea una función llamada determinarSigno que reciba un   número como parámetro.
    La función debe devolver "positivo" si el número es mayor que cero, "negativo" si es menor que cero, y "cero" si es exactamente cero.
 */

    function determinarSigno(num){
        if (isNaN(num)){
            return "Error: No es un número"
        }

        if(num>0){
            return "positivo";
        } else if(num<0) {
            return "negativo"
        } else {
            return "cero" ;
        }
    }

    //return (valor > 0) ? "Positivo" : (valor < 0) ? "negativo" : "Cero";

    const prompt = require("prompt-sync")();
    let num = parseInt(prompt("Escribe un número: "));
    console.log(determinarSigno(num));

