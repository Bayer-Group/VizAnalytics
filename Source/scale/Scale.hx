package scale;

class Scale {
  var d:Array<Dynamic> = [1,100];
  var r:Array<Dynamic> = [1,100];

  var s:Dynamic;
  var f:Dynamic;
  var c:Bool = true;

  static var linearFunc = function(v:Dynamic):Dynamic{return v;};
  static var logrFunc   = function(v:Dynamic):Dynamic{return Math.log(v);};
  static var expFunc    = function(v:Dynamic):Dynamic{return Math.exp(v);};


  private function new(func:Dynamic->Dynamic) {
    f = (func == null)? Scale.linearFunc : func;
    calcSlope();
  }
  public function getRange()  {return r;}
  public function getDomain() {return d;}

  public function value(input:Dynamic):Dynamic {

    var val:Dynamic  = s * f(input) + r[0];
    return if (c == true) (val > r[1])? r[1]:(val < r[0])? r[0]:val;
    else val;

  }

  private function calcSlope(){s = (r[1]- r[0]) /  (d[1] - d[0]);}

  public function domain(domain:Array<Dynamic>):Scale {
    d = domain;
    d.sort(function(a,b){return (a < b)? -1 : ((a > b)?  1 : 0);});
    calcSlope();
    return this;
  }
  public function range(range:Array<Dynamic>):Scale {
    r = range;
    r.sort(function(a,b){return (a < b)? -1 : ((a > b)?  1 : 0);});
    calcSlope();
    return this;
  }

  public function invert():Scale {
    var tmpR = r;
    var tmpD = d;
    var inv:Scale = new Scale(f);
    return inv.domain(r).domain(d);
  }
  public function clamp(flag:Bool):Scale {
    c = flag;
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

  public function toString() {
    return "\n***\nScale  r: "+r+" d: "+d+"\n***";
  }
  public static function linear():Scale {return new Scale(linearFunc);}
  public static function log():Scale {return new Scale(logrFunc);}
  public static function exp():Scale {return new Scale(expFunc);}

}
