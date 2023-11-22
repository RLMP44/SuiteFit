import { Controller } from "@hotwired/stimulus"
import { fabric } from "fabric"

// Connects to data-controller="load-canvas"
export default class extends Controller {
  static targets = ["canvas"]
  static values = {json: String}

  connect() {
    console.log("hi")
    // fake json data
    const serializedjson = this.jsonValue
    const canvas = new fabric.Canvas("new-canvas", {
      height: 500,
      width: 600,
    })
    const renderedCanvas = this.loadCanvas(canvas, serializedjson)
    console.log(renderedCanvas)
  }

  loadCanvas = (canvas, serializedjson) => {
    return canvas.loadFromJSON(serializedjson, canvas.renderAll.bind(canvas));
  }
}
