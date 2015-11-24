package scale;
class Color extends Scale {
  var percent = Scale.linear();
  public function new(func:Dynamic->Dynamic) {
    super(func);
  }

  public override function value(input:Dynamic):Dynamic {
    var value = super.value(input);
    var perc  = percent.value(value) / 100;
    return getBetweenColourByPercent(perc,r[0],r[1]);

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

}
