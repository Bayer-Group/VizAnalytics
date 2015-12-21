package container;
import openfl.display.DisplayObject;

import motion.Actuate;
class HBox extends Container {

    private var spacing(default,null): Float = 10.0;

    public function new() {
        super();
    }


    public override function addChildren(children:Array<DisplayObject>):Container{

      super.addChildren(children);
      Lambda.fold(children,function(d:DisplayObject,mem:Float){
          if (mem != 0){
              d.x = mem + spacing;
          }
          return d.x + d.width;
      },0);

  //        updateDebug();
      Actuate.tween (debug, 10, { alpha: 0.5 });
      return cast this;

    }

    public function set_spacing(val:Float):Container{
        return this;
    }



}
