import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="requests-subscription"
export default class extends Controller {
  static targets = ["requestList", "requestsSidebar"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      {channel: "RequestsChannel"},
      {received: data => this.#insertCountAndRequest(data)}
    )
  }

  #insertCountAndRequest(data) {
    this.#insertCountIntoSidebar(data)
    this.#insertRequestIntoRequestList(data)
  }

  #insertCountIntoSidebar(data) {
    this.requestsSidebarTarget.innerHTML = data.count
  }

  #insertRequestIntoRequestList(data) {
    if (this.requestListTarget) {
      Array.from(this.requestListTarget.children).forEach(child => {
        if (data.bookmark_id === child.id) {
          child.remove()
        }
      });
    }
    this.requestListTarget.insertAdjacentHTML("afterbegin", data.user_message)
  }
}

// sidebar: the new requests badge should stay until a request has been clicked
// requests page should have all requests, newer on top
// the same request should only appear once
// a request should go to the top if there is a new message from the client %>
// <% if bookmark.user_last_message.present? && bookmark.user_last_message.unread? %>
