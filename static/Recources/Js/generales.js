      //efecto de escritura
      var typed = new Typed(".auto-type", {
        strings: [
          "Explora contigo  🔍",
          "Te facilita  📈",
          "Líderes del futuro 🏆",
          "Nomimane ✍️",
        ],
        typeSpeed: 100,
        backSpeed: 50,
        looped: true,
      });

      //mostar el menu
      let mostrarOcultarNav = document.getElementById("menu-admi");
      let nav = document.getElementById("nav");

      vanNav = true;
      mostrarOcultarNav.addEventListener("click", function () {
        if (vanNav == true) {
          nav.classList.remove("menu-admi");
          vanNav = false;
        } else {
          nav.classList.add("menu-admi");
          vanNav = true;
        }
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
      