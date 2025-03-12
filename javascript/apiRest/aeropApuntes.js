const express = require("express");
const fs = require("fs/promises");
const app = express();
const PORT = 3000;

async function cargarCiudades() {
    try {
        const
        data = await fs.readFile("ciudades.json", "utf-8");
        return JSON.parse(data);
    } catch (error) {     
        console.error("Error al leer el archivo JSON", error);
        return [];
    }
}

/**
 * Obtiene todos los aeropuertos de una ciudad
 */

app.get("/ciudades/:codigo/aeropuertos", async (req, res) => {
    const codigo = req.params.codigo.toUpperCase();
    const ciudades = await cargarCiudades();
    const ciudad = ciudades.find(c => c.codigo === codigo);

    if (ciudad) {
        res.json(ciudad.aeropuertos);
    } else {
        res.status(404).json({ error: "Ciudad no encontrada" });
    }
});

/**
 * Añade una ciudad
 */

app.post("/ciudades/:codigo", async (req, res) => {
    const codigo = req.params.codigo.toUpperCase();
    const { nombre, poblacion } = req.body;
    const ciudades = await cargarCiudades();
    const ciudad = ciudades.find(c => c.codigo === codigo);

    if (!ciudad) {
        ciudad.nombre = nombre || ciudad.nombre;
        ciudad.poblacion = poblacion || ciudad.poblacion;
        ciudad.aeropuertos = [];
        await fs.writeFile("ciudades.json", JSON.stringify(ciudades, null, 2));
        res.json({ mensaje: "Ciudad añadida", ciudad });
    } else {
        res.status(404).json({ error: "Código de ciudad repetido" });
    }
});

/**
 * Añade un aeropuerto a una ciudad
 */

app.post("/ciudades/:codigo/aeropuertos", async (req, res) => {
    const codigo = req.params.codigo.toUpperCase();
    const { codigo_aeropuerto, nombre } = req.body;
    const ciudades = await cargarCiudades();
    const ciudad = ciudades.find(c => c.codigo === codigo);

    if (ciudad) {
        ciudad.aeropuertos.push({ codigo: codigo_aeropuerto, nombre });
        await fs.writeFile("ciudades.json", JSON.stringify(ciudades, null, 2));
        res.json({ mensaje: "Aeropuerto añadido", aeropuerto: { codigo: codigo_aeropuerto, nombre } });
    } else {
        res.status(404).json({ error: "Ciudad no encontrada" });
    }
});

/**
 * Elimina un aeropuerto de una ciudad
 */

app.delete("/ciudades/:codigo/aeropuertos/:codigo_aeropuerto", async (req, res) => {
    const codigo = req.params.codigo.toUpperCase();
    const codigo_aeropuerto = req.params.codigo_aeropuerto.toUpperCase();
    const ciudades = await cargarCiudades();
    const ciudad = ciudades.find(c => c.codigo === codigo);

    if (ciudad) {
        const index = ciudad.aeropuertos.findIndex(a => a.codigo === codigo_aeropuerto);

        if (index !== -1) {
            const aeropuertoEliminado = ciudad.aeropuertos.splice(index, 1);
            await fs.writeFile("ciudades.json", JSON.stringify(ciudades, null, 2));
            res.json({ mensaje: "Aeropuerto eliminado", aeropuerto: aeropuertoEliminado });
        } else {
            res.status(404).json({ error: "Aeropuerto no encontrado" });
        }
    } else {
        res.status(404).json({ error: "Ciudad no encontrada" });
    }
});

/**
 * Obtiene la ciudad a la que pertenece un aeropuerto
 */

app.get("/aeropuertos/:codigo", async (req, res) => {
    const codigo = req.params.codigo.toUpperCase();
    const ciudades = await cargarCiudades();
    const ciudad = ciudades.find(c => c.aeropuertos.some(a => a.codigo === codigo));

    if (ciudad) {
        const aeropuerto = ciudad.aeropuertos.find(a => a.codigo === codigo);
        res.json({ ciudad: ciudad.nombre, aeropuerto });
    } else {
        res.status(404).json({ error: "Aeropuerto no encontrado" });
    }
});

// Iniciar servidor

app.listen(PORT, () => {
    console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});