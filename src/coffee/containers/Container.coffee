_ = require 'underscore'
module.exports = class Container extends createjs.Container

  constructor:()->
    super()
    @that = this
    @x = @y = @w = @h = 0
    console.log 'container'

  getBounds : ()->
    _.each @children, (d)=>
      @x = Math.min @x, d.x
      @y = Math.min @y, d.y
      @w = Math.max @w, d.x + d.w
      @h = Math.max @h, d.y + d.h
    new createjs.Rectangle @x,@w,@w,@h



  addChildren :(children)->
    _.each children, (d)=>
      @.addChild d





