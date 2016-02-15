_ = require 'underscore'
module.exports = class VPlot extends require './Plot'

  constructor : (@children, @yScale)->
    console.log 'VPlot'
    super(@children, undefined, @yScale)
    update()
    bounds = @getBounds()
    @w = bounds.width
    @h = bounds.height






