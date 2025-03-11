const express = require("express");
const fs = require("fs/promises"); // Uso de fs con promesas para async/await
const app = express();
const PORT = 3000;

// Función para leer el JSON de ciudades
async function cargarCiudades() {
    try {
        const data = await fs.readFile("ciudades.json", "utf-8");
        //Si el archivo.json no está en la misma carpeta que el server_express, hay que poner la ruta. Ej ./data/ciudades.json
        return JSON.parse(data);
    } catch (error) {
        console.error("Error al leer el archivo JSON", error); 
        return [];
    }
}

// 📌 Endpoint para obtener todas las ciudades
app.get("/ciudades", async (req, res) => {
    const ciudades = await cargarCiudades();
    res.json(ciudades);
});

// 📌 Endpoint para obtener una ciudad por su código
app.get("/ciudades/:codigo", async (req, res) => {
    const codigo = req.params.codigo.toUpperCase();
    const ciudades = await cargarCiudades();
    const ciudad = ciudades.find(c => c.codigo === codigo);

    if (ciudad) {
        res.json(ciudad);
    } else {
        res.status(404).json({ error: "Ciudad no encontrada" });
    }
});

// Iniciar servidor
app.listen(PORT, () => {
    console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});

/*ponemos en marcha el servicio ejecutando este fichero
> node server_express.js
en el navegador ponemos localhost: 3000 (puerto indicado en el server) / ciudades
 o localhost:3000/ciudades/MAD (Segun los gets indicados) */


 /*
 Crear un servidor con las siguientes rutas:
 - /suma/:a/:b devuelva en un json, a, b y la suma
 - /resta/:a/:b devuelva en un json a, b y la resta
 -/multip..
 -/division.. ojo que devuelva error si b es 0
 - /divisor .. que devuelva true si a es divisible por b

 Todas las respuestas deben ser un json y los métodos GET */

 