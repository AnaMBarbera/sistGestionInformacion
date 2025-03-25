/*
let titulo = document.getElementById("nombre");
console.log(titulo.innerText); // Carlos Pérez
titulo.innerText = "Ana López"; // Cambia el texto visible
//console.log(titulo);

let descripcion = document.getElementById("puesto");
console.log(descripcion.textContent); // Desarrollador Web
descripcion.textContent = "Ingeniero de Software"; // Modifica el texto sin afectar la estructura HTML

let contenedor = document.getElementById("puesto");
contenedor.innerHTML = "<strong>Gerente de Proyecto</strong>"; // Inserta contenido con formato HTML
console.log(contenedor.innerHTML);
*/

function actualizar2(){
    
    document.body.style.backgroundColor = "lightblue";

    let titulo2 = document.getElementById("titulo");
    let descripcion2 = document.getElementById("descripcion");
    let contenido2 = document.getElementById("contenido");

    titulo2.innerText = "Bienvenido al curso de JavaScript";    
    descripcion2.textContent = "Aprenderás a modificar el DOM con JavaScrip";    
    contenido2.innerHTML= /*html*/ `
    <img src="images/logoColegio.png"/>
    
    <ul>
        <li>Elemento1</li>
        <li>Elemento2</li>
        <li>Elemento3</li>
        <li>Elemento4</li>
    </ul>
    `;
    //con el acento "`" podemos hacer saltos de línea en la inyección de html. Hemos instalado la extensión ES6 String HTML para ver el cambio de colores.
}

/*También podemos usar esta sintaxsis
    document.getElementById("modificar").addEventListener("click", function() {
    document.getElementById("titulo").innerText = "Bienvenido al curso de JavaScript";
    document.getElementById("descripcion").textContent = "Aprenderás a modificar el DOM con JavaScript";
    document.getElementById("contenido").innerHTML = "<strong>Contenido modificado dinámicamente</strong>";
});
*/
function atributos(){
    let enlace = document.getElementById("miEnlace2");
    enlace.setAttribute("href", "https://www.google.com"); // Modifica la URL
    console.log(enlace.getAttribute("href")); // Obtiene la URL
   // enlace.removeAttribute("target"); // Elimina el atributo target
}
atributos();

function atributos2(){
    let image = document.getElementById("imagen1");
    let button = document.getElementById("cambiar-info");
    image.setAttribute("src", "./images/css.png");
   // button.backgroundColor = "green";
    button.classList.add("green"); // Agrega una clase CSS
    button.classList.toggle("naranja");
    setInterval(() => button.classList.toggle("green"), 2000);
}


function rollImages(){ 
    let images=["./images/css.png","./images/html-5.png", "./images/javascript.png"];
    let i = 0; 
    let image = document.getElementById("imagen1"); 
    setInterval(() => {image.setAttribute("src", images[i]); 
    i++;
    if(i==images.length) i=0;},5000);
   
}

