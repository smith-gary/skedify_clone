import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ["slot"]

  select(event) { 
    this.slotTargets.forEach(el => el.classList.remove("selected"))
    event.currentTarget.classlist.add("selected")
  }
  
  connect() {
  }
}
