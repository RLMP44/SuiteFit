import { Controller } from "@hotwired/stimulus"
import { fabric } from "fabric"

// Connects to data-controller="load-canvas"
export default class extends Controller {
  static targets = ["canvas", "result", "my-"]
  static values = {
    json: Object,
    image: String,
  }

  connect() {
    console.log("hi")
    // create empty canvas
    this.canvas = new fabric.Canvas("new-canvas", {
      height: 900,
      width: 800,
    })
    // call function to load canvas from existing bookmark.arrangement or apartment.floor_plan json
    this.loadedCanvas = this.loadCanvas(this.canvas, this.jsonValue)

    // get ahold of all items to detect collisions
    const onChange=(options) => {
      options.target.setCoords();
      this.loadedCanvas.forEachObject(function(obj) {
        if (obj === options.target) return;
        // change user items' color/opacity
        if (obj.fill === "#f00") {
          console.log("Door found!")
        }
        else if (obj.type !== "rect") {
          obj.set('fill' ,options.target.intersectsWithObject(obj) ? "#f54" : '#aac');
          obj.set('opacity' ,options.target.intersectsWithObject(obj) ? 0.5 : 1)
        }
        // change floor plan borders' color/opacity (all are rectangles)
        else {
          obj.set('fill' ,options.target.intersectsWithObject(obj) ? "#f55" : '#5f5');
          obj.set('opacity' ,options.target.intersectsWithObject(obj) ? 0.5 : 0);
        }
      });
    }
    // trigger onChange method in the following situations
    this.loadedCanvas.on({
      'object:moving': onChange,
      'object:scaling': onChange,
      'object:rotating': onChange,
    });
  }

  // method to add clicked item to canvas
  add(event) {
    console.log("console logging ratio...")
    console.log(this.ratio)
    // create instance of user item on canvas and scale using ratio
    // pass in data, note that length doesn't exist in fabric so it becomes height
    var imgElement = document.getElementById(event.currentTarget.dataset.name)

    const image = new fabric.Image(imgElement, {
        originX: 'left',
        originY: 'top',
        hasBorders: false,
        lockScalingX: true,
        lockScalingY: true,
        transparentCorners: false,
        cornerSize: 10,
        cornerStrokeColor: "black",
        cornerColor: "blue",
        cornerStyle: "circle",
        snapAngle: 45,
        hasRotatingPoint: true,
        rotatingPointOffset: 20
      })

      image.setControlsVisibility({
        tl:false,
        mt:false,
        tr:false,
        ml:false,
        mr:false,
        bl:false,
        mb:false,
        br:false
      })

    // scale image to proper height and width
    console.log("Console logging imgElement")
    console.log(imgElement.id)
    if (imgElement.id === "image-Sofa" || imgElement.id === "image-Couch") {
      image.scaleToHeight(parseInt(event.currentTarget.dataset.width) * this.ratio)
      image.scaleToWidth(parseInt(event.currentTarget.dataset.length) * this.ratio)
    } else {
      image.scaleToHeight(parseInt(event.currentTarget.dataset.length) * this.ratio)
      image.scaleToWidth(parseInt(event.currentTarget.dataset.width) * this.ratio)
    }
    this.canvas.add(image)
  }

  // method to clear the canvas
  clear(event) {
    this.loadedCanvas.getObjects().forEach((obj) => {
      if(obj !== this.loadedCanvas.backgroundImage && obj.type !== "rect"){
        this.loadedCanvas.remove(obj)
      }
    })
  }

  // TODO: get functional
  // method to delete one item
  // delete(event) {
  //   console.log("hi")
  //   this.loadedCanvas.on('selection:created', function(options) {
  //     console.log(options)
  //       objToDelete = object.target.setCoords();
  //       this.loadedCanvas.remove(objToDelete)
  //     })
  //   }

  // method to save arrangement
  save(event) {
    fetch(`/bookmarks/${event.currentTarget.dataset.bookmark}?`, {
      method: "PATCH",
      body: JSON.stringify(this.loadedCanvas),
      headers: {
        "X-CSRF-Token": this.getMetaValue("csrf-token")
      }
    }).then(
      window.location.href = `${location.origin}/bookmarks`
      )
  }

  // method to calculate the ratio for item scaling
  calculateRatio(object) {
    //  find on-canvas length of main door, scale to size using standard 80 cm door
    const doorWidth = object.width > object.height ? object.width : object.height
    const ratio = doorWidth / 80.0
    this.ratio = ratio
  }

  // function to deserialize json and render apartment.floor_plan or bookmark.arrangement
  loadCanvas(canvas, json) {
    const newCanvas = canvas.loadFromJSON(json, canvas.renderAll.bind(canvas), (o, object) => {
      // use callback to isolate door and calculate ratio only once canvas is loaded
      if (object.fill === "#f00" && object.width > 0) {
        console.log("made it!")
        this.calculateRatio(object)
      }
      // make all boundaries unselectable
      if (object.fill === "#5f5" || object.fill === "#f00" || object.fill === "#f55") {
        object.set('selectable', false)
      }
    })
    return newCanvas
  }

  // method to be used in save function
  getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}
