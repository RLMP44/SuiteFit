import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-item-popup"
export default class extends Controller {
  static targets = ["form", "modal"]
  static values = {
    display: Boolean
  }
  connect() {
    // console.log("itempopaup controller con")
    // console.log(this);
    // console.log(this.modalTarget.dataset)

    if (this.modalTarget.dataset.popup === "true"){
      const myModal = new bootstrap.Modal(this.modalTarget)
      myModal.show(this.modalTarget)
    }
  }
  submit(event){
    event.preventDefault()
    fetch(location.href, {
      headers: {"Accept": "text/plain"},
      method: "POST",
      body: new FormData(this.formTarget.children[0])
    }).then(response=> response.text())
    .then((data) => {
      this.formTarget.innerHTML = data
      const inputs_valid = this.formTarget.querySelectorAll(".is-invalid").length == 0
      if (inputs_valid) {
        this.formTarget.previousElementSibling.querySelector(".btn-close").click();
      }
    })
  }
}
