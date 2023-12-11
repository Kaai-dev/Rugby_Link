import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile-pic-preview"
export default class extends Controller {
    static targets = [ "preview", "existing", "previewMain", "existingMain" ]


  
  connect() {
  }

    preview(event) {
      const profile_pic = event.target.files[0];
      const reader = new FileReader();

      reader.onload = (e) => {
        this.previewTarget.src = e.target.result;
        this.previewMainTarget.src = e.target.result;
        this.previewTarget.style.display = "inline-block";
        this.existingTarget.style.display = "none";
        this.previewMainTarget.style.display = "inline-block";
        this.existingMainTarget.style.display = "none";
        console.log(this.existingTarget)
      };
      reader.readAsDataURL(profile_pic);
    }

}
