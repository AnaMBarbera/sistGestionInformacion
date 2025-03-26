function mostrar() {
    document.getElementById("resultado").innerText = document.getElementById("entrada").value;
}

function cambiarColor() {
    let elementDiv = document.getElementById("caja");
    elementDiv.style.backgroundColor = "red";   
}

function dejarColor(){
    let elementDiv = document.getElementById("caja");
    elementDiv.style.backgroundColor = "lightblue";
}

function teclaPulsada(event) {
    let input = document.getElementById("entrada");
    console.log(event);
}





document.addEventListener("DOMContentLoaded", function() {
    /* inicialización */
    document.getElementById("mostrar").addEventListener("click", mostrar);
    document.getElementById("caja").addEventListener("mouseover", cambiarColor);
    document.getElementById("caja").addEventListener("mouseout", dejarColor);
    document.getElementById("entrada").addEventListener("keypress", teclaPulsada);

})

