import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="bookmark-subscription"
export default class extends Controller {
  static targets = ["messages"]
  static values = {bookmarkId: Number}

  connect() {
    console.log(this.bookmarkIdValue)
    this.channel = createConsumer().subscriptions.create(
      {channel: "BookmarkChannel", id: this.bookmarkIdValue},
      {received: data => this.#insertMessageAndScrollDown(data)}
    )
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    this.channel.unsubscribe()
  }
}
