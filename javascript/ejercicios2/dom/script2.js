//PRACTICA CON DELEGACION DE EVENTOS

document.body.addEventListener("click", function(event) {
    if (event.target.classList.contains("parrafo")) {
        event.target.style.color = "red";
    } else {
        console.log("[click]. No es un párrafo")
    }
});