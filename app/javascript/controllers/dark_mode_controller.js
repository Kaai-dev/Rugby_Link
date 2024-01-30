import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dark-mode"
export default class extends Controller {
  static targets = ["switchDarkLightMobile", "switchDarkLightDesktop"]
  connect() {

  }

  switchMobile(event){
    const user_setting_id = this.switchDarkLightMobileTarget.dataset.valueUserSettingId;
    
    var url = `/user_settings/${user_setting_id}/dark_mode_route`;
    
    if (this.switchDarkLightMobileTarget.checked) {
      document.documentElement.setAttribute("data-bs-theme", "light");
      const body = document.querySelector("body");
      body.style.backgroundColor = "#fff";

      fetch(url, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": getCsrfToken(),
        },
        body: JSON.stringify({ dark_mode: false }),
      }).then((response) => {
        if (response.ok) {
          location.reload();
        } else {
          throw new Error("Network response was not ok.");
        }
      });

    } else {
      document.documentElement.setAttribute("data-bs-theme", "dark");
      const body = document.querySelector("body");
      body.style.backgroundColor = "#212529";

      fetch(url, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": getCsrfToken(),
        },
        body: JSON.stringify({ dark_mode: true }),
      }).then((response) => {
        if (response.ok) {
          location.reload();
        } else {
          throw new Error("Network response was not ok.");
        }
      });
    }
  }

  switchDesktop(event){
    const user_setting_id = this.switchDarkLightDesktopTarget.dataset.valueUserSettingId;
    
    var url = `/user_settings/${user_setting_id}/dark_mode_route`;
    
    if (this.switchDarkLightDesktopTarget.checked) {
      document.documentElement.setAttribute("data-bs-theme", "light");
      const body = document.querySelector("body");
      body.style.backgroundColor = "#fff";

      fetch(url, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": getCsrfToken(),
        },
        body: JSON.stringify({ dark_mode: false }),
      }).then((response) => {
        if (response.ok) {
          location.reload();
        } else {
          throw new Error("Network response was not ok.");
        }
      });

      document.querySelector(".sidebar").classList.remove("bg-dark");
      document.querySelector(".sidebar").classList.add("bg-light");

    } else {
      document.documentElement.setAttribute("data-bs-theme", "dark");
      const body = document.querySelector("body");
      body.style.backgroundColor = "#212529";

      fetch(url, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": getCsrfToken(),
        },
        body: JSON.stringify({ dark_mode: true }),
      }).then((response) => {
        if (response.ok) {
          location.reload();
        } else {
          throw new Error("Network response was not ok.");
        }
      });

      document.querySelector(".sidebar").classList.remove("bg-light");
      document.querySelector(".sidebar").classList.add("bg-dark");
    }
  }

  
}

function getCsrfToken() {
  const token = document.querySelector("meta[name='csrf-token']").getAttribute("content");
  return token;
}
