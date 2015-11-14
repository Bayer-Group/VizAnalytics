package axis;
import utility.*;
import container.*;
import flash.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;



class XAxis extends Axis{
  public function new(scale:Scale) {
    super(scale);
  }
  override private function construct():Axis {
    var line = Shape.line(scale.getRangeMax(),0);
    var label = new TextField();
    label.embedFonts = true;
    var tf = new TextFormat("Verdana");
    label.defaultTextFormat = tf;
    label.text = "Hello World";
    trace("line width: "+line.width);
    trace("label "+label.textWidth,label.textHeight);
    var vBox = new VBox();
    vBox.addChildren([line,label]);

    addChild(vBox);

    return this;
  }
}
