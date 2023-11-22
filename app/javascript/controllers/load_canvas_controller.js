import { Controller } from "@hotwired/stimulus"
import { fabric } from "fabric"

// Connects to data-controller="load-canvas"
export default class extends Controller {
  static targets = ["canvas"]

  connect() {
    console.log("hi")
    const canvas = new fabric.Canvas("canvas")
    // const renderedCanvas = this.loadCanvas(canvas);
  }

  loadCanvas = (canvas, json) => {
    return canvas.loadFromJSON(json, canvas.renderAll.bind(canvas));
  }
}
