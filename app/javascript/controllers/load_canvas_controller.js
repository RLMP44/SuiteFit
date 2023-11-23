import { Controller } from "@hotwired/stimulus"
import { fabric } from "fabric"

// Connects to data-controller="load-canvas"
export default class extends Controller {
  static targets = ["canvas", "my-image"]
  static values = {
    json: Object,
  }

  connect() {
    // create empty canvas
    this.canvas = new fabric.Canvas("new-canvas", {
      height: 1000,
      width: 800,
    })
    // call function to load canvas from existing bookmark.arrangement or apartment.floor_plan json
    const renderedCanvas = this.loadCanvas(this.canvas, this.jsonValue)
    console.log(renderedCanvas)
    // get ahold of all items to detect collisions
    const onChange=(options) => {
      options.target.setCoords();
      this.canvas.forEachObject(function(obj) {
        console.log(obj)
        if (obj === options.target) return;
        obj.set('opacity' ,options.target.intersectsWithObject(obj) ? 0.5 : 1);
      });
    }
    // trigger onChange method in the following situations
    this.canvas.on({
      'object:moving': onChange,
      'object:scaling': onChange,
      'object:rotating': onChange,
    });
  }

  // method to add clicked item to canvas
  add(event) {
    const rect = new fabric.Rect({
        height: parseInt(event.currentTarget.dataset.length),
        width: parseInt(event.currentTarget.dataset.width),
        fill: '#aac',
        originX: 'left',
        originY: 'top',
        hasBorders: false,
        transparentCorners: true,
        cornerSize: 5,
    })
    this.canvas.add(rect)
  }

  clear(event) {
    console.log("Hi from clear")
    this.canvas.clear()
  }

  // function to deserialize json and render apartment floor plan or bookmark arrangement
  loadCanvas(canvas, json) {
    return canvas.loadFromJSON(json, canvas.renderAll.bind(canvas));
  }
}

// add clear items button

//   // get image/icon element to add to canvas
  //   const imgElement = this.dataTarget('my-image')
  //   // find on-canvas length of selected door, scale to size using standard 80 cm door
  //   const ratio = this.selectedObject.length / 80
  //   // create instance of user item on canvas and scale with ratio
  //   const imgInstance = new fabric.Image(imgElement, {
    //     // pass in data, note that length doesn't exist in fabric so it becomes height
    //     height: this.dataTarget.length * ratio,
    //     width: this.dataTarget.width * ratio,
    //     top: 20,
    //     left: 20,
    //     lockScalingX: true,
    //     lockScalingY: true,
    //   });
    // canvas.add(imgInstance);
    // canvas.renderAll();
