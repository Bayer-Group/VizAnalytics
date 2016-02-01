
module.exports = class Rect extends require './Shapes'
  constructor : (@w,@h,style)->
    super style
    @graphics.drawRect 0, 0, @w, @h