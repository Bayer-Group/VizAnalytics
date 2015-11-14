package container;
import flash.display.DisplayObject;

import motion.Actuate;
class HBox extends Container {

    private var spacing: Float = 10.0;

    public function new() {
        super();
    }


    override public function addChildren(children:Array<DisplayObject>):Void{
        super.addChildren(children);
        Lambda.fold(children,function(d:DisplayObject,mem:Float){
            if (mem != 0){
                d.x = mem + spacing;
            }
            return d.x + d.width;
        },0);

//        updateDebug();
        Actuate.tween (debug, 10, { alpha: 0.5 });

    }



}
