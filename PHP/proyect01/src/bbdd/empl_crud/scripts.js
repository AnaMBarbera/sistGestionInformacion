// Función para confirmar la eliminación de un empleado
function confirmarEliminacion(id) {
    if (confirm("¿Estás seguro de que deseas eliminar este empleado?")) {
        // Realizar la eliminación (esto debería ser gestionado por PHP)
        alert("Empleado con ID " + id + " eliminado");
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


// Función para mostrar la ventana modal
function mostrarFormulario() {
    document.getElementById('modalFormulario').style.display = 'block';
}

// Función para cerrar la ventana modal
function cerrarFormulario() {
    document.getElementById('modalFormulario').style.display = 'none';
}

// Función para eliminar un empleado
function eliminarEmpleado(emp_no) {
    if (confirm("¿Estás seguro de que deseas eliminar el empleado con ID: " + emp_no + "?")) {
        alert("Empleado con ID " + emp_no + " eliminado");
        // Aquí puedes agregar la lógica para eliminar el empleado de la base de datos
    }
}

