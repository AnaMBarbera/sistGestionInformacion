let candidatos = ["Ana", "Luis", "Carlos", "María", "Pedro"];
let ordenados = [];
let votos = [
    1, 2, 3, 4, 5, 1, 1, 3, 4, 2,
    5, 3, 2, 1, 4, 5, 3, 1, 2, 4,
    3, 5, 2, 1, 3, 4, 5, 1, 2, 3,
    1, 2, 3, 4, 5, 2, 1, 5, 3, 4,
    5, 1, 2, 3, 4, 2, 5, 1, 3, 4, 5, 5, 5
];

let votosCandidatos = [0, 0, 0, 0, 0];

votosCandidatos.forEach((voto, index) => votosCandidatos[index] = votos.filter(v => v === index + 1).length);
console.log(votosCandidatos);

// Modo 1
candidatos.sort((a, b) => votosCandidatos[candidatos.indexOf(b)] - votosCandidatos[candidatos.indexOf(a)]);
console.log("sort: " + candidatos);

// Modo 2
while (votosCandidatos.length > 0) {
    let max = Math.max(...votosCandidatos);
    let index = votosCandidatos.indexOf(max);
    console.log(`El candidato ${candidatos[index]} ha obtenido ${max} votos`);
    votosCandidatos.splice(index, 1);
    ordenados.push(candidatos[index]);
    candidatos.splice(index, 1);
}
console.log("El resultado de la votación es:", ordenados);

/** 
for (voto of votos) {
    votosCandidatos[voto - 1]++;
}

console.log("Resultados de la votación:", votosCandidatos);

**/

console.log("con bucle for clásico");
votosCandidatos = [0, 0, 0, 0, 0]; // Suponiendo 5 candidatos
votos = [1, 2, 3, 4, 5, 1, 1, 3, 4, 2, 5, 3, 2, 1, 4, 5, 3, 1, 2, 4, 3, 5, 2, 1, 3, 4, 5, 1, 2, 3, 1, 2, 3, 4, 5, 2, 1, 5, 3, 4, 5, 1, 2, 3, 4, 2, 5, 1, 3, 4, 5, 5, 5]; // Lista de votos

// Recorremos los votos
for (let i = 0; i < votos.length; i++) {
    let voto = votos[i];
    votos[voto - 1]++; // Incrementamos el contador del candidato correspondiente
}

console.log("Resultados de la votación:", votosCandidatos);

console.log("con bucle for of");
votosCandidatos = [0, 0, 0, 0, 0]; // Suponiendo 5 candidatos
votos = [1, 2, 3, 4, 5, 1, 1, 3, 4, 2, 5, 3, 2, 1, 4, 5, 3, 1, 2, 4, 3, 5, 2, 1, 3, 4, 5, 1, 2, 3, 1, 2, 3, 4, 5, 2, 1, 5, 3, 4, 5, 1, 2, 3, 4, 2, 5, 1, 3, 4, 5, 5, 5]; // Lista de votos

// Recorremos los votos usando for...of
for (let voto of votos) {
    votosCandidatos[voto - 1]++; // Incrementamos el contador del candidato correspondiente
}

console.log("Resultados de la votación:", votosCandidatos);
