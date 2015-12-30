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

  public static function getBoundingRectangle(object:DisplayObject):Rectangle {
    var rotation = object.rotation;
    if (rotation < 0) {
      rotation = 360 + rotation;
    }

    var position = new Point(object.x, object.y);

    var className = getWellKnownTypeName(object);
    trace("this is....:"+className);
    if (className == "TextField") {
      var txt:TextField = cast (object, TextField);
      object.width  = txt.textWidth;
      object.height = txt.textHeight;
    }

    if ((rotation > 0) && (rotation < 360)) {
      if (rotation < 90) {
        position.x -= object.height * Math.sin(rotation);
      }
      else if (rotation == 90) {
        position.x -= object.width;
      }
      else if (rotation < 180) {
        position.x -= object.width;
        position.y -= object.width * Math.sin(rotation);
      }
      else if (rotation == 180) {
        position.x -= object.width;
        position.y -= object.height;
      }
      else if (rotation < 270) {
        position.x -= object.height * Math.sin(rotation);
        position.y -= object.height;
      }
      else if (rotation == 270) {
        position.y -= object.height;
      }
      else {
        position.y -= object.width * Math.sin(rotation);
      }
    }

    return (new Rectangle(position.x, position.y, object.width, object.height));
  }

  public static function getRelBoundingBox(child:DisplayObject):Rectangle{
    var className = getWellKnownTypeName(child);

    var childBB:Rectangle = new Rectangle();
    switch (className){

      case "TextField":
        var txt:TextField = cast (child, TextField);
        var p:Point = child.localToGlobal(new Point());
        trace("\n\n*****\n\n",txt.width, txt.textWidth);
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
  public static function getBoundingBox(displayObject:DisplayObject):Rectangle {
    var bounds:Rectangle = new Rectangle();
    var children = getChildren(displayObject);
    if (children.length == 0)
      bounds = getBoundingRectangle(displayObject);
    else
      for (child in children) {
        var childBB = getBoundingRectangle(child);
        bounds.x = Math.min(childBB.x,bounds.x);
        bounds.y = Math.min(childBB.y,bounds.y);
        bounds.width  = Math.max(childBB.width  + childBB.x, bounds.width);
        bounds.height = Math.max(childBB.height + childBB.y, bounds.height);
      }
    return bounds;
  }
}
