// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"

document.addEventListener("DOMContentLoaded", function() {
  const backToTopButton = document.getElementById("back-to-top");
  window.addEventListener("scroll", () => {
    if (window.scrollY > 200) {
      backToTopButton.style.display = "block";
    } else {
      backToTopButton.style.display = "none";
    }
  });
  // using scroll instead of the href to trigger the scroll event
  backToTopButton.addEventListener("click", (event) => {
    event.preventDefault();
    window.scrollTo({
      top: 0,
      behavior: "smooth",
    });
  });
})
