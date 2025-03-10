//ejemplo 

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

    