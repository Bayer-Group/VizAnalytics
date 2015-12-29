package test.scale;

class Scale extends haxe.unit.TestCase {
  var defaultDomain:Array<Dynamic> = [0,1];
  var defaultRange:Array<Dynamic> = [0,1];

  override public function setup() {

  }

  override public function tearDown() {

  }

  public function testDefualtLinear() {
    var scale = scale.Scale.linear();

    assertEquals(Std.string(scale.getDomain()),Std.string(defaultDomain));
    assertEquals(Std.string(scale.getRange()),Std.string(defaultRange));

    assertEquals(Std.string(0),Std.string(scale.value(0)));
    assertEquals(Std.string(0),Std.string(scale.invert(0)));

    assertEquals(Std.string(1),Std.string(scale.value(1)));
    assertEquals(Std.string(1),Std.string(scale.invert(1)));

    assertEquals(Std.string(100),Std.string(scale.value(100)));
    assertEquals(Std.string(100),Std.string(scale.invert(100)));

    assertEquals(Std.string(101),Std.string(scale.value(101)));
    assertEquals(Std.string(101),Std.string(scale.invert(101)));

    assertEquals(Std.string(50),Std.string(scale.value(50)));
    assertEquals(Std.string(50),Std.string(scale.invert(50)));

  }
  public function testLinearClamp(){
    var scale = scale.Scale.linear().clamp(true);

    assertEquals(Std.string(0),Std.string(scale.value(-1)));

    assertEquals(Std.string(1),Std.string(scale.invert(1)));

    assertEquals(Std.string(1),Std.string(scale.value(101)));
  }

  public function testLinearDiffRangeAndDomainNoClamp(){
    var scale = scale.Scale.linear().domain([1,100]).range([1,50]);

    assertEquals(Std.string(0.505050505050505),Std.string(scale.value(0)));
#if js
    assertEquals(Std.string(99.99999999999999),Std.string(scale.invert(50)));
#else
    assertEquals(Std.string(100),Std.string(scale.invert(50)));
#end


    assertEquals(Std.string(-48.989898989899),Std.string(scale.value(-100)));
#if js
    assertEquals(Std.string(-99.99999999998184),Std.string(scale.invert(-48.98989898989)));
#else
    assertEquals(Std.string(-99.9999999999818),Std.string(scale.invert(-48.98989898989)));
#end


    assertEquals(Std.string(50),Std.string(scale.value(100)));

    assertEquals(Std.string(99.49494949494951),Std.string(scale.value(200)));
#if js
    assertEquals(Std.string(200.00000000000003),Std.string(scale.invert(99.49494949494951)));
#else
    assertEquals(Std.string(200),Std.string(scale.invert(99.49494949494951)));
#end

  }

}