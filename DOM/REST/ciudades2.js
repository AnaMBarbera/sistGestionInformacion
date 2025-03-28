let table = document.getElementById("ciudades-lista");

document.addEventListener("DOMContentLoaded", initCiudades);

function initCiudades(){
    fetch("http://localhost:3000/ciudades2",{
        method: 'GET'})
    .then(response => response.json())
    .then(ciudades => {
        let tabla = document.getElementById("ciudades-lista");
        ciudades.forEach(ciudad => {
            let fila = document.createElement("tr");
            fila.innerHTML = `
                <td>${ciudad.codigo}</td>
                <td>${ciudad.nombre}</td>
                <td>${ciudad.poblacion}</td>
                <td><button onclick="verCiudad('${ciudad.codigo}')">Ver</button></td>
            `;
            tabla.appendChild(fila);
        });
    })
    .catch(error => console.error("Error al cargar ciudades:", error));
};

function verCiudad(ciudadCode) {
    fetch("http://localhost:3000/ciudades2")
        .then(response => response.json())
        .then(ciudades => {
            // Buscar la ciudad correspondiente por código
            let ciudad = ciudades.find(c => c.codigo === ciudadCode);
            
            if (ciudad) {
                // Mostrar detalles de la ciudad
                alert(`Detalles de la ciudad: \nCódigo: ${ciudad.codigo}\nNombre: ${ciudad.nombre}\nPoblación: ${ciudad.poblacion}`);
            } else {
                alert("Ciudad no encontrada.");
            }
        })
        .catch(error => console.error("Error al obtener los detalles de la ciudad:", error));
}
