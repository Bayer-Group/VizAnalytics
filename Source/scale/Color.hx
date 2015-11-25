package scale;
class Color extends Scale {
  var percent:Scale = Scale.linear();
  var colorOne:UInt = 0xFFFFFF;
  var colorTwo:UInt = 0x111111;
  public function new(func:Dynamic->Dynamic) {
    super(func);

    trace("\n\n set percent "+this.percent);
  }

  public override function value(input:Dynamic):Dynamic {
    var value = super.value(input);
    var perc  = percent.value(input) / 100;
    trace("color input value, perc, color"+ input,value,perc,getBetweenColourByPercent(perc,colorOne,colorTwo));
    return getBetweenColourByPercent(perc,colorOne,colorTwo);

  }
  public override function domain(domain:Array<Dynamic>):Scale {
    this.percent.domain(domain);
    trace("\n\n\n percent :"+this.percent);
    return super.domain(domain);
  }

  public override function range(range:Array<Dynamic>):Scale {
    colorOne = range[0];
    colorTwo = range[1];
    return super.range(range);
  }

  public function getBetweenColourByPercent(value:Float = 0.5 /* 0-1 */, highColor:UInt = 0xFFFFFF, lowColor:UInt = 0x000000):UInt {
    var r:Float = highColor >> 16;
    var g:Float = highColor >> 8 & 0xFF;
    var b:Float = highColor & 0xFF;

    r += ((lowColor >> 16) - r) * value;
    g += ((lowColor >> 8 & 0xFF) - g) * value;
    b += ((lowColor & 0xFF) - b) * value;

    return (Std.int(r) << 16 | Std.int(g) << 8 | Std.int(b));
  }
  public override function toString() {
    trace("\n***\nColor Scale  r: "+r+" d: "+d+"\n***");
  }
  public static override function linear():Color {return new Color(Scale.linearFunc);}
  public static override function log():Color {return new Color(Scale.logrFunc);}
  public static override function exp():Color {return new Color(Scale.expFunc);}

}
