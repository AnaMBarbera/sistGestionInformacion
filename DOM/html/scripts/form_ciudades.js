// JSON con las comunidades y sus capitales

const comunidades = {
    "Valenciana": ["Alicante", "Castellón", "Valencia"],
    "Catalana": ["Barcelona", "Gerona", "Lérida", "Tarragona"],
    "Madrileña": ["Madrid"],
    "Andaluza": ["Almería", "Cádiz", "Córdoba", "Granada", "Huelva", "Jaén", "Málaga", "Sevilla"]
};

let comunidadSelect = document.getElementById("comunidad");
let ciudadSelect = document.getElementById("ciudad");
let enviarBtn = document.getElementById("enviar");
let actualComunidad = 0; //para guardar la seleccionada


function initSelectComunity(){    
    let i = 1;
       // Llenar el selector de comunidades
    for (let comunidad in comunidades) {
        let option = document.createElement("option");
        option.innerText = comunidad;
        option.value = i++      
        comunidadSelect.appendChild(option);
    }
};
function initSelectCity(){
    //comunidad seleccionada
    let comunidad = comunidad.value;    
    ciudadSelect.innerHTML = "<option value=''>Seleccione una ciudad</option>";
    ciudadSelect.disabled = true;
    enviarBtn.disabled = true;    
    if (comunidadSeleccionada) {
        ciudadSelect.disabled = false;
        comunidades[comunidadSeleccionada].forEach(ciudad => {
            let option = document.createElement("option");
            option.value = ciudad;
            option.textContent = ciudad;
            ciudadSelect.appendChild(option);
        });
    }
}
function activarBoton(){
    enviarBtn.disabled = !ciudadSelect.value;
}
function enviarDatos(){
    alert(`Comunidad: ${comunidadSelect.value}\nCiudad: ${ciudadSelect.value}`);
        comunidadSelect.value = "";
        ciudadSelect.innerHTML = "<option value=''>Seleccione una ciudad</option>";
        ciudadSelect.disabled = true;
        enviarBtn.disabled = true;
}

document.addEventListener("DOMContentLoaded", initSelectComunity);
comunidadSelect.addEventListener("change", initSelectCity);
ciudadSelect.addEventListener("change", activarBoton);
enviarBtn.addEventListener("click", enviarDatos)



