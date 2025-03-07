const fs = require ("fs");
const FILE_NAME_ARTS = "articulos.json";
const FILE_NAME_FILTER = "filtro.json"

function leerJSON(fileName) {
    let stringJSON = "";
    if (!fs.existsSync(fileName))
        stringJSON = '{"error": "no existe el fichero"}';
    else {
        stringJSON = fs.readFileSync(fileName,"utf-8");
    }
    return JSON.parse(stringJSON);
}
function aplicarFiltro(propiedadFiltro, valorFiltro, articulo, propiedadArticulo) {
    if (valorFiltro == "" || valorFiltro == 0) return true;
    // articulo["marca"] == "samsung"
    //return (articulo[propiedad] == valorFiltro) ? true : false;

    console.log(propiedadFiltro, articulo[propiedadArticulo], typeof(articulo[propiedadArticulo]));

    if (typeof(articulo[propiedadArticulo]) === "string") {
        return (articulo[propiedadArticulo].toUpperCase() == valorFiltro.toUpperCase());
    }

    console.log(`antes ${articulo[propiedadArticulo]} : ${valorFiltro}`)

    if (typeof(articulo[propiedadArticulo]) === "number") {
        if (propiedadFiltro.indexOf("min") > 0) {
            console.log(`minimo ${articulo[propiedadArticulo]} : ${valorFiltro}`)
            return (articulo[propiedadArticulo] >= valorFiltro);
        }
        else if (propiedadFiltro.indexOf("max") > 0) {
            console.log(`maximo ${articulo[propiedadArticulo]} : ${valorFiltro}`)
            return (articulo[propiedadArticulo] <= valorFiltro);
        } else {
            console.log(`filtro ${articulo[propiedadArticulo]} : ${valorFiltro}`)
            return (articulo[propiedadArticulo] == valorFiltro);
        }
    }

}

function filtrar(mobiles, filtro) {
    let articulos = mobiles.articulos;
    let filtrados = [];

    for (let item of articulos) {
        if (aplicarFiltro("marca", filtro.marca, item, "marca") &&
            aplicarFiltro("modelo", filtro.modelo, item, "modelo") &&
            aplicarFiltro("memoria_RAM", filtro.memoria_RAM, item, "memoria_RAM") &&
            aplicarFiltro("memoria_SD", filtro.memoria_SD, item, "memoria_SD") &&
            aplicarFiltro("nucleos", filtro.nucleos, item, "nucleos") && 
            aplicarFiltro("pulgadas_min", filtro.pulgadas_min, item, "pulgadas") && 
            aplicarFiltro("pulgadas_max", filtro.pulgadas_max, item, "pulgadas") && 
            aplicarFiltro("precio_min", filtro.precio_min, item, "precio") && 
            aplicarFiltro("precio_max", filtro.precio_max, item, "precio") 
            ) {
            filtrados.push(item);
        }
    }

    return filtrados;
}

let mobiles = leerJSON(FILE_NAME_ARTS);
let filtro = leerJSON(FILE_NAME_FILTER);

console.log(filtrar(mobiles, filtro));




