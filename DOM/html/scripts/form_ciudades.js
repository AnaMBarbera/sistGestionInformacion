// JSON con las comunidades y sus provincias
const comunidades = {
    "Valenciana": ["Alicante", "Castellón", "Valencia"],
    "Catalana": ["Barcelona", "Gerona", "Lérida", "Tarragona"],
    "Madrileña": ["Madrid"],
    "Andaluza": ["Almería", "Cádiz", "Córdoba", "Granada", "Huelva", "Jaén", "Málaga", "Sevilla"]
};
//Recogemos todos los elementos del HTML con los que vamos a trabajar
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
    //dejamos deshabilitamos todos los botones
    ciudadSelect.disabled = true;
    enviarBtn.disabled = true;
    eliminarBtn.disabled = true;
    agregarBtn.disabled = true;

};
function initSelectCity(){
    //comunidad seleccionada
    let comunidadSel = comunidadSelect.value;
    //aprovechamos para colocarla en el formulario de agregar provincia (span 'comSelect')
    comSelect.textContent = comunidadSel;         
    ciudadSelect.innerHTML = "<option value=''>Seleccione una ciudad</option>";
    //mantenemos el desplegable de ciudades y los botones enviar y eliminar deshabilitados hasta que se seleccione una comunidad
    ciudadSelect.disabled = true;
    enviarBtn.disabled = true;
    eliminarBtn.disabled = true; 
    //si se selecciona la comunidad habilitamos el desplegable de ciudades y lo cargamos con las ciudades correspondientes
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
    //condiciones para activar los botones
    //los botones enviar y eliminar están deshabilitados si no hay ciudad seleccionada en el select
    enviarBtn.disabled = !ciudadSelect.value;
    eliminarBtn.disabled = !ciudadSelect.value;
    //el botón de agregar provincia está deshabilitado si no hay provincia en el input o comunidad seleccionada
    agregarBtn.disabled = !inputProv.value || !comunidadSelect.value;
};
function enviarDatos(){
    alert(`Comunidad: ${comunidadSelect.value}\nCiudad: ${ciudadSelect.value}`);
    //quitamos el valor del select de comunidad
        comunidadSelect.value = "";
    //dejamos vacío el span de comunidad (del formulario de agregar ciudades)
        comSelect.textContent = "";
    //volvemos a dejar el select de ciudades en posición de seleccionar        
        ciudadSelect.innerHTML = "<option value=''>Seleccione una ciudad</option>";
    //deshabilitamos los botones y el select de ciudades de nuevo
        ciudadSelect.disabled = true;
        enviarBtn.disabled = true;
        eliminarBtn.disabled = true;

};
function agregarProvincia() {
    //recogemos la nueva ciudad del input del formulario y manejamos el string para que la primera letra sea mayúscula y el resto en minúsculas
    let nuevaCiudad = inputProv.value.trim(); 
    nuevaCiudad = nuevaCiudad.charAt(0).toUpperCase() + nuevaCiudad.slice(1).toLowerCase(); 
    // necesitamos el valor de la comunidad seleccionada a la que se la agregaremos
    let comunidadSel = comunidadSelect.value;
   //nos aseguramos que hay ciudad y comunidad y que la ciudad no esté ya incluida
    if (nuevaCiudad && comunidadSel && !comunidades[comunidadSel].includes(nuevaCiudad)) {
        // Agregar la nueva ciudad
        comunidades[comunidadSel].push(nuevaCiudad);
        // Actualizar el select de ciudades
        initSelectCity();       

        alert(`Ciudad ${nuevaCiudad} agregada a la comunidad ${comunidadSel}.`);
    } else if (comunidades[comunidadSel].includes(nuevaCiudad)) {
        alert("Esta ciudad ya está en la lista.");
    }
    // Borramos el input, quitamos el valor del select de comunidad, vaciamos el span del formulario y deshabilitamos el botón
    inputProv.value = '';
    comunidadSelect.value = "";
    comSelect.innerHTML = "";
    agregarBtn.disabled = true;
}
function eliminarProvincia() {
    let ciudadSel = ciudadSelect.value;
    let comunidadSel = comunidadSelect.value;

    if (ciudadSel && comunidadSel) {
        // Eliminar la ciudad seleccionada
        //localizamos la posición de la ciudad seleccionada
        let index = comunidades[comunidadSel].indexOf(ciudadSel);
        //eliminamos la ciudad en esa posición
        if (index > -1) {
            comunidades[comunidadSel].splice(index, 1);
            // Actualizar el select de ciudades
            initSelectCity();
            // Limpiar el input
            inputProv.value = '';
            alert(`Ciudad ${ciudadSel} eliminada de la comunidad ${comunidadSel}.`);
        }
    } else {
        alert("Seleccione una ciudad para eliminar.");
    }
    //ya que el botón 'eliminar' no se debe activar si no se cumple la condición, no haría falta el if ni el else
    
    //vaciamos el select y el span de la comunidad
    comunidadSelect.value = "";
    comSelect.textContent = "";
}

//capturamos todos los eventos
//al cargar la página
document.addEventListener("DOMContentLoaded", initSelectComunity);
//al seleccionar comunidad
comunidadSelect.addEventListener("change", initSelectCity);
//al seleccionar ciudad
ciudadSelect.addEventListener("change", activarBoton);
//al añadir provincia para agregar (se activa al tabular y salir del input)
inputProv.addEventListener("change", activarBoton);
//al hacer click en los botones
enviarBtn.addEventListener("click", enviarDatos);
agregarBtn.addEventListener("click", agregarProvincia);
eliminarBtn.addEventListener("click", eliminarProvincia);



