package axis;

import container.Container;
import scale.Scale;

enum AxisPosition {
  top;
  bottem;
  left;
  right;
}

class Axis extends Container {
  private var ticks            : Bool;
  private var line             : Bool;
  private var tickLables       : Bool;
  private var axisLabel        : Bool;
  private var scale            : Scale;
  private var tickPadding      : Float = 1.0;
  private var tickLabelPadding : Float = 2.0;
  private var axisLabelPadding : Float = 10.0;
  private var tickHeight       : Float = 5.0;
  private var postion          : AxisPosition;

  public function new(scale:Scale) {
    super();
    ticks      = true;
    line       = true;
    tickLables = true;
    axisLabel  = true;
    this.scale = scale;
    construct();
  }

  private function construct():Axis{
    return this;
  }

  public function showTicks(flag:Bool):Axis {
    ticks = flag;
    return construct();
  }
  public function showLine(flag:Bool):Axis {
    line = flag;
    return construct();
  }

  public function showTickLabels(flag:Bool):Axis {
    axisLabel = flag;
    return construct();
  }

  public function showAxisLabels(flag:Bool):Axis {
    axisLabel = flag;
    return construct();
  }



}
