// Función para confirmar la eliminación de un empleado
function eliminarEmpleado(emp_id) {
    if (confirm("¿Estás seguro de que deseas eliminar este empleado?")) {
        fetch("eliminarEmpleado.php", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ emp_id: emp_id })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert(data.message);
                eliminarFila(emp_id);  // <- aquí estaba el error
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

// Función para llenar el formulario modal con los datos del empleado
function editarEmpleado(emp_id) {
    // Llamar al servidor para obtener los datos del empleado (esto debe hacerse con una solicitud AJAX)
    // Suponemos que el servidor devuelve los datos en formato JSON

    fetch('getEmpleado.php?id=' + emp_id)
        .then(response => response.json())
        .then(data => {
            // Llenar los campos del formulario modal con los datos
            document.getElementById('emp_id').value = data.emp_no;
            document.getElementById('nombre').value = data.first_name;
            document.getElementById('apellido').value = data.last_name;
            document.getElementById('fecha_nacimiento').value = data.birth_date;
            document.getElementById('fecha_contratacion').value = data.hire_date;
            document.getElementById('genero').value = data.gender;
            // Mostrar la ventana modal
            mostrarFormulario();
        })
        .catch(error => console.error('Error al obtener los datos del empleado:', error));
}

// Función para guardar los datos del empleado
function guardarEmpleado() {
   // const form = document.getElementById('formEmpleado');
    const emp_id = document.getElementById('emp_id').value;  // Obtener el ID del empleado
    const nombre = document.getElementById('nombre').value;
    const apellido = document.getElementById('apellido').value;
    const fecha_nacimiento = document.getElementById('fecha_nacimiento').value;
    const fecha_contratacion = document.getElementById('fecha_contratacion').value;
    const genero = document.getElementById('genero').value;

    // Crear un objeto con los datos a enviar
    const data = {
        emp_id: emp_id,
        nombre: nombre,
        apellido: apellido,
        fecha_nacimiento: fecha_nacimiento,
        fecha_contratacion: fecha_contratacion,
        genero: genero
    };

    // const formData = new FormData(form);

    fetch('editarEmpleado.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'  // Especificamos que el contenido será JSON
        },
        body: JSON.stringify(data)  // Convertimos el objeto a JSON
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Si la actualización fue exitosa, actualizar la tabla sin recargar la página
            actualizarFila(data.empleado);
            cerrarFormulario();
        } else {
            // Si hay un error, mostrar el mensaje de error
            alert(data.error || "Error al actualizar el empleado.");
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Error en la actualización.');
    });
}
function anyadirEmpleado() {
    // const form = document.getElementById('formEmpleado');
    // const emp_id = document.getElementById('emp_id').value;  // Obtener el ID del empleado
    mostrarFormulario();

     const nombre = document.getElementById('nombre').value;
     const apellido = document.getElementById('apellido').value;
     const fecha_nacimiento = document.getElementById('fecha_nacimiento').value;
     const fecha_contratacion = document.getElementById('fecha_contratacion').value;
     const genero = document.getElementById('genero').value;

     /* 
     // Validaciones en JavaScript
    if (!nombre || !apellido || !fecha_nacimiento || !fecha_contratacion || !genero) {
        alert("Todos los campos son obligatorios.");
        return;
    }
    */

     // Crear un objeto con los datos a enviar
     const data = {
        // emp_id: emp_id,
         nombre: nombre,
         apellido: apellido,
         fecha_nacimiento: fecha_nacimiento,
         fecha_contratacion: fecha_contratacion,
         genero: genero
     };
 
     // const formData = new FormData(form);
 
     fetch('anyadirEmpleado.php', {
         method: 'POST',
         headers: {
             'Content-Type': 'application/json'  // Especificamos que el contenido será JSON
         },
         body: JSON.stringify(data)  // Convertimos el objeto a JSON
     })
     .then(response => response.json())
     .then(data => {
         if (data.success) {
             // Si la actualización fue exitosa, actualizar la tabla sin recargar la página
             añadirFila(data.empleado);
             cerrarFormulario();
         } else {
             // Si hay un error, mostrar el mensaje de error
             alert(data.error || "Error al añadir el empleado.");
         }
     })
     .catch(error => {
         console.error('Error:', error);
         alert('Error en la inserción.');
     });
 }

 function añadirFila(empleado) {
    const tabla = document.getElementById('empleados');
    // insertar la nueva fila al principio de la tabla
    const nuevaFila = tabla.insertRow(1);

    nuevaFila.setAttribute('data-id', empleado.emp_no);
    nuevaFila.innerHTML = `
        <td>${empleado.emp_no}</td>
        <td>${empleado.first_name}</td>
        <td>${empleado.last_name}</td>
        <td>${empleado.birth_date}</td>
        <td>${empleado.hire_date}</td>
        <td>${empleado.gender}</td>
        <td><button onclick="editarEmpleado(${empleado.emp_no})">Editar</button>
        <button onclick="eliminarEmpleado(${empleado.emp_no})">Eliminar</button></td>
    `;
}
// Función para actualizar la fila de la tabla con los nuevos datos
function actualizarFila(empleado) {
    // Encontrar la fila correspondiente en la tabla
    const fila = document.querySelector(`tr[data-id='${empleado.emp_no}']`);
    console.log(fila);
    if (fila) {
        fila.children[1].textContent = empleado.first_name;  // Nombre
        fila.children[2].textContent = empleado.last_name;   // Apellido
        fila.children[3].textContent = empleado.birth_date;   // Fecha de nacimiento
        fila.children[4].textContent = empleado.hire_date;    // Fecha de contratación
        fila.children[5].textContent = empleado.gender;       // Género
    }
}

function eliminarFila(emp_id) {
    const fila = document.querySelector(`tr[data-id='${emp_id}']`);
    if (fila) fila.remove();
}


// Función para mostrar la ventana modal
function mostrarFormulario() {
    document.getElementById('modalFormulario').style.display = 'block';
}

// Función para cerrar la ventana modal
function cerrarFormulario() {
    document.getElementById('modalFormulario').style.display = 'none';
}



