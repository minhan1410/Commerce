const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container");

sign_up_btn.addEventListener("click", () => {
  container.classList.add("sign-up-mode");
});

sign_in_btn.addEventListener("click", () => {
  container.classList.remove("sign-up-mode");
});
$(document).ready( function () {
  let dropdown = $(".right-panel").children(".dropdown");
  console.log($(dropdown).children("#dropdownMenuButton1"));
  $(dropdown).children("#dropdownMenuButton1").click(function () {
    alert("tenn");
});
});
