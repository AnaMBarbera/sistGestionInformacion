
/**
 * Función que añada un item a una lista
 * @param {string} idLista: id del elemento a eliminar
 * @return {int} 0 si hemos añadido el elemento.
 */

function addItem(idLista) {
    try {
        let item = document.createElement("li");
         item.innerText="Nuevo Item";
        document.getElementById(idLista).appendChild(item);
    }
    catch (error) {
        return -1;
    }
    return 0;
}

/**
 * Eliminar elementos de la luista
 * @param {String} idLista : id del elemento ul
 * @return {bool} true si se ha eliminado el elemento
 */
function removeItem(idLista) {
    let lista = document.getElementById(idLista);
    if (lista.childElementCount > 0) {
        console.log(lista.lastElementChild);
        lista.removeChild(lista.lastElementChild);
        }
    else {
        alert("No hay elementos para eliminar");
        return false;
    }
    return true;
}