package utility;
import flash.display.Sprite;
import openfl.display.DisplayObject;
import openfl.display.Graphics;
class Style {
  public static function style(d:DisplayObject,color:Int,alpha:Float = 1){

    cast(d,Sprite).graphics.beginFill(color,alpha);
    return d;
  }

}
