/*
 Crear un servidor con las siguientes rutas:
 - /suma/:a/:b devuelva en un json, a, b y la suma
 - /resta/:a/:b devuelva en un json a, b y la resta
 -/multip..
 -/division.. ojo que devuelva error si b es 0
 - /divisor .. que devuelva true si a es divisible por b

 Todas las respuestas deben ser un json y los métodos GET */

const express = require("express");
const fs = require("fs/promises"); // Uso de fs con promesas para async/await
const app = express();
const PORT = 3000;


// 📌 Endpoint para obtener la suma
app.get("/suma/:a/:b", async (req, res) => {
    let a = req.params.a; // Obtener el valor de a desde los parámetros
    let b = req.params.b;
    let suma = parseInt(a) + parseInt(b);
    res.json(`{op1: ${a}, op2: ${b}, suma: ${suma}}`);
});

// 📌 Endpoint para obtener la resta
app.get("/resta/:a/:b", async (req, res) => {
    let a = req.params.a; // Obtener el valor de a desde los parámetros
    let b = req.params.b;
    let resta = parseInt(a) - parseInt(b);
    res.json(`{op1: ${a}, op2: ${b}, resta: ${resta}}`);
});

// 📌 Endpoint para obtener la multiplicacion
app.get("/multip/:a/:b", async (req, res) => {
    let a = req.params.a; // Obtener el valor de a desde los parámetros
    let b = req.params.b;    
    let division = parseInt(a) * parseInt(b);
    res.json(`{op1: ${a}, op2: ${b}, multiplicación: ${multip}}`);
});

// 📌 Endpoint para obtener la division
app.get("/division/:a/:b", async (req, res) => {
    let a = req.params.a; // Obtener el valor de a desde los parámetros
    let b = req.params.b;
    if (b==0){
        res.status(404).json({ error: "el operador b es 0" });
    } else {    
    let division = parseInt(a) / parseInt(b);
    res.json(`{op1: ${a}, op2: ${b}, división: ${division}}`);
    }
});

// 📌 Endpoint para obtener eldivisor
app.get("/divisor/:a/:b", async (req, res) => {
    let a = req.params.a; // Obtener el valor de a desde los parámetros
    let b = req.params.b;       
    let divisor = parseInt(a) % parseInt(b);
    if ((a % b)){
        res.status(404).json({ error: `${a} no es divisible por ${b}` });
    } else {  
    res.json(`{op1: ${a}, op2: ${b}, divisor: ${divisor}, true}`);
    } 
});

/*el res.json nos está devolviendo un string (hay que hacer un parse)
ej: resultado = JSON.parse(resta(req.params.a, req.params.b));
    res.json(resultado);
*/

// Iniciar servidor
app.listen(PORT, () => {
    console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});

/*ponemos en marcha el servicio ejecutando este fichero
> node server_express_oper.js
*/




 