// Prevenir el envío del formulario al hacer clic en el botón de editar
document.querySelectorAll(".editar").forEach(function (button) {
    button.addEventListener("click", function (event) {
      event.preventDefault();
    });
  });

   // Abrir el modal cuando se haga clic en el botón "Añadir"
   document
   .getElementById("btnAgregarCargo")
   .addEventListener("click", function () {
     var modal = document.getElementById("modalAgregarCargo");
     modal.style.display = "block";
   });

 // Cerrar el modal cuando se haga clic en la "x"
 document
   .getElementById("cerrarModal")
   .addEventListener("click", function () {
     var modal = document.getElementById("modalAgregarCargo");
     modal.style.display = "none";
   });

 document
   .getElementById("cerrarModalEditar")
   .addEventListener("click", function () {
     cerrarEditar(true); // Puedes pasar 'true' o 'false' según sea necesario
   });

 // Establecer el valor del ID del departamento en el formulario cuando se abra el modal
 document
   .getElementById("btnAgregarCargo")
   .addEventListener("click", function () {
     var departamentoId = obtenerDepartamentoId(); // Obtén el ID del departamento (puedes usar JavaScript para obtenerlo)
     document.getElementById("departamento_id").value = departamentoId;
   });

 $(document).ready(function () {
   // Cuando la página esté lista, realiza la solicitud AJAX
   var departamentoId = obtenerDepartamentoId(); // Obtén el ID del departamento (puedes usar JavaScript para obtenerlo)
   $.ajax({
     type: "GET",
     url: "/cargos/" + departamentoId,
     dataType: "json",
     success: function (data) {
       // Manipula los datos y muestra la lista de cargos
       var cargosList = $("#cargos-list");
       cargosList.empty(); // Limpia el contenido previo si lo hubiera

       data.forEach(function (cargo) {
         var cargoHtml =
           "<p>ID: " +
           cargo.ID +
           ", Nombre: " +
           cargo.Nombre +
           ", Salario Base: " +
           cargo.Salario_Base +
           "</p>";
         cargosList.append(cargoHtml);
       });
     },
     error: function (error) {
       console.log("Error al cargar los cargos: " + error);
     },
   });
 });
 function abrirModalEditar(id, nombre, salario_base) {
   var modal = document.getElementById("modalEditarCargo");
   modal.style.display = "block";

   document.getElementById("cargo_id_edit").value = id;
   document.getElementById("nombre_cargo_edit").value = nombre;
   document.getElementById("salario_base_edit").value = salario_base;
 }

 function cerrarEditar(cerrarModalEditar) {
   var modal = document.getElementById("modalEditarCargo");

   if (cerrarModalEditar && modal) {
     modal.style.display = "none";
   }
 }