_ = require 'underscore'
module.exports = class Container extends createjs.Container

  constructor:(children)->
    super()
    @x = @y = @w = @h = 0
    @that = this
    @addChild children...
    console.log 'container'

  getBounds : ()->
    _.each @children, (d)=>
      @x = Math.min @x, d.x
      @y = Math.min @y, d.y
      @w = Math.max @w, d.x + d.w
      @h = Math.max @h, d.y + d.h
      console.log @w,@h,@y,@x
    new createjs.Rectangle @x,@w,@w,@h






