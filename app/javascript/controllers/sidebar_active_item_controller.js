import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar-active-item"
export default class extends Controller {
  static targets = ["item"]

  connect() {
    this.updateActiveClass()
  }

  addActiveClass(event) {
    this.itemTargets.forEach((item) => {
      item.classList.remove("sidebar-menu-item-active")
    })
    event.currentTarget.classList.add("sidebar-menu-item-active")
  }

  updateActiveClass() {
    const activeItem = this.itemTargets.find((item) => {
      return window.location.href.includes(item.getAttribute('href'))
    })
    if (activeItem) {
      activeItem.classList.add("sidebar-menu-item-active")
    }
  }
}
