_ = require 'underscore'
module.exports = class Plot extends require './Container'
  that = this
  constructor : (@xScale,@yScale)->
    console.log 'Plot'
    super()
    that = this


  update = ()->
    if that.xScale
      console.log 'xScale!'
      _.each that.children, (d)=>
        value = if d.value.length? then _.first d.value else d.value
        d.x = that.xScale value

    if that.yScale
      console.log 'yScale!'
      _.each that.children, (d)=>
        value = if d.value.length? then _.last d.value else d.value
        d.y = that.yScale value
    that.getBounds()

  getBounds : ()->
    bounds = super()
    console.log bounds
    bounds.width  = if @xScale? then _.last @xScale.range() else bounds.width
    bounds.height = if @yScale? then _.last @yScale.range() else bounds.height
    bounds

  addChildrenWithValue : (children)->
    @addChildren children
    update()

