package scale;

class Scale {
  var d:Array<Dynamic> = [1,100];
  var r:Array<Dynamic> = [1,100];

  var s:Dynamic;
  var f:Dynamic;
  var c:Bool = false;
  var input:Dynamic->Dynamic;
  var output:Dynamic->Dynamic;

  static var linearFunc = function(v:Dynamic):Dynamic{return v;};
  static var logrFunc   = function(v:Dynamic):Dynamic{return Math.log(v);};
  static var expFunc    = function(v:Dynamic):Dynamic{return Math.exp(v);};

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


  private function scale_bilinear(domain:Array<Dynamic>, range:Array<Dynamic>,
                                     uninterpolate:Dynamic -> Dynamic -> Dynamic,
                                     interpolate:Dynamic -> Dynamic -> Dynamic):Dynamic->Dynamic {
    var u = uninterpolate(domain[0], domain[1]);
    var i = interpolate(range[0], range[1]);
    return function(x) {
      return i(u(x));
    };
  }


  private function scale(x:Dynamic):Dynamic->Dynamic {
    return output(x);
  }

  private function rescale():Dynamic->Dynamic {
    var linear = scale_bilinear;
    var uninterpolate = (c)? uninterpolateClamp : uninterpolateNumber;
    output = scale_bilinear(d, r, uninterpolate, interpolateNumber);
    input = scale_bilinear(r, d, uninterpolate, interpolateNumber);
    return scale;
  }
  private function new(func:Dynamic->Dynamic) {
    f = (func == null)? Scale.linearFunc : func;
    rescale();
  }
  public function getRange()  {return r;}
  public function getDomain() {return d;}

  public function value(input:Dynamic):Dynamic {

    return output(input);

  }



  public function domain(domain:Array<Dynamic>):Scale {
    d = domain;
    d.sort(function(a,b){return (a < b)? -1 : ((a > b)?  1 : 0);});
    rescale();
    return this;
  }
  public function range(range:Array<Dynamic>):Scale {

    r = range;
    r.sort(function(a,b){return (a < b)? -1 : ((a > b)?  1 : 0);});
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
  public static function linear():Scale {return new Scale(linearFunc);}
  public static function log():Scale {return new Scale(logrFunc);}
  public static function exp():Scale {return new Scale(expFunc);}

}
