import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clickable-table-row"
export default class extends Controller {
  connect() {
    console.log(this.element.dataset.value)
    
  }

  clicked(event){
    // event.preventDefault();
    console.log("Clicked");
    const playerId = this.element.dataset.value

    window.location.href = `/players/${playerId}`;
  }
}
