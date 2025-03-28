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

document.addEventListener("DOMContentLoaded", initSelectComunity);
comunidadSelect.addEventListener("change", initSelectCity);
ciudadSelect.addEventListener("change", activarBoton);
enviarBtn.addEventListener("click", enviarDatos);



