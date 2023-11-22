import { Controller } from "@hotwired/stimulus"
import { fabric } from 'fabric'

// Connects to data-controller="apartment-canvas"
export default class extends Controller {
  static targets = ["canvas", "drawButton", 'saveButton']
  static values = {'floorplanUrl': String}
  connect() {
    // create new canvas
    // canvas should scale to the picture size?
    const canvas = this.canvas = new fabric.Canvas('new-canvas', {
      width: 800,
      height: 1000
    })

    // set a floorplan on the canvas
    fabric.Image.fromURL(this.floorplanUrlValue, function(img) {
      img.scaleToWidth(canvas.getWidth());
      // canvas.add(img);
      canvas.setBackgroundImage(img, canvas.renderAll.bind(canvas))
    })
  }

  // trace a floorplan on the canvas
  drawFloorplan(event) {
    this.canvas.isDrawingMode = true
    event.currentTarget.classList.add('d-none')
    this.saveButtonTarget.classList.remove('d-none')
  }

  // save the canvas to JSON/serialize
  saveFloorplan(event) {
    this.canvas.isDrawingMode = false
    event.currentTarget.classList.add('d-none')
    this.drawButtonTarget.classList.remove('d-none')
    // JSON.stringify(canvas)
  }
}
