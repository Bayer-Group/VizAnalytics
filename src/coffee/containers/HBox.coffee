_ = require 'underscore'
module.exports = class HBox extends require './Container'


  constructor : (children, @spacing = 10)->
    console.log 'HBox'
    @name = 'HBox'
    super children
    update @children, @spacing
    bounds = @getBounds()
    @w = bounds.width
    @h = bounds.height




  update = (children, spacing)->
    shift = (m,d)=>
      d.x = if m is 0 then 0 else m
      m += d.w + spacing
      m
    _.reduce children, shift,0



