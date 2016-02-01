
module.exports = class Line extends require './Shapes'
  constructor : (@w,@h,style)->
    super style
    @graphics.moveTo 0, 0
    .lineTo @w,@h