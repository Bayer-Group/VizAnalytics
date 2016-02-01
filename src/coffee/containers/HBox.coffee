_ = require 'underscore'
module.exports = class HBox extends require './Container'
  @_spacing = 10

  constructor : ()->
    console.log 'HBox'
    super()



  update = (that)->
    shift = (m,d)=>
      d.x = if m is 0 then 0 else m
      m += d.w + that._spacing
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

