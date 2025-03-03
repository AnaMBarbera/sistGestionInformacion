fetch('https://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json')
    .then(response => {
        if (!response.ok) {
            throw new Error('Error al cargar el JSON');
        }
        return response.json();
    })
    .then(data => {
        console.log(`Equipo: ${data.squadName}`);
        console.log(`Ciudad: ${data.homeTown}`);
        console.log(`Formado en: ${data.formed}`);
        console.log('Miembros del equipo:');
        data.members.forEach(member => {
            console.log(`- Nombre: ${member.name}`);
            console.log(`  Edad: ${member.age}`);
            console.log(`  Identidad secreta: ${member.secretIdentity}`);
            console.log('  Poderes:');
            member.powers.forEach(power => console.log(`    * ${power}`));
        });
    })
    .catch(error => console.error('Error al cargar el JSON:', error));
    