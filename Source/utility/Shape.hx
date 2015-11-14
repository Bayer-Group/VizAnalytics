package utility;
import flash.text.TextField;
import flash.display.Sprite;
import flash.display.DisplayObject;
import container.*;


class Shape {

  static public function circle(r1:Float = 10.0):Sprite {
    var c:Sprite = new Sprite();
    c.graphics.beginFill(0x666666);
    c.graphics.drawCircle(r1, r1, r1);
//    c.graphics.endFill();
    return c;
  }
  static public function rect(width:Float,height:Float):Sprite{
    var r:Sprite = new Sprite();
    r.graphics.lineStyle(1,0x000000);
    r.graphics.drawRect(0,0,width,height);
//    r.graphics.endFill();
    return r;
  }

  static public function line(x:Float,y:Float):Sprite{
    var l:Sprite = new Sprite();
    l.graphics.lineStyle(1,0x000000);
    l.graphics.moveTo(0,0);
    l.graphics.lineTo(x,y);
    l.x = 0;
    l.y = 0;

    return l;
  }



}
