const fs = require("fs");
// 1. Función para cargar un archivo JSON desde el sistema de archivos
function cargarJSON(ruta) {
    try {
        const datos = fs.readFileSync(ruta, "utf8"); // Leemos el archivo de forma síncrona
        return JSON.parse(datos); // Convertimos el contenido a un objeto JavaScript
    } catch (error) {
        console.error(`Error al cargar el archivo ${ruta}:`, error);
        return null;
    }
}

// 2. Función principal para ejecutar el filtrado
function iniciarFiltrado() {
    // Cargar datos desde los archivos JSON
    const articulos = cargarJSON("articulos.json");
    const filtros = cargarJSON("filtros.json");
    if (!articulos || !filtros) {
        console.error("No se pudieron cargar los datos.");
        return;
    }

    // Aplicamos el filtrado
    const articulosFiltrados = filtrarArticulos(articulos.articulos, filtros);

    // Mostramos los resultados en la consola
    console.log("Artículos filtrados:", articulosFiltrados);
}

// 3. Función para filtrar los artículos según los criterios
function filtrarArticulos(articulos, filtros) {
    let articulosFiltrados = [];

    for (let i = 0; i < articulos.length; i++) {
            let articulo = articulos[i];

        // Usamos la función cumpleFiltros para verificar si el artículo debe incluirse
        if (cumpleFiltros(articulo, filtros)) {
            articulosFiltrados.push(articulo);
        }
    }

    return articulosFiltrados;
}


// 4. Función para verificar si un artículo cumple los filtros
function cumpleFiltros(articulo, filtros) {
    return cumpleMarca(articulo.marca, filtros.marca) &&
        cumplePulgadas(articulo.pulgadas, filtros.pulgadas_min, filtros.pulgadas_max) &&
        cumplePrecio(articulo.precio, filtros.precio_min, filtros.precio_max);
}

// 5. Función para comprobar si la marca coincide (si está vacía, acepta todas)
function cumpleMarca(marcaArticulo, marcaFiltro) {
    if (marcaFiltro === "" || marcaFiltro === undefined) {
        return true; // No se aplica filtro de marca
    }
    return marcaArticulo === marcaFiltro;
}

// 6. Función para comprobar si el artículo está dentro del rango de pulgadas
function cumplePulgadas(pulgadasArticulo, min, max) {
    if (min === 0 && max === 0) {
        return true; // No se aplica filtro de pulgadas
    }
    return pulgadasArticulo >= min && pulgadasArticulo <= max;
}

// 7. Función para comprobar si el artículo está dentro del rango de precios
function cumplePrecio(precioArticulo, min, max) {
    if (min === 0 && max === 0) {
        return true; // No se aplica filtro de precio
    }
    return precioArticulo >= min && precioArticulo <= max;
}

// 8. Ejecutamos la función principal
//iniciarFiltrado();