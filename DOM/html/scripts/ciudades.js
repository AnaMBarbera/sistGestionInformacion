const comunidades = {
    "Valenciana": ["Alicante", "Castellón", "Valencia"],
    "Catalana": ["Barcelona", "Gerona", "Lérida", "Tarragona"],
    "Madrileña": ["Madrid"],
    "Andaluza": ["Almería", "Cádiz", "Córdoba", "Granada", "Huelva", "Jaén", "Málaga", "Sevilla"]
};

let actualComunity = 0;

function initSelectCommunity(){
    let selectElement = document.getElementById('comunidad');
    let i = 1;
    for (comunidad in comunidades) {
        let option = document.createElement("option");
        option.innerText = comunidad;
        //option.value = i++;
        selectElement.appendChild(option);
    }
    console.log(`Añadidas las ${i} comunidades`)
}

function initSelectCity(){
    let comValue = document.getElementById("comunidad").value;
    let selectElement = document.getElementById('ciudad');

    /** 
    if (actualComunity == comValue) return;
    actualComunity = comValue;
    */
    
    while (selectElement.childElementCount > 0) {
        selectElement.removeChild(selectElement.lastElementChild);
    }
    selectElement.innerHTML = "<option>Seleccione una ciudad</option>"

    console.log(comValue);
    if (comValue == "") {
        selectElement.disabled = true;
        document.getElementById("enviar").disabled = true;
        return;
    }

    for (ciudad of comunidades[comValue]) {
        let option = document.createElement("option");
        option.innerText = ciudad;
        selectElement.appendChild(option);
    }
    selectElement.disabled = false;
}

function changeCity(){
    let comunidad = document.getElementById("comunidad");
    let ciudad = document.getElementById("ciudad");
    let boton = document.getElementById("enviar");

    console.log(comunidad.value, ciudad.value);

    boton.disabled = (comunidad.value == "" || ciudad.value == "Seleccione una ciudad");
}


// cargar las comunidades en el select
document.addEventListener('DOMContentLoaded', initSelectCommunity);
// detectar selección o cambio de comunidad
document.getElementById("comunidad").addEventListener('change', initSelectCity);
// detectar selección o cambio de ciudad
document.getElementById("ciudad").addEventListener('change', changeCity);