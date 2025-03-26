/*
function agregar(){
    let lista = document.getElementById("lista");
    let item = document.createElement("li");
    item.textContent = "Nuevo elemento";
    lista.appendChild(item);
}

function eliminar(){
    let lista = document.getElementById("lista");
    let ultimoElemento = lista.lastElementChild;
    ultimoElemento.remove(); // Elimina el elemento
}
*/
document.getElementById("agregar").addEventListener("click", function(){
    let lista = document.getElementById("lista");
    let item = document.createElement("li");
    item.textContent = "Nuevo elemento";
    lista.appendChild(item);
})

//otra forma es declarar primero la funcion para llamarla por su nombre
let eliminar = function(){
    let lista = document.getElementById("lista");
    let ultimoElemento = lista.lastElementChild;
    ultimoElemento.remove(); // Elimina el elemento
};
document.getElementById("eliminar").addEventListener("click", eliminar);
//evento sin el prefijo on, función sin los ().

/*solución en apuntes
    document.getElementById("agregar").addEventListener("click", function() {
    let lista = document.getElementById("lista");
    let nuevoElemento = document.createElement("li");
    nuevoElemento.textContent = "Nuevo Elemento";
    lista.appendChild(nuevoElemento);
});

    document.getElementById("eliminar").addEventListener("click", function() {
    let lista = document.getElementById("lista");
    if (lista.children.length > 0) {
        lista.removeChild(lista.lastElementChild);
    }
});
*/