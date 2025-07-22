document.addEventListener("DOMContentLoaded", () => {
    let template = document.getElementById("mi-template");
    let contenedor = document.getElementById("contenedor");
    let fragmento = document.createDocumentFragment();

    for (let i = 1; i <= 3; i++) {
        let clon = template.content.cloneNode(true);
        clon.querySelector(".titulo").textContent = `Título ${i}`;
        clon.querySelector(".contenido").textContent = `Contenido de la tarjeta ${i}`;
        fragmento.appendChild(clon);
    }

    contenedor.appendChild(fragmento);
});

//Modifica el ejemplo para agregar una imagen dentro de cada tarjeta.
//Crea un botón que, al hacer clic, agregue una nueva tarjeta con contenido dinámico.

document.getElementById("boton").addEventListener("click", () => {
    let template = document.getElementById("mi-template");
    let contenedor = document.getElementById("contenedor");
    let clon = template.content.cloneNode(true);
    clon.querySelector(".titulo").textContent = "Nueva Tarjeta";
    clon.querySelector(".contenido").textContent = "Esta tarjeta fue agregada dinámicamente.";
    contenedor.appendChild(clon);
});