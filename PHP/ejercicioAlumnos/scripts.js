// Función para confirmar la eliminación de un empleado
function eliminarAlumno(id) {
    if (confirm("¿Estás seguro de que deseas eliminar este alumno?")) {
        fetch("eliminarAlumno.php", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({id:id })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert(data.message);
                eliminarFila(id);
            } else {
                alert("No eliminado: " + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert("Error en la eliminación");
        });
    }
}

function editarAlumno(id) {    

    fetch('getAlumno.php?id=' + id)
        .then(response => response.json())
        .then(data => {
            
            document.getElementById('id').value = data.id;
            document.getElementById('nombre').value = data.nombre;
            document.getElementById('edad').value = data.edad;
            document.getElementById('curso').value = data.curso;
            document.getElementById('email').value = data.email;
            
        })
        .catch(error => console.error('Error al obtener los datos del alumno:', error));
}

function guardarAlumno() {

    const id = document.getElementById('id').value;
    const nombre = document.getElementById('nombre').value;
    const edad = document.getElementById('edad').value;
    const curso = document.getElementById('curso').value;
    const email = document.getElementById('email').value;    

    // Crear un objeto con los datos a enviar
    const data = {
        id: id,
        nombre: nombre,
        edad: edad,
        curso: curso,
        email: email
    };

    fetch('editarAlumno.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json' 
        },
        body: JSON.stringify(data)  // Convertimos el objeto a JSON
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {           
            actualizarFila(data.alumno);            
        } else {
           
            alert(data.error || "Error al actualizar el empleado.");
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Error en la actualización.');
    });
}

function anyadirAlumno() {    
    
    const nombre = document.getElementById('nombre').value;
    const edad = document.getElementById('edad').value;
    const curso = document.getElementById('curso').value;
    const email = document.getElementById('email').value;

     // Crear un objeto con los datos a enviar
     const data = {        
        nombre: nombre,
        edad: edad,
        curso: curso,
        email: email        
     };
    
     fetch('anyadirAlumno.php', {
         method: 'POST',
         headers: {
             'Content-Type': 'application/json'  // Especificamos que el contenido será JSON
         },
         body: JSON.stringify(data)  // Convertimos el objeto a JSON
     })
     .then(response => response.json())
     .then(data => {
         if (data.success) {             
             añadirFila(data.alumno);
            
         } else {
             // Si hay un error, mostrar el mensaje de error
             alert(data.error || "Error al añadir el alumno.");
         }
     })
     .catch(error => {
         console.error('Error:', error);
         alert('Error en la inserción.');
     });
 }

 function añadirFila(alumno) {
    const tabla = document.getElementById('alumnos');
    // insertar la nueva fila al principio de la tabla
    const nuevaFila = tabla.insertRow(1);

    nuevaFila.setAttribute('id', alumno.id);
    nuevaFila.innerHTML = `
        <td>${alumno.id}</td>
        <td>${alumno.nombre}</td>
        <td>${alumno.edad}</td>
        <td>${alumno.curso}</td>
        <td>${alumno.email}</td>        
        <td><button onclick="editarAlumno(${alumno.id})">Editar</button>
        <button onclick="eliminarAlumno(${alumno.id})">Eliminar</button></td>
    `;
}
// Función para actualizar la fila de la tabla con los nuevos datos
function actualizarFila(alumno) {
    // Encontrar la fila correspondiente en la tabla
    const fila = document.querySelector(`tr[data-id='${alumno.id}']`);
    console.log(fila);
    if (fila) {
        fila.children[1].textContent = alumno.nombre;  
        fila.children[2].textContent = alumno.edad;  
        fila.children[3].textContent = alumno.curso;  
        fila.children[4].textContent = alumno.email; 
             
    }
}

function eliminarFila(id) {
    const fila = document.querySelector(`tr[data-id='${id}']`);
    if (fila) fila.remove();
}
