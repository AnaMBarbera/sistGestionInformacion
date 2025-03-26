/*Crea una página con un campo de entrada de texto y un botón.
Al presionar el botón, muestra en un div el contenido del campo de entrada.
Implementa un evento mouseover en un div para cambiar su color al pasar el cursor.
Agrega un evento keydown para detectar cuando el usuario escribe.*/

document.getElementById("mostrar").addEventListener("click", mostrar);
function mostrar(){
    let resultado = document.getElementById("resultado");    
    let entrada = document.getElementById("entrada").value;
    if (entrada){
    resultado.innerText = entrada   
    }
}

document.getElementById("caja").addEventListener("mouseover", function(){
    caja = document.getElementById("caja");
    caja.style.backgroundColor = "green";
});
document.getElementById("caja").addEventListener("mouseout", function(){
    caja = document.getElementById("caja");
    caja.style.backgroundColor = "red";
});

document.getElementById("entrada").addEventListener("keydown", function(){
    console.log("has escrito algo")
    ;
});
