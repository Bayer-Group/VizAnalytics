package container;
import flash.geom.Point;
import flash.text.TextField;
import axis.Axis;
import flash.geom.Rectangle;
import flash.display.Sprite;
import flash.display.DisplayObject;
import utility.Shape;

class Container extends flash.display.Sprite {
  private var debug:Sprite;

  public function new() {
    super();
  }

  private function getWellKnownTypeName(obj:Dynamic):String {
    if(Std.is(obj, Container)) return "Container";
    if(Std.is(obj, Axis))      return "Axis";
    if(Std.is(obj, TextField)) return "TextField";
    if(Std.is(obj, Sprite))    return "Sprite";
    else return "UNKNOWN";
  }

  public function getChildren():Array<DisplayObject> {
    var children = [];
    for(index in 0...numChildren){
      children.push(this.getChildAt(index));
    }
    trace("child COUNT "+children.length);
    return children;

  }

  public function getBoundingBox():Rectangle {
    var bounds:Rectangle = new Rectangle();
//    trace("child count :"+numChildren);
    for (child in getChildren()) {

//      trace("am i a container? :"+ Std.is(child, Container));
      var className = getWellKnownTypeName(child);
      trace(className);
      var childBB:Rectangle = new Rectangle();
      switch (className){

        case "TextField":
          var txt:TextField = cast (child, TextField);
          var p:Point = child.localToGlobal(new Point());
          childBB.setTo(p.x, p.y, p.x + txt.textWidth, p.y + txt.textHeight);
        case "Sprite"   :
          var p:Point = child.localToGlobal(new Point());
//          trace("Sprite ",child.getBounds(child), p);
          childBB.setTo(p.x, p.y, child.width + p.x, child.height + p.y);
        case "Axis"     :
          trace("\n\n\nAXIS!!!!");
          childBB = cast (child, Axis).getBoundingBox();
        case "Container":
          childBB = cast (child, Container).getBoundingBox();
        case _ :
          childBB.setTo(child.x, child.y, child.width + child.x, child.height + child.y);
      }
      bounds.x = Math.min(childBB.x,bounds.x);
      bounds.y = Math.min(childBB.y,bounds.y);
      bounds.width = Math.max(childBB.width,bounds.width);
      bounds.height = Math.max(childBB.height,bounds.height);
//      trace("updated BB :"+bounds);

    }
    return bounds;
  }

  private function updateDebug():Void {
    getBoundingBox();
    debug = Shape.rect(width, height);
    trace("debug bounding box : width:"+debug.width+" height:"+debug.height);
    addChild(debug);
  }

//  this should be private
  public override function addChild(obj:DisplayObject):DisplayObject {
    return super.addChild(obj);
  }

  public function addChildren(children:Array<DisplayObject>):Container{
    Lambda.iter(children, function(d:DisplayObject){
      addChild(d);
    });
    return this;
  }
}
