_ = require 'underscore'
module.exports = class HPlot extends require './Plot'

  constructor : (@xScale)->
    console.log 'HPlot'
    super(@children, @xScale, undefined )
    update()
    bounds = @getBounds()
    @w = bounds.width
    @h = bounds.height






