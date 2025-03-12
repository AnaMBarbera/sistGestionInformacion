const express = require("express");
const fs = require("fs/promises"); // Uso de fs con promesas para async/await
const app = express();
const PORT = 3000;

// Funciones con "operacion"es matemáticas

function suma(a, b) {
    if (isNaN(a) || isNaN(b)) {
        return `{ "operador1": "${a}", "operador2": "${b}", "operacion":"+", "resultado": "Error parámetros" }`
    }

    a = parseInt(a);
    b = parseInt(b);
    return `{ "operador1": ${a}, "operador2": ${b}, "operacion":"+", "resultado": ${a+b} }`
}

function resta(a, b) {
    if (isNaN(a) || isNaN(b)) {
        return `{ "operador1": "${a}", "operador2": "${b}", "operacion":"-", "resultado": "Error parámetros" }`
    }

    a = parseInt(a);
    b = parseInt(b);
    return `{ "operador1": ${a}, "operador2": ${b}, "operacion":"-", "resultado": ${a-b} }`
}

function multiplicacion(a, b) {
    if (isNaN(a) || isNaN(b)) {
        return `{ "operador1": "${a}", "operador2": "${b}", "operacion":"*", "resultado": "Error parámetros" }`
    }

    a = parseInt(a);
    b = parseInt(b);
    return `{ "operador1": ${a}, "operador2": ${b}, "operacion":"*", "resultado": ${a*b} }`
}

function division(a, b) {
    if (isNaN(a) || isNaN(b)) {
        return `{ "operador1": "${a}", "operador2": "${b}", "operacion":"/", "resultado": "Error parámetros" }`
    }

    if (b == 0) {
        return `{ "operador1": "${a}", "operador2": "${b}", "operacion":"/", "resultado": "Error división por 0" }`
    }

    a = parseInt(a);
    b = parseInt(b);
    return `{ "operador1": ${a}, "operador2": ${b}, "operacion":"/", "resultado": ${a/b} }`
}


function divisor(a, b) {
    if (isNaN(a) || isNaN(b)) {
        return `{ "operador1": "${a}", "operador2": "${b}", "operacion":"%", "resultado": "Error parámetros" }`
    }

    if (b == 0) {
        return `{ "operador1": "${a}", "operador2": "${b}", "operacion":"%", "resultado": "Error división por 0" }`
    }

    a = parseInt(a);
    b = parseInt(b);
    return `{ "operador1": ${a}, "operador2": ${b}, "operacion":"%", "resultado": ${ (a % b) === 0} }`
}


// 📌 Endpoint para la suma
app.get("/suma/:a/:b", async (req, res) => {
    resultado = JSON.parse(suma(req.params.a, req.params.b));
    res.json(resultado);
});

// Endpoint para la resta
app.get("/resta/:a/:b", async (req, res) => {
    resultado = JSON.parse(resta(req.params.a, req.params.b));
    res.json(resultado);
});

// Endpoint para la multiplicacion
app.get("/multiplicacion/:a/:b", async (req, res) => {
    resultado = JSON.parse(multiplicacion(req.params.a, req.params.b));
    res.json(resultado);
});

// Endpoint para la division
app.get("/division/:a/:b", async (req, res) => {
    resultado = JSON.parse(division(req.params.a, req.params.b));
    res.json(resultado);
});

// Endpoint para la divisor
app.get("/divisor/:a/:b", async (req, res) => {
    resultado = JSON.parse(divisor(req.params.a, req.params.b));
    res.json(resultado);
});


// Iniciar servidor
app.listen(PORT, () => {
    console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});
