import { Controller } from "@hotwired/stimulus"
import { fabric } from 'fabric'
import jquery from "jquery"
window.$ = jquery
window.jQuery = jquery

// Connects to data-controller="apartment-canvas"
export default class extends Controller {
  static targets = ["canvas", "drawButton", 'saveButton']
  static values = {'floorplanUrl': String}
  connect() {
    // create new canvas
      // drawing a polygon by click
    var min = 99;
    var max = 999999;
    var polygonMode = true;
    var pointArray = new Array();
    var lineArray = new Array();
    var activeLine;
    var activeShape = false;
    var canvas
    // create a canvas with #prototypefabric when the window loads
    $(window).load(function(){
        prototypefabric.initCanvas();
        // create a polygon when #create-polygon is clicked
        $('#create-polygon').click(function() {
            prototypefabric.polygon.drawPolygon();
        });
    });
    var prototypefabric = new function () {
        this.initCanvas = function () {
            canvas = window._canvas = new fabric.Canvas('new-canvas');
            canvas.setWidth($(window).width());
            canvas.setHeight($(window).height()-$('.navbar').height());
            //canvas.selection = false;
            fabric.Image.fromURL(this.floorplanUrlValue, function(img) {
              canvas.setBackgroundImage(img, canvas.renderAll.bind(canvas))
            })

            canvas.on('mouse:down', function (options) {
                if(options.target && options.target.id == pointArray[0].id){
                    prototypefabric.polygon.generatePolygon(pointArray);
                }
                if(polygonMode){
                    prototypefabric.polygon.addPoint(options);
                }
            });
            canvas.on('mouse:up', function (options) {

            });
            canvas.on('mouse:move', function (options) {
                if(activeLine && activeLine.class == "line"){
                    var pointer = canvas.getPointer(options.e);
                    activeLine.set({ x2: pointer.x, y2: pointer.y });

                    var points = activeShape.get("points");
                    points[pointArray.length] = {
                        x:pointer.x,
                        y:pointer.y
                    }
                    activeShape.set({
                        points: points
                    });
                    canvas.renderAll();
                }
                canvas.renderAll();
            });
        };
    };



    prototypefabric.polygon = {
        drawPolygon : function() {
            polygonMode = true;
            pointArray = new Array();
            lineArray = new Array();
            activeLine;
        },
        addPoint : function(options) {
            var random = Math.floor(Math.random() * (max - min + 1)) + min;
            var id = new Date().getTime() + random;
            var circle = new fabric.Circle({
                radius: 5,
                fill: '#ffffff',
                stroke: '#333333',
                strokeWidth: 0.5,
                left: (options.e.layerX/canvas.getZoom()),
                top: (options.e.layerY/canvas.getZoom()),
                selectable: false,
                hasBorders: false,
                hasControls: false,
                originX:'center',
                originY:'center',
                id:id,
                    objectCaching:false
            });
            if(pointArray.length == 0){
                circle.set({
                    fill:'red'
                })
            }
            var points = [(options.e.layerX/canvas.getZoom()),(options.e.layerY/canvas.getZoom()),(options.e.layerX/canvas.getZoom()),(options.e.layerY/canvas.getZoom())];
            line = new fabric.Line(points, {
                strokeWidth: 2,
                fill: '#999999',
                stroke: '#999999',
                class:'line',
                originX:'center',
                originY:'center',
                selectable: false,
                hasBorders: false,
                hasControls: false,
                evented: false,
                    objectCaching:false
            });
            if(activeShape){
                var pos = canvas.getPointer(options.e);
                var points = activeShape.get("points");
                points.push({
                    x: pos.x,
                    y: pos.y
                });
                var polygon = new fabric.Polygon(points,{
                    stroke:'#333333',
                    strokeWidth:1,
                    fill: '#cccccc',
                    opacity: 0.3,
                    selectable: false,
                    hasBorders: false,
                    hasControls: false,
                    evented: false,
                    objectCaching:false
                });
                canvas.remove(activeShape);
                canvas.add(polygon);
                activeShape = polygon;
                canvas.renderAll();
            }
            else{
                var polyPoint = [{x:(options.e.layerX/canvas.getZoom()),y:(options.e.layerY/canvas.getZoom())}];
                var polygon = new fabric.Polygon(polyPoint,{
                    stroke:'#333333',
                    strokeWidth:1,
                    fill: '#cccccc',
                    opacity: 0.3,
                    selectable: false,
                    hasBorders: false,
                    hasControls: false,
                    evented: false,
                    objectCaching:false
                });
                activeShape = polygon;
                canvas.add(polygon);
            }
            activeLine = line;

            pointArray.push(circle);
            lineArray.push(line);

            canvas.add(line);
            canvas.add(circle);
            canvas.selection = false;
        },
        generatePolygon : function(pointArray){
            var points = new Array();
            $.each(pointArray,function(index,point){
                points.push({
                    x:point.left,
                    y:point.top
                });
                canvas.remove(point);
            });
            $.each(lineArray,function(index,line){
                canvas.remove(line);
            });
            canvas.remove(activeShape).remove(activeLine);
            var polygon = new fabric.Polygon(points,{
                stroke:'#333333',
                strokeWidth:0.5,
                fill: 'red',
                opacity: 1,
                hasBorders: false,
                hasControls: false
            });
            canvas.add(polygon);

            activeLine = null;
            activeShape = null;
            polygonMode = false;
            canvas.selection = true;
        }
    };
    // end
    // canvas should scale to the picture size?
    // const canvas = this.canvas = new fabric.Canvas('new-canvas', {
    //   width: 800,
    //   height: 1000
    // })

    // set a floorplan on the canvas
    // fabric.Image.fromURL(this.floorplanUrlValue, function(img) {
    //   img.scaleToWidth(canvas.getWidth());
    //   // canvas.add(img);
    //   canvas.setBackgroundImage(img, canvas.renderAll.bind(canvas))
    // })
  }

  // trace a floorplan on the canvas
  drawFloorplan(event) {
    // this.canvas.isDrawingMode = true
    event.currentTarget.classList.add('d-none')
    this.saveButtonTarget.classList.remove('d-none')

  }

  // save the canvas to JSON/serialize
  saveFloorplan(event) {
    // this.canvas.isDrawingMode = false
    event.currentTarget.classList.add('d-none')
    this.drawButtonTarget.classList.remove('d-none')
    // JSON.stringify(canvas)
  }
}
