
_ = require 'underscore'
module.exports = class Text extends createjs.Text
  constructor : (style = {font:'12pt Arial',color:'black'})->
    super()
    console.log 'text'
    _.each style, (d,f)->
      @[f] = d
    @w = @getMeasuredWidth()
    @h = @getMeasuredHeight()
