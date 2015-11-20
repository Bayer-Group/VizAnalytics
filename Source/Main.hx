package;


import layouts.Align;
import flash.geom.Rectangle;
import utility.Shape;
import openfl.display.*;
import container.*;
import utility.*;
import axis.XAxis;
import motion.Actuate;
import openfl.geom.ColorTransform;




class Main extends Sprite {
	
	private function makeList():Array<Sprite>{
		var list:Array<Sprite> = [];
    var scale:Dynamic = new Scale(1,10,0,1);

		for (i in 0...10){
      var s:Sprite = Shape.circle(20.0);
      var g = s.graphics;
//      s.graphics.beginFill(scale.getBetweenColourByPercent(i, 0xff0000,0x00ff00));

      Actuate.transform(s, 5).color(0xff0000, 2);
//      s.transform.colorTransform = new ColorTransform(1, 0, 0, 1, 0, 20, 0, 0);
			list.push(s);
		};
		return list;
	}

  private function getDifSzRcts():Array<DisplayObject> {
		var list:Array<DisplayObject> = [
			Shape.rect(20,20),
			Shape.rect(25,20),
			Shape.rect(30,25),
			Shape.rect(30,30)
		];
		for (r in list){
			var g = cast(r,Sprite).graphics;
			Actuate.transform(g, 5).color(0x00ff00, 2);
//      g.lineStyle(0,0x000000);
//			g.beginFill(0x006666);
		}
		return list;

	}
	public function new () {
		
		super ();

		var hBox:HBox = new HBox();
		var circles:Array<DisplayObject> = cast makeList();
    hBox.addChildren(circles);

    var vBox:VBox = new VBox();
    var scale:Dynamic = new Scale(1,100,0,hBox.width);
    var xAxis = new XAxis(scale);

		var bChart = new HBox();
		bChart.addChildren(Align.bottom(getDifSzRcts()));

    var vChildren:Array<DisplayObject> = cast [];
    vChildren.push(hBox);

		vChildren.push(bChart);
    vChildren.push(xAxis);


    vBox.addChildren(vChildren);





		var bb:Rectangle = vBox.getBoundingBox();
		addChild(vBox);

		addChild(Shape.rect(bb.width,bb.height));

		
	}
	
	
}