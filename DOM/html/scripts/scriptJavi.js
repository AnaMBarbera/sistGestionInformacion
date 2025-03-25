function initElements(){
    let el_h1 = document.getElementById("titulo");
    let el_ds = document.getElementById("descripcion");
    let el_content = document.getElementById("contenido");

    el_h1.innerText = "Bienvenido al curso de JavaScript";
    el_ds.textContent  = "Aprenderás a modificar el DOM con JS";
    el_content.innerHTML = /*html*/`
        <ul>
            <li>Elemento 1</li>
            <li>Elemento 2</li>
            <li>Elemento 3</li>
            <li> ... </li>
            <li>Elemento n</li>
        </ul>
    `;

}

function atributos() {

    let el_h1 = document.getElementById("titulo");
    let el_ds = document.getElementById("descripcion");

    el_h1.setAttribute("class", "azul");
    el_h1.setAttribute("name", "tituloPrincipal")
    el_ds.removeAttribute("class");

    console.log("class: ", el_h1.getAttribute("class"));
    console.log("name: ", el_h1.getAttribute("name"));

    console.log("class:", el_ds.getAttribute("class"));

}

// LLamada a la función para que carge los contenidos

initElements();
atributos();
