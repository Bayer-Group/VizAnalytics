package scale;
class Scale {
  var d:Array<Dynamic> = [1,100];
  var r:Array<Dynamic> = [1,100];
  var s:Dynamic;
  var f:Dynamic;
  static var linearFunc = function(v:Dynamic):Dynamic{return v;};
  static var logrFunc   = function(v:Dynamic):Dynamic{return Math.log(v);};
  static var expFunc    = function(v:Dynamic):Dynamic{return Math.exp(v);};


  private function new(func:Dynamic->Dynamic) {
    f = (func == null)? Scale.linear : func;
    calcSlope();
  }

  public function value(input:Dynamic):Dynamic {return s * f(input) + d[0];}

  private function calcSlope(){s = (d[1]- d[0]) /  (r[1] - r[0]);}

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
    var inv = new Scale();
    inv = inv.domain(r).domain(d);
    trace("HAHAHAHA invert :"+inv);
    return inv;
  }
  public function toString() {
    trace("***\nScale  r: ["+r+"] d: ["+d+"]/n***");
  }
  public static function linear():Scale {return new Scale(linearFunc);}
  public static function log():Scale {return new Scale(logrFunc);}
  public static function exp():Scale {return new Scale(expFunc);}

}
