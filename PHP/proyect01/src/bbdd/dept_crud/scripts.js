// Función para confirmar la eliminación de un empleado
function confirmarEliminacion(id) {
    if (confirm("¿Estás seguro de que deseas eliminar este departamento?")) {
        // Realizar la eliminación (esto debería ser gestionado por PHP)
        alert("Departamento con ID " + id + " eliminado");
    }
}

// Función para llenar el formulario modal con los datos del departamento
function editarDepartamento(dept_id) {
    // Llamar al servidor para obtener los datos del departamento (esto debe hacerse con una solicitud AJAX)
    // Suponemos que el servidor devuelve los datos en formato JSON

    fetch('getDepartamento.php?id=' + dept_id)
        .then(response => response.json())
        .then(data => {
            // Llenar los campos del formulario modal con los datos
            document.getElementById('dept_id').value = data.dept_no;
            document.getElementById('nombre').value = data.dept_name;            
            // Mostrar la ventana modal
            mostrarFormulario();
        })
        .catch(error => console.error('Error al obtener los datos del departamento:', error));
}

// Función para guardar los datos del departamento
function guardarDepartamento() {

    const dept_id = document.getElementById('dept_id').value;  // Obtener el ID del departamento
    const nombre = document.getElementById('nombre').value;    

    // Crear un objeto con los datos a enviar
    const data = {
        dept_id: dept_id,
        nombre: nombre        
    };

    fetch('editarDepartamento.php', {
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
            actualizarFila(data.departamento);
            cerrarFormulario();
        } else {
            // Si hay un error, mostrar el mensaje de error
            alert(data.error || "Error al actualizar el departamento.");
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Error en la actualización.');
    });
}

// Función para actualizar la fila de la tabla con los nuevos datos
function actualizarFila(departamento) {
    // Encontrar la fila correspondiente en la tabla
    const fila = document.querySelector(`tr[data-id='${departamento.dept_no}']`);
    console.log(fila);
    if (fila) {
        fila.children[1].textContent = departamento.dept_name;  // Nombre              
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
function eliminarDepartamento(dept_no) {
    if (confirm("¿Estás seguro de que deseas eliminar el departamento con ID: " + dept_no + "?")) {
        alert("Departameto con ID " + dept_no + " eliminado");
        // Aquí puedes agregar la lógica para eliminar el empleado de la base de datos
    }
}

