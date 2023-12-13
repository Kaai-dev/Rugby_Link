import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dark-mode"
export default class extends Controller {
  static targets = ["switchDarkLight"]
  connect() {

  }

  switch(event){
    
    if (this.switchDarkLightTarget.checked) {
      document.documentElement.setAttribute("data-bs-theme", "light");
      const body = document.querySelector("body");
      body.style.backgroundColor = "#b8b8b8";
    } else {
      document.documentElement.setAttribute("data-bs-theme", "dark");
      const body = document.querySelector("body");
      body.style.backgroundColor = "#505050";
    }
  }
}

// Bug when switching to another page on while light mode is on