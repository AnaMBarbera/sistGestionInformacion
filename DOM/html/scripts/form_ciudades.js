// JSON con las comunidades y sus provincias
const comunidades = {
    "Valenciana": ["Alicante", "Castellón", "Valencia"],
    "Catalana": ["Barcelona", "Gerona", "Lérida", "Tarragona"],
    "Madrileña": ["Madrid"],
    "Andaluza": ["Almería", "Cádiz", "Córdoba", "Granada", "Huelva", "Jaén", "Málaga", "Sevilla"]
};

let comunidadSelect = document.getElementById("comunidad");
let ciudadSelect = document.getElementById("ciudad");
let enviarBtn = document.getElementById("enviar");
let eliminarBtn = document.getElementById("eliminar");
let inputProv = document.getElementById("prov_agreg");
let agregarBtn = document.getElementById("agregar");

function initSelectComunity() {
    // Cargamos el desplegable con las comunidades
    for (let comunidad in comunidades) {
        let option = document.createElement("option");
        option.value = comunidad;
        option.textContent = comunidad;
        comunidadSelect.appendChild(option);
    }
    ciudadSelect.innerHTML = "<option value=''>Seleccione una ciudad</option>";
    ciudadSelect.disabled = true;
    enviarBtn.disabled = true;
};
function initSelectCity(){
    //comunidad seleccionada
    let comunidadSel = comunidadSelect.value;
    //aprovechamos para colocarla en el formulario de agregar provincia
    comSelect.textContent = comunidadSelect.value;      
    ciudadSelect.innerHTML = "<option value=''>Seleccione una ciudad</option>";
    ciudadSelect.disabled = true;
    enviarBtn.disabled = true;    
    if (comunidadSel) {
        ciudadSelect.disabled = false;
        comunidades[comunidadSel].forEach(ciudad => {
            let option = document.createElement("option");
            option.value = ciudad;
            option.textContent = ciudad;
            ciudadSelect.appendChild(option);
        });
    }
};
function activarBoton(){
    enviarBtn.disabled = !ciudadSelect.value;
};
function enviarDatos(){
    alert(`Comunidad: ${comunidadSelect.value}\nCiudad: ${ciudadSelect.value}`);
        comunidadSelect.value = "";
        ciudadSelect.innerHTML = "<option value=''>Seleccione una ciudad</option>";
        ciudadSelect.disabled = true;
        enviarBtn.disabled = true;
};
function agregarProvincia() {
    let nuevaCiudad = inputProv.value.trim();
    let nuevaCiudadVal = nuevaCiudad;
    let comunidadSel = comunidadSelect.value;
    if (inputProv.value.trim() !== '') {
        btnAgregar.disabled = false; // Habilitar el botón
    } else {
        btnAgregar.disabled = true; // Deshabilitar el botón
    }
    if (nuevaCiudad && comunidadSel && !comunidades[comunidadSel].includes(nuevaCiudad)) {
        // Agregar la nueva ciudad
        comunidades[comunidadSel].push(nuevaCiudad);

        // Actualizar el select de ciudades
        initSelectCity();

        // Limpiar el input
        inputProv.value = '';
        alert(`Ciudad ${nuevaCiudad} agregada a la comunidad ${comunidadSel}.`);
    } else if (!nuevaCiudad) {
        alert("Por favor ingrese el nombre de una ciudad.");
    } else if (comunidades[comunidadSel].includes(nuevaCiudad)) {
        alert("Esta ciudad ya está en la lista.");
    } else {
        alert("Seleccione una comunidad válida.");
    }
}
function eliminarProvincia() {
    let ciudadSel = ciudadSelect.value;
    let comunidadSel = comunidadSelect.value;

    if (ciudadSel && comunidadSel) {
        // Eliminar la ciudad seleccionada
        let index = comunidades[comunidadSel].indexOf(ciudadSel);
        if (index > -1) {
            comunidades[comunidadSel].splice(index, 1);
            // Actualizar el select de ciudades
            initSelectCity();
            alert(`Ciudad ${ciudadSel} eliminada de la comunidad ${comunidadSel}.`);
        }
    } else {
        alert("Seleccione una ciudad para eliminar.");
    }
}


document.addEventListener("DOMContentLoaded", initSelectComunity);
comunidadSelect.addEventListener("change", initSelectCity);
ciudadSelect.addEventListener("change", activarBoton);
enviarBtn.addEventListener("click", enviarDatos);
agregarBtn.addEventListener("click", agregarProvincia);
eliminarBtn.addEventListener("click", eliminarProvincia);

/*Ampliación del ejercicio:
Añadir un formulario donde el usuario pueda agregar nuevas ciudades a una comunidad existente.
Implementar un botón "Eliminar" que permita quitar una ciudad seleccionada.
Al eliminar una ciudad, actualizar la lista de manera dinámica.*/

