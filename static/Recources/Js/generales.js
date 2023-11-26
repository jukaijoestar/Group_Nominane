      //efecto de escritura
      var typed = new Typed(".auto-type", {
        strings: [
          "Explora contigo",
          "Te facilita",
          "Líderes del futuro",
          "Nomimane",
        ],
        typeSpeed: 100,
        backSpeed: 50,
        looped: true,
      });


      //mostar el menu
      $(document).ready(function () {
        // Alternar el menú al hacer clic en el botón del menú
        $(".botonMenu").click(function () {
          $(".principal").toggleClass("menu-abierto");
        });

        // Cerrar el menú al hacer clic fuera de él
        $(document).click(function (event) {
          if (!$(event.target).closest(".botonMenu, .principal").length) {
            $(".principal").removeClass("menu-abierto");
          }
        });

        // Evitar que los clics dentro del menú lo cierren
        $(".principal").click(function (event) {
          event.stopPropagation();
        });
      });

      //funcion de busqueda dentro del menu
      document.addEventListener("DOMContentLoaded", function () {
        const searchInput = document.getElementById("search-input");
        const menuLinks = document.querySelectorAll(".enlace-lista");
        const allLinks = document.querySelectorAll(".enlace-lista, .enlace-li");

        searchInput.addEventListener("input", function () {
          const searchTerm = searchInput.value.trim().toLowerCase();

          allLinks.forEach(function (link) {
            const linkText = link.textContent.trim().toLowerCase();
            const isMatch = linkText.includes(searchTerm);

            if (isMatch) {
              link.classList.remove("hidden");
            } else {
              link.classList.add("hidden");
            }
          });
        });
      });

      document.addEventListener("DOMContentLoaded", function () {
        const searchInput = document.getElementById("search");
        const employeeTable = document.getElementById("employee-table");
        const rows = employeeTable.getElementsByTagName("tr");

        searchInput.addEventListener("input", function () {
          const searchTerm = searchInput.value.toLowerCase();

          for (let i = 1; i < rows.length; i++) {
            const rowData = rows[i].textContent.toLowerCase();
            if (rowData.includes(searchTerm)) {
              rows[i].style.display = "";
            } else {
              rows[i].style.display = "none";
            }
          }
        });
      });
      