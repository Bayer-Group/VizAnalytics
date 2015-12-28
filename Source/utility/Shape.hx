package utility;

import openfl.display.DisplayObject;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.display.Graphics;
import openfl.display.Sprite;
using utility.Style;


class Shape {
  static private function RECT_STYLE():Style{
    var s = new Style();
    return s.beginFill(0x550033);
  }
  static private function CIR_STYLE():Style{
    var s = new Style();
    return s.beginFill(0x22ff33);
  }
  static private function LINE_STYLE():Style {
    var s = new Style();
    return s.lineStyle(1,0x000000);
  }


  static private function addStyle(g:Graphics,s:Style):Void {
    s = (s == null)? RECT_STYLE() : s;
    var keys = s.keys();
    for( key in s.keys()){
      Reflect.callMethod(g, Reflect.field(g, key), s.get(key));
    }
  }


  static public function circle(r1:Float = 10.0,?s:Style):Sprite {
    var c:Sprite = new Sprite();

    c.graphics.beginFill(0x666666);
    c.graphics.drawCircle(r1, r1, r1);

    return c;
  }
  static public function bounds(width:Float,height:Float):Sprite{
    var s = new Style();
    return rect(width,height,s.lineStyle(1,0xff0000));

  }

  static public function rect(width:Float,height:Float,?s:Style):Sprite{
    var r:Sprite = new Sprite();
    addStyle(r.graphics,s);
    r.graphics.drawRect(0,0,width,height);

    return r;
  }

  static public function line(x:Float,y:Float,?s:Style):Sprite{
    var l:Sprite = new Sprite();
    s = (s == null)? LINE_STYLE():s;
    addStyle(l.graphics,s);
    l.graphics.moveTo(0,0);
    l.graphics.lineTo(x,y);
    l.x = 0;
    l.y = 0;

    return l;
  }

  static public function text(value:String = "none given",?style:TextFormat):DisplayObject{
    var text = new TextField();

//    format.align = TextFormatAlign;
    var style = (style == null)? new TextFormat("Verdana",14, 0x445500): style;
//    text.defaultTextFormat = style;
    text.text = value;
    return text;
  }



}
