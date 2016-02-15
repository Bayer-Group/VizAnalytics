_ = require 'underscore'
module.exports = class VBox extends require './Container'


  constructor : (children, @spacing = 10)->
    console.log 'VBox'
    @name = 'VBox'
    super children
    update @children, @spacing
    bounds = @getBounds()
    @w = bounds.width
    @h = bounds.height



  update = (children, spacing)->
    shift = (m,d)=>
      d.y = if m is 0 then 0 else m
      m += d.h + spacing
      m
    _.reduce children, shift,0



