package layouts;
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
    var getHeight = function(d){return d.height;}
    var maxHeight:Float = Lambda.map(children,getHeight)
    return children;
  }
  public static function top(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
  public static function middle(children:Array<DisplayObject>) { return align(HAlign.NONE,  VAlign.MIDDLE, children);}
  public static function bottom(children:Array<DisplayObject>) { return align(HAlign.NONE,  VAlign.BOTTOM, children);}
  public static function left(children:Array<DisplayObject>)   { return align(HAlign.LEFT,  VAlign.NONE, children);}
  public static function center(children:Array<DisplayObject>) { return align(HAlign.CENTER,VAlign.NONE, children);}
  public static function right(children:Array<DisplayObject>)  { return align(HAlign.RIGHT, VAlign.NONE, children);}

//
//  public static function leftTop(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function leftMiddle(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function leftBottom(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function centerTop(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function centerMiddle(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function centerBottom(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function rightTop(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function rightMiddle(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function rightBottom(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function topLeft(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function topCenter(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function topRight(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function middleLeft(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function middleCenter(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function middleRight(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function bottomLeft(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function bottomCenter(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
//  public static function bottomRight(children:Array<DisplayObject>)    { return align(HAlign.NONE,  VAlign.TOP, children);}
}
