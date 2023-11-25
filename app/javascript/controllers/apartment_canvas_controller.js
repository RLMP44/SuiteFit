import { Controller } from "@hotwired/stimulus"
import { fabric } from 'fabric'

// Connects to data-controller="apartment-canvas"
export default class extends Controller {
  static targets = ["canvas", "drawButton", 'saveButton', 'saveFloorplan', 'input']
  static values = {'floorplanUrl': String, 'id': Number}



  connect() {

    // canvas should scale to the picture size?
    this.canvas = new fabric.Canvas('new-canvas', {
      width: 800,
      height: 800
    })


    // set a floorplan on the canvas
    fabric.Image.fromURL(this.floorplanUrlValue, (img) => {
      img.scaleToWidth(this.canvas.getWidth());
      this.canvas.setBackgroundImage(img, this.canvas.renderAll.bind(this.canvas))
    })

  }

  startDrawing(event) {
    event.currentTarget.classList.add('d-none')
    this.saveButtonTarget.classList.remove('d-none')
    this.drawFloorplan()
  }

  // trace a floorplan on the canvas
  drawFloorplan() {
    this.canvas.on('mouse:down', (o) => {
      let pointer = this.canvas.getPointer(o.e);

      this.isDown = true;
      this.origX = pointer.x;
      this.origY = pointer.y;

      this.rectangle = new fabric.Rect({
          left: this.origX,
          top: this.origY,
          fill: '#5f5',
          strokeWidth: 0,
          hasRotatingPoint: false,
          hasBorders: false,
          id: this.#generateId('rect')
      })
      this.canvas.add(this.rectangle);
    })

    this.canvas.on('mouse:move', (o) => {
      // if selecting an object, don't draw a new object
      if (this.canvas.getActiveObject()){

      } else {
        if (!this.isDown) return;
        let pointer = this.canvas.getPointer(o.e);
        if(this.origX>pointer.x){
            this.rectangle.set({ left: Math.abs(pointer.x) });
        }
        if(this.origY>pointer.y){
            this.rectangle.set({ top: Math.abs(pointer.y) });
        }

        this.rectangle.set({ width: Math.abs(this.origX - pointer.x) });
        this.rectangle.set({ height: Math.abs(this.origY - pointer.y) });
        this.canvas.renderAll();
      }
    })

    this.canvas.on('mouse:up', (o) => {
      this.isDown = false;
    })
  }

  // set the main door (for scaling when loading canvas later)
  setDoor() {
    this.canvas.on('mouse:down', (o) => {
      let pointer = this.canvas.getPointer(o.e);

      this.isDown = true;
      this.origX = pointer.x;
      this.origY = pointer.y;

      this.rectangle = new fabric.Rect({
          left: this.origX,
          top: this.origY,
          fill: '#f55',
          strokeWidth: 0,
          hasRotatingPoint: false,
          hasBorders: false,
          id: 'door'
      })
      this.canvas.add(this.rectangle);
    })

    this.canvas.on('mouse:move', (o) => {
      if (this.canvas.getActiveObject()){

      } else {
        if (!this.isDown) return;
        let pointer = this.canvas.getPointer(o.e);
        if(this.origX>pointer.x){
            this.rectangle.set({ left: Math.abs(pointer.x) });
        }
        if(this.origY>pointer.y){
            this.rectangle.set({ top: Math.abs(pointer.y) });
        }

        this.rectangle.set({ width: Math.abs(this.origX - pointer.x) });
        this.rectangle.set({ height: Math.abs(this.origY - pointer.y) });
        this.canvas.renderAll();
      }
    })

    this.canvas.on('mouse:up', (o) => {
      this.isDown = false;
      this.canvas.off('mouse:down')
      this.drawFloorplan()
    })
  }

  // save the canvas to JSON/serialize
  saveFloorplan(event) {
    event.preventDefault()
    console.log('submitted')
    // set all objects as transparent and unselectable
    this.canvas.forEachObject( o => {
      o.set({
        selectable: false,
        opacity: 0,
      })
    })

    const floorplan = JSON.stringify(this.canvas)
    this.#insertFloorplan(floorplan)
  }

  #insertFloorplan(floorplan) {
    const url = this.saveFloorplanTarget.action
    this.inputTarget.value = floorplan
    const formData = new FormData(this.saveFloorplanTarget)

    console.log(formData)
    fetch(url, {
        method: 'PATCH',
        body: formData
      }
    ).then(response => response.json)
    .then(window.location.href=`/agency/apartments/${this.idValue}`
    )
  }

  #generateId(type) {
    return `${type}-${Math.random().toString(36).substring(2, 9)}`;
  }
}
