package ;
class MainTest {
  static function main() {
    var r = new haxe.unit.TestRunner();
    r.add(new test.scale.Scale());
    r.add(new test.scale.Color());
//    r.add(new test.utility.Bounds());
// add other TestCases here

// finally, run the tests
    r.run();
  }
}