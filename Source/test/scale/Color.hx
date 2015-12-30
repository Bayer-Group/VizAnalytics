package test.scale;

import hxColorToolkit.spaces.RGB;

using hxColorToolkit.ColorToolkit;
class Color extends haxe.unit.TestCase {
  var defaultDomain:Array<Dynamic> = [0,1];
  var defaultRange:Array<Dynamic> = [0,1];

  override public function setup() {

  }

  override public function tearDown() {

  }



  private static var hexCodes = "0123456789ABCDEF";

  public static function rgbToHex(r:Int, g:Int, b:Int):Int
  {
    var hexString = "0x";
//Red
    hexString += hexCodes.charAt(Math.floor(r/16));
    hexString += hexCodes.charAt(r%16);
//Green
    hexString += hexCodes.charAt(Math.floor(g/16));
    hexString += hexCodes.charAt(g%16);
//Blue
    hexString += hexCodes.charAt(Math.floor(b/16));
    hexString += hexCodes.charAt(b%16);

    return Std.parseInt(hexString);
  }

  public static function rgbaToHex(r:Int, g:Int, b:Int, a:Int):Int
  {
    var hexString = "0x";
//Red
    hexString += hexCodes.charAt(Math.floor(r/16));
    hexString += hexCodes.charAt(r%16);
//Green
    hexString += hexCodes.charAt(Math.floor(g/16));
    hexString += hexCodes.charAt(g%16);
//Blue
    hexString += hexCodes.charAt(Math.floor(b/16));
    hexString += hexCodes.charAt(b%16);
//Alpha
    hexString += hexCodes.charAt(Math.floor(a/16));
    hexString += hexCodes.charAt(a%16);


    return Std.parseInt(hexString);
  }

  public function testDefualtLinearColor() {
    var scale = scale.Color.linear().domain([1,10]).range([0xFF0000,0x00FF00]);

    assertEquals(0xFF0000,scale.value(1));
    assertEquals(0xE21C00,scale.value(2));
    assertEquals(0xC63800,scale.value(3));
    assertEquals(0xAA5500,scale.value(4));
    assertEquals(0x8D7100,scale.value(5));
    assertEquals(0x718D00,scale.value(6));
    assertEquals(0x55AA00,scale.value(7));
    assertEquals(0x38C600,scale.value(8));
    assertEquals(0x1CE200,scale.value(9));
    assertEquals(0x00FF00,scale.value(10));

//    assertEquals(1,scale.invert(0xFF0000));
//    assertEquals(5,scale.invert(0x8D7100));
//    assertEquals(10,scale.invert(0x00FF00));


  }

}
