_ = require 'underscore'
module.exports = class Shapes extends createjs.Shape
  constructor: (style)->
    console.log 'shape'
    super()
    _.each style, (d,f)=>
      @graphics[f](d)





