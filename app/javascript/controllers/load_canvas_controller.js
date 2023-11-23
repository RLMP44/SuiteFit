import { Controller } from "@hotwired/stimulus"
import { fabric } from "fabric"

// Connects to data-controller="load-canvas"
export default class extends Controller {
  static targets = ["canvas", "my-image"]
  static values = {
    json: Object,
    length: String,
    width: String
  }

  connect() {
    console.log("hi")
    // retrieve apartment floor plan as serialized json
    console.log(this.jsonValue)
    // create empty canvas
    const canvas = new fabric.Canvas("new-canvas", {
      height: 500,
      width: 600,
    })
    // call function to load canvas
    const renderedCanvas = this.loadCanvas(canvas, this.jsonValue)
    console.log(renderedCanvas)

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


      // const rect = new fabric.Rect({
      //   height: 50,
      //   width: 50,
      //   fill: 'green',
      //   top: 100,
      //   left: 150,
      //   lockScalingX: true,
      //   lockScalingY: true,
      //   hasControls: false,
      //   lockMovementX: true,
      //   lockMovementY: true,
      //   selectable: false,
      // })
      // canvas.add(rect)
  }

  add(event, canvas) {
    console.log("hi")
    console.log(this.lengthValue, this.widthValue)
    const rect = new fabric.Rect({
        height: this.lengthValue,
        width: this.widthValue,
    })
    canvas.add(rect)
  }

  // create function to deserialize json and render apartment floor plan
  loadCanvas = (canvas, json) => {
    return canvas.loadFromJSON(json, canvas.renderAll.bind(canvas));
  }
}

// add clear items button

// get ahold of all items to detect collisions
// function onChange(options) {
//   options.target.setCoords();
//   canvas.forEachObject(function(obj) {
//     if (obj === options.target) return;
//     obj.set('opacity' ,options.target.intersectsWithObject(obj) ? 0.5 : 1);
//   });
// }
//
