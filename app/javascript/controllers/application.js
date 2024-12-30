import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

/*
 * verifies if at least one element with a class exists
 */
function existElementWithClass(className) {
  const element = document.querySelector(`.${className}`);
  return element != null; 
}

function showNoItemFound() {
  const itemNotFound = document.querySelector('#no-item-found');
  if (itemNotFound != null && existElementWithClass('purchase-link') ) {
    itemNotFound.style.display = 'none';
  } else {
    itemNotFound.style.display = 'block';
  }
}

document.addEventListener('DOMContentLoaded', () => {
      showNoItemFound();
  });
document.addEventListener("DOMNodeRemoved", () => {
      showNoItemFound();
  })

export { application }
