document.addEventListener("DOMContentLoaded", function () {
    // Función para mostrar y ocultar el dropdown
    function toggleDropdown() {
        document.getElementById("ingredientDropdown").classList.toggle("show");
    }

    // Función para actualizar la lista de ingredientes seleccionados
    function updateSelectedIngredients() {
        let selected = [];
        document
            .querySelectorAll("input[name='ingredient']:checked")
            .forEach((checkbox) => {
                selected.push(checkbox.value);
            });
        document.getElementById("selectedIngredients").innerText =
            selected.join(", ");
    }

    // Cierra el dropdown si se hace clic fuera de él
    window.onclick = function (event) {
        if (!event.target.matches(".dropbtn")) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            for (var i = 0; i < dropdowns.length; i++) {
                dropdowns[i].classList.remove("show");
            }
        }
    };

    // Añadir los eventos de los botones
    document.querySelectorAll(".dropbtn").forEach((button) => {
        button.addEventListener("click", toggleDropdown);
    });

    document
        .querySelectorAll("input[name='ingredient']")
        .forEach((checkbox) => {
            checkbox.addEventListener("change", updateSelectedIngredients);
        });
});
