
d3Scale        = require 'd3-scale'
_              = require 'underscore'
exports.HBox   = require './containers/HBox'
exports.VBox   = require './containers/VBox'
exports.Plot   = require './containers/Plot'
exports.VPlot  = require './containers/VPlot'
exports.HPlot  = require './containers/HPlot'
exports.Rect   = require './shapes/Rect'
exports.Text   = require './shapes/Text'
exports.Line   = require './shapes/Line'
exports.Axis   = require './axis/Axis'
exports.Align  = require './utils/Align'

{HBox, VBox , Plot, VPlot, HPlot, Container,Rect, Text, Line, Axis, Align} = exports

class Main
  createPlotDate = ()->
    _.map [0..9],(d)->
      shape = new Rect 2,2, {beginFill: 'orangered'}
      shape.value = d
      shape

  constructor:(canvasName)->
    canvas = document.getElementById canvasName
    stage = new createjs.Stage canvas

    vplot = new Plot createPlotDate(),  d3Scale.scaleLinear().domain([0,10]).range([1,200]), d3Scale.scaleLinear().domain([0,10]).range([1,200])

    console.log vplot.getBounds()
    stage.addChild vplot
    rect1 = new Rect 100,10, {beginFill:'lightblue'}
    rect2 = new Rect 200, 30, {beginFill:'red'}
#    line1 = new Line 20,20, {beginStroke: 'lime', setStrokeStyle: 2}
#    text = new Text()
#    text.text = 'sucka!!!!'
#    xAxis = new Axis()
#    console.log xAxis.getBounds()
#
    hbox  = new HBox [rect1,rect2], 15
#    vbox  = new VBox()
#    hbox.spacing(1).addChildren Align.middle [text, rect2, line1, rect1]
#    vbox.addChildren [hbox,xAxis]




    stage.addChild hbox



#    stage.addChild xAxis


    stage.update()

new Main 'canvas'



