import { Controller } from "@hotwired/stimulus"
import { fabric } from 'fabric'

// Connects to data-controller="apartment-canvas"
export default class extends Controller {
  static targets = ["canvas"]
  static values = [{'floorplanUrl':String}]
  connect() {
    // create new canvas
    const canvas = new fabric.Canvas('new-canvas', {
      width: 800,
      height: 1000
    })

    // set a floorplan on the canvas
    console.log(this.floorplanUrlValue)
    fabric.Image.fromURL(this.floorplanUrlValue, function(floorplan) {
      canvas.add(floorplan);
    });
    // const floorPlan = document.createElement("img")
    // floorPlan.scr = this.floorplanUrlValue
    // const floorPlanInstance = new fabric.Image(floorPlan);
    // canvas.add(floorPlanInstance)
  }
}
