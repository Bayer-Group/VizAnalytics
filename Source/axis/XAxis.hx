package axis;
import utility.Bounds;
import layouts.Align;
import utility.Shape;
import scale.Scale;
import utility.Shape;
import container.*;
import flash.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;



class XAxis extends Axis{

  public function new(scale:Scale) {
    super(scale);
  }
  override private function construct():Axis {
    var range = this.scale.getRange();
    var length = range[1] - range[0];
    var line = Shape.line(length, 0);

    var label = Shape.text("Sucker");

    trace("line width: "+line.width);
    var paddedLabel = Shape.rect(length,Bounds.getRelBoundingBox(label).height);
    Align.centerMiddle([paddedLabel,label]);
    paddedLabel.addChild(label);

    var vBox = new VBox();
    vBox.addChildren([line,paddedLabel]);

    addChild(vBox);

    return this;
  }
}
