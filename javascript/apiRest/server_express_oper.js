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
    let suma = a+b;
    res.json(suma);
});

// 📌 Endpoint para obtener la resta
app.get("/resta/:a/:b", async (req, res) => {
    let resta = a-b;
    res.json(resta);
});

// 📌 Endpoint para obtener la multiplicacion
app.get("/multip/:a/:b", async (req, res) => {
    let multip = a*b;
    res.json(multip);
});

/*
    if (ciudad) {
        res.json(ciudad);
    } else {
        res.status(404).json({ error: "Ciudad no encontrada" });
    }
}); */

// Iniciar servidor
app.listen(PORT, () => {
    console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});

/*ponemos en marcha el servicio ejecutando este fichero
> node server_express_oper.js
*/




 