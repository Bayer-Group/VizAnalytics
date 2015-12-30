package scale;

using hxColorToolkit.ColorToolkit;
//var hexColor = 0x112233.toHex();
//trace(hexColor.red); //0x11
//trace(hexColor.green); //0x22
//trace(hexColor.blue); //0x33
//
//var hslColor = new hxColorToolkit.spaces.HSL(0, 100, 50); //construct a color in HSL space
//trace(hslColor.getColor()); //0xFF0000 the hex color value

class Scale {
  var d:Array<Dynamic> = [0,1];
  var r:Array<Dynamic> = [0,1];

  var s:Dynamic;
  var f:Dynamic;
  var c:Bool = false;
  var input:Dynamic->Dynamic;
  var output:Dynamic->Dynamic;




  private function new(domain:Array<Dynamic>, range:Array<Dynamic>, clamp:Bool) {
    d = domain;
    r = range;
    c = clamp;
    rescale();
  }


  private function uninterpolateNumber(a:Dynamic, b:Dynamic):Dynamic -> Dynamic {
    b = (b - a)> 0 ? 1 / (b - a) : 0;
    return function(x:Dynamic) {
      return (x - a) * b;
    };
  }

  private function uninterpolateClamp(a:Dynamic, b:Dynamic):Dynamic -> Dynamic {
    b = (b - a)> 0 ? 1 / (b - a) : 0;
    return function(x:Dynamic) {
      return Math.max(0, Math.min(1, (x - a) / b));
    };
  }

  private function interpolateNumber (a:Dynamic, b:Dynamic):Dynamic -> Dynamic {
    b -= a;
    return function(t:Dynamic) {
      return a + b * t;
    };
  }
  private function interpolateRgb(a:Dynamic, b:Dynamic):Dynamic -> Dynamic{
    var aRGB = a.toHex();
    var bRGB = b.toHex();
    trace("in iRGB "+aRGB.toString()+", "+bRGB.toString());

    var ar = aRGB.red;
    var ag = aRGB.green;
    var ab = aRGB.blue;
    var br = bRGB.red - ar;
    var bg = bRGB.green - ag;
    var bb = bRGB.blue - ab;
    return function(t) {
      var r = Math.round(ar + (br * t));
      var g = Math.round(ag + (bg * t));
      var b = Math.round(ab + (bb * t));
      var rgb = new hxColorToolkit.spaces.RGB(r,g,b);
      return rgb.getColor();
    };
  }
/**
    *try and figure out what type of interpolator to return...either number or rgb
    **/
  private function genericInterpolator(a:Dynamic, b:Dynamic):Dynamic -> Dynamic {
    trace("\nGenericInterpolator...what kind ("+a+", "+b+")");
    if(Std.is(a, Float) == Std.is(b, Float) == true){
      trace("interpolateNumber("+a+", "+b+")");
      return interpolateNumber(a,b);
    }
    if(Std.is(a, Int) == Std.is(b, Int) == true) {
      var test = ~/(^0x[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/;
      var aStr = Std.string(a);
      var bStr = Std.string(b);
      if (test.match(aStr) == test.match(bStr) == true){
        trace("interpolateRgb"+a+", "+b+")");
        return interpolateRgb(a,b);
      }
      else {
        trace("interpolateNumber("+a+", "+b+")");
        return interpolateNumber(a,b);
      }
    }
    else{
      trace("interpolateNumber("+a+", "+b+")");
      return interpolateNumber(a,b);
    }
  }

  private function scale_bilinear(domain:Array<Dynamic>, range:Array<Dynamic>,
                                  uninterpolate:Dynamic -> Dynamic -> Dynamic,
                                  interpolate:Dynamic -> Dynamic -> Dynamic):Dynamic->Dynamic {
    var u = uninterpolate(domain[0], domain[1]);
    var i = interpolate(range[0], range[1]);
    return function(x) {
      return i(u(x));
    };
  }

  private function rescale(){
    var linear = scale_bilinear;
    var uninterpolate = (c)? uninterpolateClamp : uninterpolateNumber;
    output = scale_bilinear(d, r, uninterpolate, interpolateNumber);
    input = scale_bilinear(r, d, uninterpolate, interpolateNumber);

  }


  public function getRange()  {return r;}
  public function getDomain() {return d;}

  public function value(input:Dynamic):Dynamic {

    return output(input);

  }



  public function domain(domain:Array<Dynamic>):Scale {
    d = domain;
//    d.sort(function(a,b){return (a < b)? -1 : ((a > b)?  1 : 0);});
    rescale();
    return this;
  }
  public function range(range:Array<Dynamic>):Scale {

    r = range;
//    r.sort(function(a,b){return (a < b)? -1 : ((a > b)?  1 : 0);});
    rescale();
    return this;
  }


  public function invert(x:Dynamic):Dynamic {

    return input(x);
  }
  public function clamp(flag:Bool):Scale {
    c = flag;
    rescale();
    return this;
  }

  public function ticks(count:Int = 10):Array<Dynamic> {
    var len = r[1] - r[0];
    var interval = Math.floor(len / count);
    var tickArr = [];
    for (i in 0...10){
      var position = i * interval;
      if (position <= r[1]) tickArr.push(position);
    }
    return tickArr;
  }
  public function test(domain:Array<Int>){
  }

  public function toString() {
    return "\n***\nScale  r: "+r+" d: "+d+"\n***";
  }
  public static function linear():Scale {return new Scale([0,1],[0,1],false);}
//  public static function log():Scale {return new Scale();}
//  public static function exp():Scale {return new Scale();}

}
