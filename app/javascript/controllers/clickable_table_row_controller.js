import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clickable-table-row"
export default class extends Controller {
  connect() {
    
    
  }

  clicked(event) {
    event.preventDefault();
    console.log("Clicked");
    const objectId = this.element.dataset.value;

    // Get the current path without the base URL
    let path = window.location.pathname;

    // Check if the current path is root ('/') and adjust it
    if (path === '/') {
      path = '/players'; // Assuming '/players' is your root path
    }

    // Ensure there's no trailing slash
    if (path.endsWith('/')) {
      path = path.slice(0, -1);
    }

    // Construct the new URL
    const newUrl = `${window.location.origin}${path}/${objectId}`;

    // Redirect to the new URL
    window.location.href = newUrl;
  }

  // clicked(event) {
  //   event.preventDefault();
  //   console.log("Clicked");
  //   const objectId = this.element.dataset.value;

  //   // Get the current path without the base URL
  //   const path = window.location.pathname;

  //   // Construct the new URL
  //   const newUrl = `${window.location.origin}${path}/${objectId}`;

  //   // Redirect to the new URL
  //   window.location.href = newUrl;
  // }
}
