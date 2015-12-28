package test.scale;

class Scale extends haxe.unit.TestCase {
  var defaultDomain:Array<Dynamic> = [1,100];
  var defaultRange:Array<Dynamic> = [1,100];

  override public function setup() {

  }

  override public function tearDown() {

  }

  public function testDefualtLinear() {
    var scale = scale.Scale.linear();

    assertEquals(Std.string(scale.getDomain()),Std.string(defaultDomain));
    assertEquals(Std.string(scale.getRange()),Std.string(defaultRange));

    assertEquals(Std.string(0),Std.string(scale.value(0)));

    assertEquals(Std.string(1),Std.string(scale.value(1)));
    assertEquals(Std.string(100),Std.string(scale.value(100)));

    assertEquals(Std.string(101),Std.string(scale.value(101)));

    assertEquals(Std.string(50),Std.string(scale.value(50)));

  }
  public function testLinearClamp(){
    var scale = scale.Scale.linear().clamp(true);

    assertEquals(Std.string(1),Std.string(scale.value(0)));

    assertEquals(Std.string(1),Std.string(scale.value(-100)));

    assertEquals(Std.string(100),Std.string(scale.value(101)));

    assertEquals(Std.string(100),Std.string(scale.value(200)));
  }

  public function testLinearDiffRangeAndDomainNoClamp(){
    var scale = scale.Scale.linear().domain([-100,100]).range([0,50]).clamp(false);

    assertEquals(Std.string(25),Std.string(scale.value(0)));

    assertEquals(Std.string(0),Std.string(scale.value(-100)));

    assertEquals(Std.string(50),Std.string(scale.value(100)));

    assertEquals(Std.string(75),Std.string(scale.value(200)));
  }

}