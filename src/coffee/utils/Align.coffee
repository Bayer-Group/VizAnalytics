_ = require 'underscore'


module.exports = Align =

  getMaxBounds : (children)->

    _.reduce children, (m,d)->
      m.x = if d.x > m.x then d.x else m.x
      m.y = if d.y > m.y then d.y else m.y
      m.width = if d.w > m.width then d.w else m.width
      m.height = if d.h > m.height then d.h else m.height
      m
    , new createjs.Rectangle 0, 0, 0, 0

  left : (children)->
    _.map children, (d)->
      d.x = 0
      d

  center : (children)->
    max = Align.getMaxBounds children
    _.map children, (d)->
      d.x = (max.width - d.w)/2
      d

  right : (children)->
    max = Align.getMaxBounds children
    _.map children, (d)->
      d.x = max.width - d.w
      d

  top : (children)->
    _.map children, (d)->
      d.y = 0
      d

  middle : (children)->
    max = Align.getMaxBounds children
    _.map children, (d)->
      d.y = (max.height - d.h)/2
      d

  bottom : (children)->
    max = Align.getMaxBounds children
    _.map children, (d)->
      d.y = max.height - d.h
      d