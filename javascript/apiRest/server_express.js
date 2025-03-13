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

//📌 1. Modificar una ciudad (POST)
// Middleware para manejar JSON en el cuerpo de las solicitudes
app.use(express.json());
app.post("/ciudades/:codigo", async (req, res) => {
    const codigo = req.params.codigo.toUpperCase();
    /*el cuerpo(body)sería algo así:
     {"nombre": "Madrid Capital",
        "poblacion": 3500000}        
        */
    const {nombre, poblacion } = req.body;
    const ciudades = await cargarCiudades();
    const ciudad = ciudades.find(c => c.codigo === codigo);

    if (ciudad) {
        ciudad.nombre = nombre || ciudad.nombre;
        ciudad.poblacion = poblacion || ciudad.poblacion;

        await fs.writeFile("ciudades.json", JSON.stringify(ciudades, null, 2));
        res.json({ mensaje: "Ciudad actualizada", ciudad });
    } else {
        res.status(404).json({ error: "Ciudad no encontrada" });
    }
});
//Podemos modificar datos con Put también
app.put("/ciudades/:codigo", async (req, res) => {
    const codigo = req.params.codigo.toUpperCase();    
    const {nombre, poblacion } = req.body;
    const ciudades = await cargarCiudades();
    const ciudad = ciudades.find(c => c.codigo === codigo);

    if (ciudad) {
        ciudad.nombre = nombre || ciudad.nombre;
        ciudad.poblacion = poblacion || ciudad.poblacion;

        await fs.writeFile("ciudades.json", JSON.stringify(ciudades, null, 2));
        res.json({ mensaje: "Ciudad actualizada", ciudad });
    } else {
        res.status(404).json({ error: "Ciudad no encontrada" });
    }
});

//📌 2. Añadir una ciudad (lPUT, también funciona con POST)
app.put("/ciudades", async (req, res) => {
    const { codigo, nombre, poblacion } = req.body;
    const ciudades = await cargarCiudades();

    if (ciudades.find(c => c.codigo === codigo)) {
        return res.status(400).json({ error: "Código de ciudad ya existe" });
    }

    const nuevaCiudad = { codigo, nombre, poblacion };
    ciudades.push(nuevaCiudad);

    await fs.writeFile("ciudades.json", JSON.stringify(ciudades, null, 2));
    res.json({ mensaje: "Ciudad añadida", ciudad: nuevaCiudad });
});

//borrar una ciudad (DELETE)
app.delete("/ciudades/:codigo", async (req, res) => {
    const codigo = req.params.codigo.toUpperCase();
    const ciudades = await cargarCiudades();
    const index = ciudades.findIndex(c => c.codigo === codigo);

    if (index === -1) {
        return res.status(404).json({ error: "Ciudad no encontrada" });
    }

    const ciudadEliminada = ciudades.splice(index, 1);

    await fs.writeFile("ciudades.json", JSON.stringify(ciudades, null, 2));
    res.json({ mensaje: "Ciudad eliminada", ciudad: ciudadEliminada });
});



// Iniciar servidor
app.listen(PORT, () => {
    console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});





/*ponemos en marcha el servicio ejecutando este fichero
> node server_express.js
Para enviar peticiones:
en el navegador ponemos localhost: 3000 (puerto indicado en el server) / ciudades
 o localhost:3000/ciudades/MAD (Segun los gets indicados)
 o también podemos utilizar las extensiones postman o rest (fichero server_express.rest) */

/* Para que funcione en el fichero.rest
post http://localhost:3000/ciudades/MAD
Content-Type: application/json
(importante dejar esta línea de separación)
{
    "nombre": "Madrid Capital",
    "poblacion": 4500000
        } */
 
//PREFERIBLEMENTE UTILIZAR POST PARA MODIFICAR Y PUT PARA AÑADIR