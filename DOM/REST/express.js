// servidor.js (Node.js)
const express = require("express");
const fs = require("fs/promises");
const cors = require("cors");
const app = express();
const PORT = 3000;

app.use(cors());
// Middleware para servir archivos estáticos (como HTML, CSS, JS)
app.use(express.static('public'));


app.get("/ciudades2", async (req, res) => {    
    const ciudades2 = await cargarCiudades();    
    res.json(ciudades2);
});

async function cargarCiudades() {
    try {
        const data = await fs.readFile("ciudades2.json", "utf-8");
        //Si el archivo.json no está en la misma carpeta que el server_express, hay que poner la ruta. Ej ./data/ciudades.json
        return JSON.parse(data);
    } catch (error) {
        console.error("Error al leer el archivo JSON", error); 
        return [];
    }
}

app.listen(PORT, () => {
    console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});
