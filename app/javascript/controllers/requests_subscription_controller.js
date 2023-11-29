import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="requests-subscription"
export default class extends Controller {
  static targets = ["userRequests", "requestsSidebar", "requestsIndex"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      {channel: "RequestsChannel"},
      {received: data => this.#insertCountAndRequests(data)}
    )
  }

  #insertCountAndRequests(data) {
    this.#insertCountIntoSidebar(data)
    this.#insertRequestsIntoIndex(data)
  }

  #insertCountIntoSidebar(data) {
    this.requestsSidebarTarget.innerHTML = data.count
    this.requestsSidebarTarget.classList.add("rounded-pill", "bg-secondary", "text-white", "px-2")
  }

  #insertRequestsIntoIndex(data) {
    if (this.userRequestsTarget) {
      this.requestsIndexTarget.innerHTML = data.count
      this.userRequestsTarget.outerHTML = data.user_message
    }
  }
}
