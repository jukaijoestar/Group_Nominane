document.addEventListener("DOMContentLoaded", function () {
    let timerInterval;
    Swal.fire({
      title: "Bienvenido Administrador",
      html: "¡Gracias por utilizar nuestro sistema de administración!",
      timer: 3000, // Puedes ajustar el tiempo de cierre automático según tus necesidades
      timerProgressBar: true,
      icon: "success",
      didOpen: () => {
        Swal.showLoading();
        const timer = Swal.getPopup().querySelector("b");
        timerInterval = setInterval(() => {
          timer.textContent = `${Swal.getTimerLeft()}`;
        }, 100);
      },
      willClose: () => {
        clearInterval(timerInterval);
      },
    }).then((result) => {
      /* Read more about handling dismissals below */
      if (result.dismiss === Swal.DismissReason.timer) {
        console.log("Se cerró automáticamente por el temporizador");
      }
    });
  });

  let progressBar = document.querySelector(".circular-progress");
  let valueContainer = document.querySelector(".value-container");

  let progressValue = 0;
  let progressEndValue = 70;
  let speed = 50;

  let progress = setInterval(() => {
    progressValue++;
    valueContainer.textContent = `${progressValue}%`;
    progressBar.style.background = `conic-gradient(
      #80808084 ${progressValue * 3.6}deg,
  rgba(181, 181, 181, 0.201) ${progressValue * 3.6}deg
)`;
    if (progressValue == progressEndValue) {
      clearInterval(progress);
    }
  }, speed);