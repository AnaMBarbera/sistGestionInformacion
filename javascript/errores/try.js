try {
    let resultado = 10 / a;
    console.log(resultado);
} catch (error) {
    console.log("Se ha producido un error:", error.message);
}
finally {
    console.log("Este mensaje siempre se mostrará.");
}

//------------------
function verificarEdad(edad) {
    if (edad < 18) {
        throw new Error("No puedes acceder, eres menor de edad.");
    }
    return "Acceso permitido.";
}

try {
    console.log(verificarEdad(16)); // Esto generará un error
} catch (error) {
    console.log("Error detectado:", error.message);
}

/*Tipos de Errores Comunes en JavaScript
SyntaxError: Ocurre cuando hay un error en la sintaxis del código.
ReferenceError: Sucede cuando intentamos acceder a una variable que no está definida.
TypeError: Aparece cuando intentamos ejecutar una operación sobre un tipo de dato incorrecto.
RangeError: Se produce cuando un valor numérico está fuera del rango permitido.
EvalError: Relacionado con el uso incorrecto de eval() (aunque es poco común en código moderno).*/

// SyntaxError (descomenta para ver el error)
// console.log("Hola);

// ReferenceError
try {
    console.log(variableNoDefinida);
} catch (error) {
    console.log("ReferenceError detectado:", error.message);
}

// TypeError
try {
    let num = 5;
    num(); // No se puede llamar un número como función
} catch (error) {
    console.log("TypeError detectado:", error.message);
}

//PERSONALIZACION DE MENSAJES
function dividir(a, b) {
    if (b === 0) {
        throw new Error("No se puede dividir por cero.");
    }
    return a / b;
}

try {
    console.log(dividir(10, 2)); // 5
    console.log(dividir(10, 0)); // Error
} catch (error) {
    console.log("Error personalizado:", error.message);
}
