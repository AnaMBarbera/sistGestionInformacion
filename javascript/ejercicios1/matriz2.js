let b = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
];

let c = [
    [9,8,7],
    [6,5,4],
    [3,2,1]
];
let a = [];
 //[[a11,a12,a13], [a21,a22,a23],[a3, a32,a33]]
   


let resultado =[];

//aij= bi1*c1j + bi2*c2j + bi3 * c3j

for(let i=0; i<b.length; i++){
    a.push ([]);
    for (let j=0; j< c.length; j++){
        a[i].push(0);
        for (let k = 0; k < c.length; k++) {
           a[i][j] += b[i][k]* c[k][j];
        }
    }
}
console.log(b);
console.log(c);
console.log(a);

