//Sintaxis de una Promesa
/*
const currentURL = document.URL.toString();
const promise = fetch(currentURL); //aquí pondríamos una url

promise.then(result => console.log(result), e => console.log(`Error capturado:  ${e}`)); */

// o también
fetch("www.elmundo.es") //aquí pondríamos una url entre ""
    .then(result => console.log(result),
        e => console.log(`Error capturado:  ${e}`)); 

console.log("hello Word");

//igual con async await

/*
const checkServerWithSugar = async (url) => {
    try {
        const response = await fetch(url);
        return `Estado del servidor: ${response.status === 200 ? "OK" : "NOT OK"}`;
    } catch (e) {
        throw `Manejo intero del error. Error original: ${e}`;
    }
}

checkServerWithSugar(document.URL.toString())
    .then(result => console.log(result))
    .catch(e => console.log(`Error Capturado Fuera de la función async: ${e}`));


*/
        //-----------------------------

// ejemplo de promise

        console.log("");

        function operacionAsincrona() {
            return new Promise((resolve, reject) => {
                setTimeout(() => {
                    let exito = true;
                    if (exito) {
                        resolve("Operación completada");
                    } else {
                        reject("Error en la operación");
                    }
                }, 2000);
            });
        }
        
        operacionAsincrona()
            .then(mensaje => console.log(mensaje))
            .catch(error => console.log("Error:", error));       

//--------------------------------------------------------

