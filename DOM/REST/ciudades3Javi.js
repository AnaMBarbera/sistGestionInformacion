let table = document.getElementById("ciudades-lista");

function initCiudades() {
    fetch("http://localhost:3000/ciudades", {
        method: 'GET',
    })
    .then(response => {
        return response.json();
}).then(data => {
   data.forEach(item => {
        let tr_e = document.createElement("tr");

        let td = document.createElement("td");
        td.innerText = item.codigo;
        tr_e.appendChild(td);

        td = document.createElement("td");
        td.innerText = item.nombre;
        tr_e.appendChild(td);

        td = document.createElement("td");
        td.innerText = item.poblacion;
        tr_e.appendChild(td);

        td = document.createElement("td");
        td.innerHTML = `<button onclick='showCityInfo("${item.codigo}")'>Ver</button>`;
        tr_e.appendChild(td);
    
        table.appendChild(tr_e);
   });
})
}

function showCityInfo(cityCode) {
    fetch(`http://localhost:3000/ciudades/${cityCode}`, {
        method: 'GET',
    })
    .then(response => response.json())
    .then(data => alert(`info: ${data.codigo}, ${data.nombre}, ${data.poblacion}`));
}


document.addEventListener('DOMContentLoaded', initCiudades);