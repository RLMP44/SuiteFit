import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-forms"
export default class extends Controller {
  static targets = ["fpForm"]
  connect() {
  }

  submitBothForms() {
    fetch(this.fpFormTarget.action, {
      method: "POST",
      body: new FormData(this.fpFormTarget)
    });
  }
}
