let cursos = [];
const contenedor = document.getElementById("contenedor-cursos");
const template = document.getElementById("curso-template");
const ordenarSelect = document.getElementById("ordenar");

fetch("cursos.json")
  .then(res => res.json())
  .then(data => {
    cursos = data;
    renderizarCursos(cursos);
  });

ordenarSelect.addEventListener("change", () => {
  const criterio = ordenarSelect.value;
  let cursosOrdenados = [...cursos];

  if (criterio === "duracion") {
    cursosOrdenados.sort((a, b) => parseInt(a.duracion) - parseInt(b.duracion));
  } else {
    cursosOrdenados.sort((a, b) => a[criterio].localeCompare(b[criterio]));
  }

  renderizarCursos(cursosOrdenados);
});

function renderizarCursos(lista) {
  contenedor.innerHTML = "";
  const fragment = document.createDocumentFragment();

  lista.forEach(curso => {
    const clone = template.content.cloneNode(true);

    clone.querySelector(".imagen").src = `img/${curso.imagen}`;
    clone.querySelector(".imagen").alt = curso.nombre;
    clone.querySelector(".nombre").textContent = curso.nombre;
    clone.querySelector(".tecnologia").textContent = `Tecnología: ${curso.tecnologia}`;
    clone.querySelector(".duracion").textContent = `Duración: ${curso.duracion}`;
    clone.querySelector(".precio").textContent = `Precio: ${curso.precio}`;
    clone.querySelector(".descripcion").textContent = curso.descripcion;

    const tarjeta = clone.querySelector(".curso");
    tarjeta.addEventListener("click", () => {
      tarjeta.classList.toggle("seleccionado");
    });

    fragment.appendChild(clone);
  });

  contenedor.appendChild(fragment);
}
