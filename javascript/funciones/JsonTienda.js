const fs = require("fs");

// Leer los artículos desde el archivo mobiles.json
let datos = {};
let jsonMobiles = fs.readFileSync("mobiles.json", "utf-8");
datos = JSON.parse(jsonMobiles);
let articulos = datos.articulos;

// Mostrar la información de los artículos
console.log("Información de los móviles");
console.log("==============================");
for (let movil of articulos) {
    console.log(`Marca: ${movil.marca}, Modelo: ${movil.modelo}, RAM: ${movil.memoria_RAM}, SD: ${movil.memoria_SD}, Nucleos: ${movil.nucleos}, Pulgadas: ${movil.pulgadas}, Precio: ${movil.precio}`);
}

// Leer los filtros desde el archivo filtro.json
let datos2 = {};
let jsonFiltros = fs.readFileSync("filtro.json", "utf-8");
datos2 = JSON.parse(jsonFiltros);

// Filtros leídos del archivo JSON
let filtros = {
    marca: datos2.marca || "", // Si marca está vacía, se asigna una cadena vacía
    modelo: datos2.modelo || "", // Lo mismo para modelo
    memoria_RAM: (datos2.memoria_RAM && datos2.memoria_RAM !== "") ? { min: datos2.memoria_RAM, max: datos2.memoria_RAM } : {},
    memoria_SD: (datos2.memoria_SD && datos2.memoria_SD !== "") ? { min: datos2.memoria_SD, max: datos2.memoria_SD } : {},
    nucleos: (datos2.nucleos && datos2.nucleos !== 0) ? { min: datos2.nucleos, max: datos2.nucleos } : {},
    pulgadas_min: datos2.pulgadas_min || 0,
    pulgadas_max: datos2.pulgadas_max || 0,
    precio_min: datos2.precio_min || 0,
    precio_max: datos2.precio_max || 0
};


/*
En filtro.json, memoria_RAM, memoria_SD y nucleos son cadenas vacías o valores 0. Si el valor no es vacío (ni una cadena vacía "" ni 0), entonces se crea un objeto con las propiedades min y max usando los valores del filtro.
let filtros = {
    marca: "Samsung",         // Se asigna "Samsung"
    modelo: "",               // Se asigna una cadena vacía (no se filtra por modelo)
    memoria_RAM: {},          // No se crea el filtro de memoria RAM (vacío)
    memoria_SD: {},           // No se crea el filtro de memoria SD (vacío)
    nucleos: {},              // No se crea el filtro de núcleos (vacío)
    pulgadas_min: 6.1,        // Se asigna el valor 6.1
    pulgadas_max: 8.1,        // Se asigna el valor 8.1
    precio_min: 799.99,       // Se asigna el valor 799.99
    precio_max: 999.99        // Se asigna el valor 999.99
}
*/

console.log("Filtros");
console.log(filtros);

// Función para filtrar los artículos según los filtros
function filtrarArticulos(articulos, filtros) {
    return articulos.filter(articulo => {
        return (
            (filtros.marca ? articulo.marca === filtros.marca : true) &&
            (filtros.modelo ? articulo.modelo.includes(filtros.modelo) : true) &&
            // Verifica si los filtros de memoria RAM están dentro del rango
            (filtros.memoria_RAM.min > 0 ? articulo.memoria_RAM >= filtros.memoria_RAM.min : true) &&
            (filtros.memoria_RAM.max > 0 ? articulo.memoria_RAM <= filtros.memoria_RAM.max : true) &&
            // Verifica si los filtros de memoria SD están dentro del rango
            (filtros.memoria_SD.min > 0 ? articulo.memoria_SD >= filtros.memoria_SD.min : true) &&
            (filtros.memoria_SD.max > 0 ? articulo.memoria_SD <= filtros.memoria_SD.max : true) &&
            // Verifica si los filtros de nucleos están dentro del rango
            (filtros.nucleos.min > 0 ? articulo.nucleos >= filtros.nucleos.min : true) &&
            (filtros.nucleos.max > 0 ? articulo.nucleos <= filtros.nucleos.max : true) &&
            // Verifica si las pulgadas están dentro del rango
            (filtros.pulgadas_min ? articulo.pulgadas >= filtros.pulgadas_min : true) &&
            (filtros.pulgadas_max ? articulo.pulgadas <= filtros.pulgadas_max : true) &&
            // Verifica si el precio está dentro del rango
            (filtros.precio_min ? articulo.precio >= filtros.precio_min : true) &&
            (filtros.precio_max ? articulo.precio <= filtros.precio_max : true)
        );
    });
}


// Función para obtener la cantidad de artículos que cumplen los filtros
function cantidadArticulos(articulos, filtros) {
    return filtrarArticulos(articulos, filtros).length;
}

// Función para verificar si hay artículos que cumplen los filtros
function hayArticulos(articulos, filtros) {
    return cantidadArticulos(articulos, filtros) > 0;
}

// Filtrar los artículos según los filtros
const articulosFiltrados = filtrarArticulos(articulos, filtros);

// Mostrar los artículos que cumplen con los filtros
console.log("\nArtículos que cumplen con los filtros:");
console.log("=====================================");
if (hayArticulos(articulos, filtros)) {
    articulosFiltrados.forEach(movil => {
        console.log(`Marca: ${movil.marca}, Modelo: ${movil.modelo}, RAM: ${movil.memoria_RAM}, SD: ${movil.memoria_SD}, Nucleos: ${movil.nucleos}, Pulgadas: ${movil.pulgadas}, Precio: ${movil.precio}`);
    });
} else {
    console.log("No se encontraron artículos que cumplan con los filtros.");
}


