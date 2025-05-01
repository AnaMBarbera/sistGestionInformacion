

// Función para confirmar la eliminación de un empleado
function eliminarDepartamento(dept_id) {
    if (confirm("¿Estás seguro de que deseas eliminar este departamento?")) {
        fetch("eliminarDepartamento.php", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ dept_id: dept_id })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert(data.message);
                eliminarFila(dept_id);
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

function eliminarFila(dept_id) {
    const fila = document.querySelector(`tr[data-id='${dept_id}']`);
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

function anyadirDepartamento() {
    //const form = document.getElementById('formEmpleado');
    const nombre = document.getElementById("nombre").value;    
  
    // Validaciones en JavaScript
    if (!nombre) {
      alert("El campo nombre es obligatorio");
      return;
    }  
    // Crear un objeto con los datos a enviar
    const data = {
      nombre: nombre,     
    };
      
    fetch("anyadirDepartamento.php", {
      method: "POST",
      headers: {
        "Content-Type": "application/json", // Especificamos que el contenido será JSON
      },
      body: JSON.stringify(data), // Convertimos el objeto a JSON
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.success) {
          // Si la actualización fue exitosa, actualizar la tabla sin recargar la página
          anyadirFila(data.departamento);
          cerrarFormulario();
        } else {
          // Si hay un error, mostrar el mensaje de error
          alert(data.error || "Error al añadir el departamento.");
        }
      })
      .catch((error) => {
        console.error("Error:", error);
        alert("Error en la inserción.");
      });
  }
  
  // Función para agregar el empleado a la tabla
  function anyadirFila(departamento) {
    const tabla = document.getElementById('departamentos');
    // insertar la nueva fila al principio de la tabla
    const nuevaFila = tabla.insertRow(1);
  
    nuevaFila.setAttribute('data-id', departamento.dept_no);
    nuevaFila.innerHTML = `
        <td>${departamento.dept_no}</td>
        <td>${departamento.dept_name}</td>       
        <td><button onclick="editarDepartamento(${departamento.emp_no})">Editar</button>
        <button onclick="eliminarDepartamento(${departamento.emp_no})">Eliminar</button></td>
    `;
  }
  //con esta función elegimos la opción de añadir empleado o editarlo si se ha seleccionado uno previamente (hay 'emp_id'). Es la función que llamará el botón guardar del formulario modal.
  function editarCrearDepartamento() {
    const dept_id = document.getElementById("dept_id").value;
    if (dept_id === "") {
      anyadirDepartamento();
    } else {
      guardarDepartamento();
    }
  }


