package scale;
class Color extends Scale {

  var colorOne:UInt = 0xFFFFFF;
  var colorTwo:UInt = 0x111111;
  var percent:Scale = Scale.linear().range([0,1]);

  public function new(domain,range,clamp) {
    super(domain,range,clamp);


  }


//  private function interpolateRgb(a:Dynamic, b:Dynamic):Dynamic -> Dynamic{
//    var aRGB = a.toHex();
//    var bRGB = b.toHex();
//
//    var ar = aRGB.red;
//    var ag = aRGB.green;
//    var ab = aRGB.blue;
//    var br = bRGB.red - ar;
//    var bg = bRGB.green - ag;
//    var bb = bRGB.blue - ab;
//    return function(t) {
//      var r = Math.round(ar + (br * t));
//      var g = Math.round(ag + (bg * t));
//      var b = Math.round(ab + (bb * t));
//      var rgb = new hxColorToolkit.spaces.RGB(r,g,b);
//      return rgb.getColor();
//    };
//  }

  private function getBetweenColourByPercent(value:Float = 0.5 /* 0-1 */, highColor:UInt = 0xFFFFFF, lowColor:UInt = 0x000000):UInt {
    var r:Float = highColor >> 16;
    var g:Float = highColor >> 8 & 0xFF;
    var b:Float = highColor & 0xFF;

    r += ((lowColor >> 16) - r) * value;
    g += ((lowColor >> 8 & 0xFF) - g) * value;
    b += ((lowColor & 0xFF) - b) * value;

    return (Std.int(r) << 16 | Std.int(g) << 8 | Std.int(b));
  }

  private override function rescale(){
    super.rescale();
    percent.domain(d).clamp(c);
  }

  public override function value(input:Dynamic) :UInt{
    var pVal = percent.value(input);
    return getBetweenColourByPercent(pVal,r[0],r[1]);
  }

  public override function invert(x:UInt):Dynamic {
    return input(x);
  }
  public static override function linear():Color {return new Color([0,1],[0xFF0000,0x00FF00],false);}
//  public static override function log():Color {return new Color(Scale.logrFunc);}
//  public static override function exp():Color {return new Color(Scale.expFunc);}

}
