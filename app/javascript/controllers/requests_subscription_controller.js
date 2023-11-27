import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="requests-subscription"
export default class extends Controller {
  static targets = ["userMessages", "requests"]
  static values = {agencyId:Number}

  connect() {
    console.log(this.requestsTarget)
    console.log(this.agencyIdValue)
    this.channel = createConsumer().subscriptions.create(
      {channel: "RequestsChannel", user_id: this.agencyIdValue},
      {received: data => console.log(data)}
    )
  }
}
