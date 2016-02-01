_ = require 'underscore'
module.exports = class VBox extends require './Container'
  @_spacing = 10

  constructor : ()->
    console.log 'VBox'
    super()



  update = (that)->
    shift = (m,d)=>
      d.y = if m is 0 then 0 else m
      m += d.h + that._spacing
      m
    _.reduce that.children, shift,0
    that.getBounds()

  spacing : (x)->
    @_spacing = x
    update(@)
    @

  addChildren : (children)->
    super children
    update @

