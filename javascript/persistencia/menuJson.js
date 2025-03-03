const prompt = require("prompt-sync")();

async function cargarSuperheroes() {
    try {
        const response = await fetch('https://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json');
        if (!response.ok) {
            throw new Error('Error al cargar el JSON');
        }
        const data = await response.json();

        // Cargar datos en un array
        const superheroes = data.members;

        // Informar al usuario
        console.log(`¡Datos cargados correctamente!`);
        console.log(`Equipo: ${data.squadName}`);
        console.log(`Ciudad: ${data.homeTown}`);
        console.log(`Formado en: ${data.formed}`);
        console.log(`Número de miembros: ${superheroes.length}`);

        // Menú interactivo
        let indice;
        do {
            indice = parseInt(prompt(`Introduce un índice entre 0 y ${superheroes.length - 1} para ver un superhéroe (introduce otro número para salir):`));

            if (indice >= 0 && indice < superheroes.length) {
                const hero = superheroes[indice];
                console.log(`\nInformación del superhéroe:`);
                console.log(`Nombre: ${hero.name}`);
                console.log(`Edad: ${hero.age}`);
                console.log(`Identidad secreta: ${hero.secretIdentity}`);
                console.log(`Poderes:`);
                hero.powers.forEach(power => console.log(`- ${power}`));
            } else {
                console.log("Saliendo de la aplicación...");
            }

        } while (indice >= 0 && indice < superheroes.length);

    } catch (error) {
        console.error('Error al cargar o procesar el JSON:', error);
    }
}

cargarSuperheroes();