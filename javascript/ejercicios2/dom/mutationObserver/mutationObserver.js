/*
let observer = new MutationObserver(function(mutations) {
    mutations.forEach(function(mutation) {
        console.log("Cambio detectado:", mutation);
    });
});

let config = { childList: true, subtree: true };
let targetNode = document.getElementById("titulo");
observer.observe(targetNode, config);

// Simulamos un cambio en el DOM después de 3 segundos
setTimeout(() => {
    targetNode.textContent = "Título observado y modificado";
}, 3000);
*/

//Crea un MutationObserver que detecte cuando se agregue un nuevo párrafo a la página.
//Modifica el código para que, cuando detecte un cambio, agregue un mensaje en la consola indicando qué ha cambiado.

let observer = new MutationObserver(function(mutations) {
    mutations.forEach(function(mutation) {
        console.log("Se ha detectado un cambio en: ", mutation.target);
    });
});

let config = { childList: true, subtree: true };
let body = document.body;
observer.observe(body, config);

// Simulamos la adición de un nuevo párrafo
setTimeout(() => {
    let nuevoParrafo = document.createElement("p");
    nuevoParrafo.textContent = "Este es un nuevo párrafo agregado dinámicamente.";
    document.body.appendChild(nuevoParrafo);
}, 3000);