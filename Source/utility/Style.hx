package utility;

import haxe.ds.StringMap;
class Style extends StringMap<Array<Dynamic>> {

  public function new () {
    super();
  }
  public function beginFill(c:UInt):Style{
     set("beginFill",[c]);
     return this;
  }

//  public function lineStyle(thickness:Float, color:UInt, alpha:Float, pixelHinting:Bool, scaleMode:LineScaleMode, caps:CapsStyle, joints:JointStyle, miterLimit:Float):Void
  public function lineStyle(thickness:Float, color:UInt):Style{
    set("lineStyle",[thickness,color]);
    return this;
  }



}
