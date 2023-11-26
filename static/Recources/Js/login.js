const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container");

sign_up_btn.addEventListener("click", () => {
  container.classList.add("sign-up-mode");
});

sign_in_btn.addEventListener("click", () => {
  container.classList.remove("sign-up-mode");
});


let pswrd = document.getElementById("password");
let toggleBtn = document.getElementById("toggleBtn");

toggleBtn.onclick = function () {
  if (pswrd.type === "password") {
    pswrd.setAttribute("type", "text");
  } else {
    pswrd.setAttribute("type", "password");
  }

  // Toggle the "hide" class
  toggleBtn.classList.toggle("hide");
};

let vercontra = document.getElementById("Contraseña");
let eyesbtn = document.getElementById("eyesbtn");

eyesbtn.onclick = function () {
  if (vercontra.type === "password") {
    vercontra.setAttribute("type", "text");
  } else {
    vercontra.setAttribute("type", "password");
  }

  // Toggle the "hide" class
  eyesbtn.classList.toggle("hide");
};