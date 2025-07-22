
// Desestructuración de un objeto
const persona = { nombre: "Ana", edad: 30, ciudad: "Madrid" };
const { nombre, edad } = persona;
console.log(nombre, edad); // Ana 30
const { ciudad: localidad } = persona;
console.log(localidad); // Madrid

// Desestructuración de un array
const numeros = [10, 20, 30];
const [primero, segundo] = numeros;
console.log(primero, segundo); // 10 20

//spread (concatenar con ...)

const array1 = [1, 2, 3];
const array2 = [4, 5, 6];
const combinado = [...array1, ...array2];
console.log(combinado); // [1, 2, 3, 4, 5, 6]


