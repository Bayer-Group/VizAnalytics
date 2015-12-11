package ;
class MainTest {
  static function main() {
    var r = new haxe.unit.TestRunner();
    r.add(new test.scale.Scale());
// add other TestCases here

// finally, run the tests
    r.run();
  }
}