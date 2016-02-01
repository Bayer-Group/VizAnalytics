_       = require 'underscore'
d3Scale = require 'd3-scale'
Line    = require '../shapes/Line'
Text    = require '../shapes/Text'
VBox    = require '../containers/VBox'

module.exports = class Axis extends require '../containers/Container'
  that  = this
  constructor:()->
    super()
    that = this
    @scale = d3Scale.scaleLinear().range([0,200]).domain([0,10])
    update()

  removeAllChildren = ()->
    _.each [0..that.numChildren-1],(d)=>
      that.removeChild d

  getTickPositions : (tickCount = 10)-> @scale.ticks tickCount

  generateTicks = (positions, tickLength = 5, style = {beginStroke: 'black', setStrokeStyle: 0.5})->
    _.map positions, (d)=>
      l = new Line 0, tickLength, style
      l.x = that.scale d
      l
  generateTickLabels = (positions, style = {})->
    _.map positions, (d)->
      t = new Text()
      t.text = d
      t.x = that.scale d
      t

  update = ()->
    removeAllChildren()
    [a,b] = that.scale.range()
    length = b - a

    mainLine = new Line length,0, {beginStroke: 'black', setStrokeStyle: 1}

    ticks      = generateTicks that.getTickPositions()
    tickLabels = generateTickLabels that.getTickPositions()
    labelsContainer = new createjs.Container()
    labelsContainer.addChild tickLabels...
    tickContainer = new createjs.Container()
    tickContainer.addChild ticks...
    lineContainer = new VBox()
    lineContainer.spacing 0
    lineContainer.addChildren [mainLine,tickContainer]
    console.log 'line container :'+ lineContainer.getBounds()
    withText = new VBox()
    withText.spacing 5
    withText.addChildren [lineContainer, labelsContainer]
    console.log 'with text :'+ withText.getBounds()

    that.addChild withText
    console.log that.getBounds()






  scale : (@scale)->
    @






