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
      height: 800,
      width: 800,
    })
    // call function to load canvas from existing bookmark.arrangement or apartment.floor_plan json
    const renderedCanvas = this.loadCanvas(this.canvas, this.jsonValue)

    // get ahold of all items to detect collisions
    const onChange=(options) => {
      options.target.setCoords();
      this.canvas.forEachObject(function(obj) {
        let ogFill = obj.fill
        if (obj === options.target) return;
        // if (options.target.intersectsWithObject(obj)){
        //   obj.set('fill', "#f55")
        // }
        obj.set('fill' ,options.target.intersectsWithObject(obj) ? "#f55" : ogFill);
        // if (options.target.intersectsWithObject(obj)){
        //   obj.set('opacity', 0.5)
        // }
        obj.set('opacity' ,options.target.intersectsWithObject(obj) ? 0.5 : 0);
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
    // door = canvas.getActiveObject().get('door')
    // console.log(door)
    // // find on-canvas length of selected door, scale to size using standard 80 cm door
    // const ratio = door.length / 80
    // create instance of user item on canvas and scale with ratio
    // pass in data, note that length doesn't exist in fabric so it becomes height
      // height: this.dataTarget.length * ratio,
      // width: this.dataTarget.width * ratio,
    const rect = new fabric.Rect({
        height: parseInt(event.currentTarget.dataset.length),
        width: parseInt(event.currentTarget.dataset.width),
        fill: '#aac',
        originX: 'left',
        originY: 'top',
        hasBorders: false,
        lockScalingX: true,
        lockScalingY: true,
        transparentCorners: false,
        cornerSize: 9,
        snapAngle: 45,
      })
      this.canvas.add(rect)
  }

  // method to clear the canvas
  clear(event) {
    // TODO: need to make sure it doesn't erase floor plan
    // this.canvas.clear()

    this.canvas.getObjects().forEach((obj)=>{
      if(obj !== this.canvas.backgroundImage && obj.id !== "rect" && obj.id !== "door"){
        this.canvas.remove(obj)
      }
    })
  }

  // method to save arrangement
  save(event) {
    fetch(`/bookmarks/${event.currentTarget.dataset.bookmark}`, {
      method: "PATCH",
      body: JSON.stringify(this.canvas),
      headers: {
        "X-CSRF-Token": this.getMetaValue("csrf-token")
      }
    }).then(console.log("Success"))
  }

  // function to deserialize json and render apartment.floor_plan or bookmark.arrangement
  loadCanvas(canvas, json) {
    return canvas.loadFromJSON(json, canvas.renderAll.bind(canvas));
  }

  // method to be used in save function
  getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}

    // canvas.renderAll();
