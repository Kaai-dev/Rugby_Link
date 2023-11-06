import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="players-form"
export default class extends Controller {
  static targets = ["positionDropdown", "dropdownButton"];
  connect() {
  }



  addDropdown(event){

    event.preventDefault();

    const select = document.createElement("select")
    select.classList.add("btn", "btn-secondary", "dropdown-toggle", "d-block");

    const options = [
      ['1 - Loosehead Prop', 1],
      ['2 - Hooker', 2],
      ['3 - Tighthead Prop', 3],
      ['4 - Lock (Second Row)', 4],
      ['5 - Lock (Second Row)', 5],
      ['6 - Blindside Flanker', 6],
      ['7 - Openside Flanker', 7],
      ['8 - Number Eight', 8],
      ['9 - Scrum-Half', 9],
      ['10 - Fly-Half', 10],
      ['11 - Left Wing', 11],
      ['12 - Inside Centre', 12],
      ['13 - Outside Centre', 13],
      ['14 - Right Wing', 14],
      ['15 - Fullback', 15]
      ];

      options.forEach(([text, value]) =>{
        const option = document.createElement("option");
        option.text = text;
        option.value = value;
        select.appendChild(option);
      });

      this.positionDropdownTarget.appendChild(select);

      // Append a break element to move to the next line
      const br = document.createElement("br");
      this.positionDropdownTarget.appendChild(br);

  }
}
