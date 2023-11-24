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

  // method to clear the canvas
  clear(event) {
    // TODO: need to make sure it doesn't erase floor plan
    this.canvas.clear()
  }

  save(event) {
    console.log(event.currentTarget.dataset.bookmark)
    console.log(event.currentTarget.dataset.arrangement)
    fetch(`/bookmarks/${event.currentTarget.dataset.bookmark}`, {
      method: "PATCH",
      body: JSON.stringify(this.canvas),
      headers: {
        "X-CSRF-Token": this.getMetaValue("csrf-token")
      }
    }).then(console.log("Success"))
    // console.log(event.currentTarget.dataset.arrangement)
    // stringified_file = JSON.stringify(this.canvas)
    // console.log("stringified_file below")
    // console.log(stringified_file)
    // console.log("dataset below")
    // console.log(event.currentTarget.dataset.arrangement)
    // console.log("current canvas below")
    // console.log(JSON.stringify(this.canvas))
    // event.currentTarget.dataset.arrangement = JSON.stringify(this.canvas)
    // console.log("saved?? dataset below")
    // console.log(event.currentTarget.dataset.arrangement)
  }

  // function to deserialize json and render apartment floor plan or bookmark arrangement
  loadCanvas(canvas, json) {
    return canvas.loadFromJSON(json, canvas.renderAll.bind(canvas));
  }

  getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}
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


      // save the canvas to JSON/serialize
  // saveFloorplan(event) {
  //   event.preventDefault()
  //   console.log('submitted')
  //   // set all objects as transparent and unselectable
  //   this.canvas.forEachObject( o => {
  //     o.set({
  //       selectable: false,
  //       opacity: 0
  //     })
  //   })

  //   const floorplan = JSON.stringify(this.canvas)
  //   this.#insertFloorplan(floorplan)
  // }

  // #insertFloorplan(floorplan) {
  //   const url = this.saveFloorplanTarget.action
  //   this.inputTarget.value = floorplan
  //   const formData = new FormData(this.saveFloorplanTarget)

  //   console.log(formData)
  //   fetch(url, {
  //       method: 'PATCH',
  //       body: formData
  //     }
  //   ).then(response => response.json)
  //   .then(window.location.href=`/agency/apartments/${this.idValue}`
  //   )
  // }
