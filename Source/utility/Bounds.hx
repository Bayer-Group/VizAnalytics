package utility;

import container.Container;
import openfl.display.DisplayObjectContainer;
import openfl.geom.Point;
import openfl.text.TextField;
import axis.Axis;
import openfl.geom.Rectangle;
import openfl.display.Sprite;
import openfl.display.DisplayObject;

class Bounds {

  private static function getWellKnownTypeName(obj:Dynamic):String {
    if(Std.is(obj, Container)) return "Container";
    if(Std.is(obj, Axis))      return "Axis";
    if(Std.is(obj, TextField)) return "TextField";
    if(Std.is(obj, Sprite))    return "Sprite";
    else return "UNKNOWN";
  }

  public static function getChildren(displayObject:DisplayObject):Array<DisplayObject> {
    var children = [];
    if(Std.is(displayObject,DisplayObjectContainer )){
      var container = cast (displayObject,DisplayObjectContainer);
      for(index in 0...container.numChildren){
        children.push(container.getChildAt(index));
      }
    }

    return children;

  }
  public static function getRelBoundingBox(child:DisplayObject):Rectangle{
    var className = getWellKnownTypeName(child);

    var childBB:Rectangle = new Rectangle();
    switch (className){

      case "TextField":
        var txt:TextField = cast (child, TextField);
        var p:Point = child.localToGlobal(new Point());
        childBB.setTo(p.x, p.y,txt.textWidth, txt.textHeight);
      case "Sprite"   :
        var p:Point = child.localToGlobal(new Point());
//          trace("Sprite ",child.getBounds(child), p);
        childBB.setTo(p.x, p.y, child.width, child.height);
      case "Axis"     :
        trace("\n\n\nAXIS!!!!");
        childBB = cast (child, Axis).getBoundingBox();
      case "Container":
        childBB = cast (child, Container).getBoundingBox();
      case _ :
        childBB.setTo(child.x, child.y, child.width, child.height);
    }
    return childBB;
//      trace("updated BB :"+bounds);

  }

  public static function getAbsBoundingBox(displayObject:DisplayObject):Rectangle {
    var bounds:Rectangle = new Rectangle();
//    trace("child count :"+numChildren);
    for (child in getChildren(displayObject)) {
      var childBB = getRelBoundingBox(child);
      bounds.x = Math.min(childBB.x,bounds.x);
      bounds.y = Math.min(childBB.y,bounds.y);
      bounds.width  = Math.max(childBB.width  + childBB.x, bounds.width);
      bounds.height = Math.max(childBB.height + childBB.y, bounds.height);
    }
    return bounds;
  }
}
