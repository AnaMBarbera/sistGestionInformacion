/*Proyecto Final: Elección de Delegado
En este proyecto, gestionaremos la elección de delegado de clase. Contamos con 5 candidatos y 50 votos de alumnos. Nuestro objetivo es calcular el número de votos obtenidos por cada candidato y mostrar el ranking en orden descendente.*/

console.log("Solución con bucles");
let candidatos = ["Ana", "Luis", "Carlos", "María", "Pedro"];
let votos = [
    1, 2, 3, 4, 5, 1, 1, 3, 4, 2,
    5, 3, 2, 1, 4, 5, 3, 1, 2, 4,
    3, 5, 2, 1, 3, 4, 5, 1, 2, 3,
    1, 2, 3, 4, 5, 2, 1, 5, 3, 4,
    5, 1, 2, 3, 4, 2, 5, 1, 3, 4
];

let conteo = [0, 0, 0, 0, 0];

for (let i = 0; i < votos.length; i++) {
    let indice = votos[i] - 1; //comprueba el candidato votado, si votos[i] es 1 el índice del candidato lo pondremos en conteo[0] (primera posición)
    conteo[indice]++;
}

let resultados = []; //para meter en un array la pareja de candidato y votos
for (let i = 0; i < candidatos.length; i++) {
    resultados.push({ nombre: candidatos[i], votos: conteo[i] });
}
// esta función devuelve: 0 si a es menor que b, 1 si a es mayor que b y 0 si son iguales
function compararVotos(a, b) {
    return b.votos - a.votos;
}

resultados.sort(compararVotos);
console.log("Resultados de la elección:", resultados);

/*La función compararVotos(a,b) es una función que:
Resta b.votos - a.votos, lo que significa que:
- Si b.votos es mayor que a.votos, devuelve un valor positivo, colocando b antes que a.
- Si b.votos es menor que a.votos, devuelve un valor negativo, colocando a antes que b.
- Si son iguales, mantiene su orden original.
El efecto es ordenar el array en orden descendente según la propiedad votos de los objetos.*/

console.log("");
console.log("Solución con Métodos de Arrays");

//Ahora usaremos métodos como reduce(), map() y sort() para simplificar el código.
/*Aquí se utiliza el método reduce para contar cuántos votos tiene cada candidato.
    reduce recorre cada elemento del array votos y acumula el conteo de votos en un array acc (acumulador).
    Este acumulador se inicializa con [0, 0, 0, 0, 0], que representa los votos de cada uno de los 5 candidatos (todos empiezan con 0 votos).*/

let conteoVotos = votos.reduce((acc, voto) => {
    acc[voto - 1]++;
    return acc;
}, [0, 0, 0, 0, 0]);

/* candidatos.map(...) recorre el array candidatos y para cada candidato (representado por nombre y su índice i), crea un objeto con el nombre del candidato y su número de votos correspondiente (extraído del array conteoVotos en el índice i).
Esto crea un array de objetos que asocia cada candidato con su cantidad de votos: */

let resultadosFinales = candidatos.map((nombre, i) => ({ nombre, votos: conteoVotos[i] }))
                                 .sort((a, b) => b.votos - a.votos);

/*.sort((a, b) => b.votos - a.votos) ordena el array de objetos resultadosFinales en orden descendente según el número de votos. Es decir, los candidatos con más votos aparecerán primero.*/

console.log("Resultados de la elección:", resultadosFinales);
