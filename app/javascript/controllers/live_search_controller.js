import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="live-search"
export default class extends Controller {
  static targets = [ "searchButton", "input" ]
  connect() {
    console.log("TODO: Finish live search controller")
  }

  search(event) { 
    console.log("searching...")
    this.searchButtonTarget.click();
  }
}
