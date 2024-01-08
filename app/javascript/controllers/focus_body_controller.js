import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="focus-body"
export default class extends Controller {
  connect() {
    this.element.focus()
  }
}
