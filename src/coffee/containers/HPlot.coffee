_ = require 'underscore'
module.exports = class HPlot extends require './Plot'

  constructor : (@xScale)->
    console.log 'HPlot'
    super @xScale, undefined






