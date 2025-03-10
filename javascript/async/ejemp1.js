
//Event loop

console.log("Inicio");

setTimeout(() => {
    console.log("Mensaje dentro de setTimeout");
}, 0);

console.log("Fin");

//--------------------------

//CallBack

function operacion(a, b, callback) {
    let resultado = a + b;
    callback(resultado);
}

function mostrarResultado(resultado) {
    console.log("El resultado es:", resultado);
}

// Uso de un callback
operacion(5, 3, mostrarResultado); 

// callback anónimo, función flecha
operacion(10, 20, resultado => console.log("El resultado es:", resultado)); 

// callback anónimo, función tradicional
operacion(15, 25, function(resultado) {
    console.log("El resultado es:", resultado);
});

//-----------------------

//Callback hell (código difícil de leer y mantener)
function paso1(callback) {
    setTimeout(() => {
        console.log("Paso 1 completado");
        callback();
    }, 1000);
}

function paso2(callback) {
    setTimeout(() => {
        console.log("Paso 2 completado");
        callback();
    }, 1000);
}

function paso3() {
    setTimeout(() => {
        console.log("Paso 3 completado");
    }, 1000);
}

paso1(() => {
    paso2(() => {
        paso3();
    });
});