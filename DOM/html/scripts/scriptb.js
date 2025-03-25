function initElements(){
    let imagen = document.getElementById("img");
    let boton = document.getElementById("boton");

    imagen.setAttribute("src", "./resources/whatsapp.png");
    imagen.classList.add("imagen");
    boton.classList.toggle("activo");
}

// LLamada a la función para que carge los contenidos

initElements();

