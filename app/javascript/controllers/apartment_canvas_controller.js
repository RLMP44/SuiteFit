import { Controller } from "@hotwired/stimulus"
import { fabric } from 'fabric'

// Connects to data-controller="apartment-canvas"
export default class extends Controller {
  static targets = ["canvas"]
  connect() {
    // create new canvas
    const canvas = new fabric.Canvas('new-canvas', {
      width: 800,
      height: 1000
    })

    const rect = new fabric.Rect({ width: 10, height: 20, fill: '#f55', opacity: 0.7 })
    canvas.add(rect)

    fabric.Image.fromURL('/app/assets/images/floorplan.jpg', function(oImg) {
      canvas.add(oImg);
    });
    // const floorPlan = document.createElement("img")
    // floorPlan.scr = "./app/assets/images/floorplan.jpg"
    // const floorPlanInstance = new fabric.Image(floorPlan);
    // canvas.add(floorPlanInstance)
  }
}
