package container;
import openfl.display.DisplayObject;
class VBox extends Container {

  private var spacing: Float = 10.0;

  public function new() {
    super();
  }


  override public function addChildren(children:Array<DisplayObject>):Container{
    super.addChildren(children);
    Lambda.fold(children,function(d:DisplayObject,mem:Float){
      if (mem != 0){
        d.y = mem + spacing;
      }
      mem = d.y + d.height;

      return mem;
    },0);

    return this;

  }

}
