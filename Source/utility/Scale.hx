package utility;
class Scale {
    private var slope:Float;
    private var dMin:Float;
    private var dMax:Float;
    private var rMin:Float;
    private var rMax:Float;
    private function calculate(x:Float):Float {
        return slope * x + dMin;
    }
    public function new(domainMin:Float,domainMax:Float,rangeMin:Float,rangeMax:Float) {
        dMin = domainMin;
        dMax = domainMax;
        rMin = rangeMin;
        rMax = rangeMax;
        slope = (domainMax - domainMin) /  (rangeMax - rangeMin);
    }

    public function getDomainMin():Float {return dMin;}
    public function getDomainMax():Float {return dMax;}
    public function getRangeMin() :Float {return rMin;}
    public function getRangeMax() :Float {return rMax;}
    public function getDomain()   :Array<Float> {return [dMin,dMax];}

    public function getRange()    :Array<Float> {return [rMin,rMax];}

    public function linear(x:Float):Float{return calculate(x);}

    public function log(x:Float):Float{return calculate(Math.log(x));}

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
