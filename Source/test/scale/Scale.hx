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

//    assertEquals(scale.getDomain(),defaultDomain);
//    assertEquals(scale.getRange(),defaultRange);

    assertEquals(0,scale.value(0));
    assertEquals(0,scale.invert(0));

    assertEquals(1,scale.value(1));
    assertEquals(1,scale.invert(1));

    assertEquals(100,scale.value(100));
    assertEquals(100,scale.invert(100));

    assertEquals(101,scale.value(101));
    assertEquals(101,scale.invert(101));

    assertEquals(50,scale.value(50));
    assertEquals(50,scale.invert(50));

  }
  public function testLinearClamp(){
    var scale = scale.Scale.linear().clamp(true);

    assertEquals(0,scale.value(-1));

    assertEquals(1,scale.invert(1));

    assertEquals(1,scale.value(101));
  }

  public function testLinearDiffRangeAndDomainNoClamp(){
    var scale = scale.Scale.linear().domain([1,100]).range([1,50]);

    assertEquals(0.505050505050505,scale.value(0));
#if js
    assertEquals(99.99999999999999,scale.invert(50));
#else
//    expected '100' but was '100' !!!!
    assertEquals(Std.string(100),Std.string(scale.invert(50)));

#end


    assertEquals(-48.989898989899,scale.value(-100));
#if js
    assertEquals(-99.99999999998184,scale.invert(-48.98989898989));
#else
//    expected '-99.9999999999818' but was '-99.9999999999818'
    assertEquals(Std.string(-99.9999999999818),Std.string(scale.invert(-48.98989898989)));
#end


    assertEquals(50,scale.value(100));

    assertEquals(99.49494949494951,scale.value(200));
#if js
    assertEquals(200.00000000000003,scale.invert(99.49494949494951));
#else

//    expected '200' but was '200' !!!!
    assertEquals(Std.string(200),Std.string(scale.invert(99.49494949494951)));
#end

  }


}