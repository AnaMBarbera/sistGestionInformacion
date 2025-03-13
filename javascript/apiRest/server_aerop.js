const express = require("express");
const fs = require("fs/promises"); // Uso de fs con promesas para async/await
const app = express();
const PORT = 3000;

// Función para leer el JSON de ciudades y aeropuertos
async function obtenerCiudadesAerop() {
    try {
        const data = await fs.readFile("ciudad_aerop.json", "utf-8");
        //Si el archivo.json no está en la misma carpeta que el server_express, hay que poner la ruta. Ej ./data/ciudades.json
        return JSON.parse(data);
    } catch (error) {
        console.error("Error al leer el archivo JSON", error); 
        return [];
    }
}

    // 📌 Endpoint para obtener todas las ciudades
    app.get("/ciudadAerop", async (req, res) => {
        const ciudades = await obtenerCiudadesAerop();
        res.json(ciudades);
    });

    // 📌 Endpoint para obtener una ciudad con sus aropuertos
    app.get("/ciudadAerop/:codigo/aeropuertos", async (req, res) => {
        const codigo = req.params.codigo.toUpperCase();
        const ciudades = await obtenerCiudadesAerop();
        const ciudad = ciudades.find(c => c.codigo === codigo);

        if (ciudad) {
            res.json({ciudad: ciudad.nombre, aeropuertos:ciudad.aeropuertos});
        } else {
            res.status(404).json({ error: "Ciudad no encontrada" });
        }
    });

    // Middleware para manejar JSON en el cuerpo de las solicitudes
    app.use(express.json());

    //📌 2. Añadir una ciudad (POST)
    app.post("/ciudadAerop/:codigo", async (req, res) => {
        const { codigo, nombre, poblacion, aeropuertos } = req.body;
        const ciudades = await obtenerCiudadesAerop();

        if (ciudades.find(c => c.codigo === codigo)) {
            return res.status(400).json({ error: "Código de ciudad ya existe" });
        }

        const nuevaCiudad = { codigo, nombre, poblacion, aeropuertos };
        ciudades.push(nuevaCiudad);

        await fs.writeFile("ciudad_aerop.json", JSON.stringify(ciudades, null, 2));
        res.json({ mensaje: "Ciudad añadida", ciudad: nuevaCiudad });
    });

    //📌 2. Añadir una aeropuerto a una ciudad
    app.post("/ciudadAerop/:codigo/aeropuertos", async (req, res) => {
        const { codigo, nombre } = req.body;  // Obtener el código y nombre del aeropuerto del cuerpo
        const ciudades = await obtenerCiudadesAerop();
        // Buscar la ciudad con el código que se pasa por parámetro
        const ciudad = ciudades.find(c => c.codigo === req.params.codigo);    
        if (!ciudad) {
            return res.status(404).json({ error: "Ciudad no encontrada" });
        }
        // Verificar si el aeropuerto ya existe en esa ciudad
        if (ciudad.aeropuertos.find(a => a.codigo === codigo)) {
            return res.status(400).json({ error: "Código de aeropuerto ya existe" });
        }
        // Crear el nuevo aeropuerto
        const nuevoAeropuerto = { codigo, nombre };    
        // Añadir el aeropuerto a la ciudad correspondiente
        ciudad.aeropuertos.push(nuevoAeropuerto);
        // Guardar el archivo actualizado
        await fs.writeFile("ciudad_aerop.json", JSON.stringify(ciudades, null, 2));
        // Responder con el mensaje de éxito
        res.json({ mensaje: "Aeropuerto añadido", aeropuerto: nuevoAeropuerto });
    });

    //Eliminar un aeropuerto de una ciudad
    app.delete("/ciudadAerop/:codigo/aeropuertos/:codigoAerop", async (req, res) => {
        const ciudadCodigo = req.params.codigo.toUpperCase();
        const aeropuertoCodigo = req.params.codigoAerop.toUpperCase();
        const ciudades = await obtenerCiudadesAerop();
        
        const ciudad = ciudades.find(c => c.codigo === ciudadCodigo);
        if (!ciudad) {
            return res.status(404).json({ error: "Ciudad no encontrada" });
        }

        const aeropuertoIndex = ciudad.aeropuertos.findIndex(a => a.codigo === aeropuertoCodigo);
        if (aeropuertoIndex === -1) {
            return res.status(400).json({ error: "Aeropuerto no encontrado" });
        }
        
        const aeropuertoEliminado = ciudad.aeropuertos.splice(aeropuertoIndex, 1)[0];

        await fs.writeFile("ciudad_aerop.json", JSON.stringify(ciudades, null, 2));
        res.json({ mensaje: "Aeropuerto eliminado", aeropuerto: aeropuertoEliminado });
    });

    //Dado el código de un aeropuerto, obtener la ciudad a la que pertenece
    app.get("/aeropuerto/:codigo", async (req, res) => {
        const aeropuertoCodigo = req.params.codigo.toUpperCase();
        const ciudades = await obtenerCiudadesAerop();
    
        // Buscar el aeropuerto en todas las ciudades
        const ciudadEncontrada = ciudades.find(ciudad =>
            ciudad.aeropuertos.some(aeropuerto => aeropuerto.codigo === aeropuertoCodigo)
        );    
        if (!ciudadEncontrada) {
            return res.status(404).json({ error: "Aeropuerto no encontrado" });
        }    
        // Obtener la ciudad y el aeropuerto
        const aeropuerto = ciudadEncontrada.aeropuertos.find(aeropuerto => aeropuerto.codigo === aeropuertoCodigo);
    
        res.json({
            ciudad: ciudadEncontrada.nombre,
            aeropuerto: aeropuerto.nombre,
            codigo_ciudad: ciudadEncontrada.codigo,
            codigo_aeropuerto: aeropuerto.codigo
        });
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
 