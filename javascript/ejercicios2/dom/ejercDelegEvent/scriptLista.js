document.body.addEventListener("click", function(event) {
    if (event.target.tagName === "LI") {
        event.target.style.backgroundColor = "lightblue";
    }
});

let boton = document.getElementById("boton");
boton.addEventListener("click", function() {
    boton.textContent = "Clickeado";
});