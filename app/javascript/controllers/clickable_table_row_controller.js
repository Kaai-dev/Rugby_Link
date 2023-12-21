import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clickable-table-row"
export default class extends Controller {
  connect() {
    
    
  }

  clicked(event){
    event.preventDefault();
    console.log("Clicked");
    const objectId = this.element.dataset.value;
    const url = window.location.href;

    window.location.href = ``;
    window.location.href = `${url}/${objectId}`;

  }
}
