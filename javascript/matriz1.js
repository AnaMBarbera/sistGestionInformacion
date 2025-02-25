let A = [
    [1, 2],
    [3, 4]
];
let B = [
    [5, 6],
    [7, 8]
];
let resultado =[];

for (let i = 0; i < A.length; i++) {
    resultado[i] = [];
    for (let j = 0; j < B[0].length; j++) {
        let suma = 0;
        for (let k = 0; k < A[0].length; k++) {
            suma += A[i][k] * B[k][j];
        }
        resultado[i][j] = suma;
    }
}

console.log(resultado);

/*El cálculo de la multiplicación se realiza como sigue:

    Elemento resultado[0][0]:    
    resultado[0][0]=(A[0][0]∗B[0][0])+(A[0][1]∗B[1][0])=(1∗5)+(2∗7)=5+14=19

    Elemento resultado[0][1]:    
    resultado[0][1]=(A[0][0]∗B[0][1])+(A[0][1]∗B[1][1])=(1∗6)+(2∗8)=6+16=22

    Elemento resultado[1][0]:    
    resultado[1][0]=(A[1][0]∗B[0][0])+(A[1][1]∗B[1][0])=(3∗5)+(4∗7)=15+28=43

    Elemento resultado[1][1]:   
    resultado[1][1]=(A[1][0]∗B[0][1])+(A[1][1]∗B[1][1])=(3∗6)+(4∗8)=18+32=50

    resultado = [
        [19, 22],
        [43, 50]
    ]*/

/*El bucle recorre las filas de la matriz A y las columnas de la matriz B. Lo que hace aquí es multiplicar los elementos correspondientes de la fila i de A con la columna j de B y sumarlos para obtener el valor de resultado[i][j].

    A[i][k] es el elemento de la fila i de la matriz A.
    B[k][j] es el elemento de la columna j de la matriz B.

Al final de este bucle, suma tendrá el resultado de la multiplicación de la fila i de A por la columna j de B.*/