/*Ejercicio 2: Fechas de pago
    Escribe un programa que reciba:
        Un importe.
        Una fecha de factura en formato YYYY-MM-DD.
        Una opción para calcular fechas de pago: a 30 días, a 30 y 60 días, o a 30, 60 y 90 días.
    Muestra las fechas de pago correspondientes.*/

    const prompt = require("prompt-sync")();

    let importe = parseFloat(prompt("Introduce un importe: "));
    let fechaFact = new Date(prompt("Introduce la fecha de la factura (YYYY-MM-DD): "));
  /*  let pago1 = 1; //pago a 30 días
    let pago2 = 2; //pago a 30 y 60 días
    let pago3 = 3; //pago a 30, 60 y 90 días */
    let vto1 = new Date (fechaFact); //copia de fechaFact
    vto1.setDate(vto1.getDate()+30); //sumamos 30 días a vto1
    let vto2 = new Date (fechaFact); 
    vto2.setDate(vto2.getDate()+60);
    let vto3 = new Date (fechaFact); 
    vto3.setDate(vto3.getDate()+90);

    console.log (`El pago a 30 días será:  Vencimiento: ${vto1.toLocaleDateString()}, Importe: ${importe.toFixed(2)},`);
    console.log (`El pago a 30-60 días será:  Vencimiento: ${vto1.toLocaleDateString()}, Importe: ${(importe/2).toFixed(2)} y Vencimiento: ${vto2.toLocaleDateString()}, Importe: ${(importe/2).toFixed(2)}`);
    console.log (`El pago a 30-60-90 días será:  Vencimiento: ${vto1.toLocaleDateString()}, Importe: ${(importe/3).toFixed(2)} , Vencimiento: ${vto2.toLocaleDateString()}, Importe: ${(importe/3).toFixed(2)} y Vencimiento: ${vto3.toLocaleDateString()}, Importe: ${(importe/3).toFixed(2)}`);

