_ = require 'underscore'
module.exports = class VPlot extends require './Plot'

  constructor : (@yScale)->
    console.log 'VPlot'
    super(undefined, @yScale)






