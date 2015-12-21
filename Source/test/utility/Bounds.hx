package test.utility;
import utility.Bounds;
import openfl.geom.Rectangle;
import openfl.display.DisplayObject;
import utility.Shape;
class Bounds extends haxe.unit.TestCase {

  override public function setup() {}

  override public function tearDown() {}

  public function testRectangleBounds() {
    var shape:DisplayObject = Shape.rect(20,30);
    var rectangle = new Rectangle();
    rectangle.setTo(0,0,20,30);
    var calculatedBounds = utility.Bounds.getRelBoundingBox(shape);

    assertEquals(Std.string(calculatedBounds),Std.string(rectangle));


  }

}