import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="requests-subscription"
export default class extends Controller {
  static targets = ["userRequests", "requestsSidebar", "requestsIndex"]
  static values = {agencyId:Number}

  connect() {
    this.channel = createConsumer().subscriptions.create(
      {channel: "RequestsChannel", user_id: this.agencyIdValue},
      {received: data => this.#insertCountAndRequests(data)}
    )
  }

  #insertCountAndRequests(data) {
    console.log(data)
    this.#insertCountIntoSidebar(data)
    this.#insertRequestsIntoIndex(data)
  }

  #insertCountIntoSidebar(data) {
    console.log(data)
    this.requestsSidebarTarget.innerHTML = data.count
  }

  #insertRequestsIntoIndex(data) {
    if (this.userRequestsTarget) {
      this.requestsIndexTarget.innerHTML = data.count
      this.userRequestsTarget.outerHTML = data.user_message
    }
  }
}
