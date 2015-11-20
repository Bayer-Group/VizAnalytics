package layouts;
import openfl.geom.Rectangle;
import utility.Bounds;
import utility.Bounds;
import flash.display.DisplayObject;
enum VAlign {
  TOP;
  MIDDLE;
  BOTTOM;
  NONE;
}
enum HAlign {
  LEFT;
  CENTER;
  RIGHT;
  NONE;
}
class Align {
  private static function align(h:HAlign, v:VAlign, children:Array<DisplayObject>):Array<DisplayObject> {
    var maxBounds = Lambda.fold(children,function(d,mem){
      var cur = Bounds.getRelBoundingBox(d);
      mem.width  = Math.max(cur.width, mem.width);
      mem.height = Math.max(cur.height,mem.height);
      return mem;
    },new Rectangle());
    trace("max bounds for alignment :"+maxBounds);
    for (child in children){
      trace("pre :",Bounds.getRelBoundingBox(child));
      child.y = switch(v){
          case TOP: 0;
          case MIDDLE: maxBounds.height/2 - child.height/2;
          case BOTTOM: maxBounds.height - child.height;
          case NONE  : child.y;
        }
      child.x = switch(h){
        case LEFT  : 0;
        case CENTER: maxBounds.width/2 - child.width/2;
        case RIGHT : maxBounds.width - child.width;
        case NONE  : child.x;
      }
      trace("pos :",Bounds.getRelBoundingBox(child));
    }

    return children;
  }
  public static function top(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function middle(children:Array<DisplayObject>) { return align(HAlign.NONE,  VAlign.MIDDLE, children);}
  public static function bottom(children:Array<DisplayObject>) { return align(HAlign.NONE,  VAlign.BOTTOM, children);}
  public static function left(children:Array<DisplayObject>)   { return align(HAlign.LEFT,  VAlign.NONE, children);}
  public static function center(children:Array<DisplayObject>) { return align(HAlign.CENTER,VAlign.NONE, children);}
  public static function right(children:Array<DisplayObject>)  { return align(HAlign.RIGHT, VAlign.NONE, children);}
  public static function leftTop(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function leftMiddle(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function leftBottom(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function centerTop(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function centerMiddle(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function centerBottom(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function rightTop(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function rightMiddle(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function rightBottom(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function topLeft(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function topCenter(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function topRight(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function middleLeft(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function middleCenter(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function middleRight(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function bottomLeft(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function bottomCenter(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function bottomRight(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
}
