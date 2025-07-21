//textContent y innerHtml
/*
let titulo = document.getElementById("titulo");
console.log(titulo.textContent);
titulo.textContent = "Hola, mundo cruel";
titulo.innerHTML="<i><u>Hola, mundo cruel</u></i>" //con etiquetas se usa innerHtml


//modificar atributos
let titulo = document.getElementById("titulo");
console.log(titulo.getAttribute("id")); // "titulo"

titulo.setAttribute("class", "titulo-grande");
console.log(titulo.getAttribute("class")); // "titulo-grande"


//modificar contenido por tag
let parrafos = document.getElementsByTagName("p");

for (let i = 0; i < parrafos.length; i++) {
    parrafos[i].textContent = `Párrafo modificado ${i + 1}`;
}


//modificar contenido por clase
let parrafos = document.getElementsByClassName("parrafo");

for (let i = 0; i < parrafos.length; i++) {
    parrafos[i].textContent = `Párrafo modificado ${i + "x"}`;
}

*/



//Selecciona todos los párrafos y cambia su color de fondo a amarillo.
//Selecciona todos los elementos con la clase parrafo y cambia su contenido por "Párrafo modificado".

let parrafos = document.querySelectorAll(".parrafo");
parrafos.forEach(parrafo => {
    parrafo.style.backgroundColor = "yellow";
    parrafo.textContent = "Párrafo modificado";
});

//Selecciona el botón por su id y cambia su texto a "Haz clic aquí".
//Selecciona un párrafo y modifica su contenido por un link a Google.

let boton = document.getElementById("boton");
boton.textContent = "Haz click aquí";

let parrafo = document.querySelector(".parrafo");
parrafo.innerHTML = "<a href='https://www.google.com'>Google</a>";
