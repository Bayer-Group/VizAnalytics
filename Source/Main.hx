package;


import scale.Color;
import scale.Scale;
import StringTools;
import js.html.Rect;
import layouts.Align;
import flash.geom.Rectangle;
import utility.Shape;
import openfl.display.*;
import container.*;


import axis.XAxis;
import motion.Actuate;
import openfl.geom.ColorTransform;



class Main extends Sprite {
	private function makeHisto():Array<Sprite>{

  }

	private function makeList():Array<Sprite>{
		var list:Array<Sprite> = [];
		var scale  = Scale.log().range([1,50]).domain([0,10]);
		trace("ticks :"+scale.ticks());
		var color  = Color.linear().range([0xff,0x00ff00]).domain([0,10]);
		for (i in 0...10){
			var style = new utility.Style();
			style.beginFill(color.value(i));
			var s:Sprite = Shape.rect(20,scale.value(i),style);
			var g = s.graphics;
			list.push(s);
		};
		return list;
	}

	private function getDifSzRcts():Array<DisplayObject> {
		var list:Array<DisplayObject> = [
			Shape.rect(50,70),
			Shape.rect(90,20),
			Shape.rect(60,40),
			Shape.rect(50,50)
		];

		return list;

	}
	public function new () {

		super ();

		var hBox:HBox = new HBox();
		hBox.addChildren(Align.middle(getDifSzRcts()));
		var circles:Array<DisplayObject> = cast makeList();
		var hBox1:HBox = new HBox();
		hBox1.addChildren(Align.bottom(circles));
		var bb:Rectangle = hBox1.getBoundingBox();
		
		var axis = new XAxis(Scale.linear().range([0,bb.width]));


		var vBox:VBox = new VBox();
		vBox.addChildren([hBox,hBox1,axis]);
		addChild(Shape.bounds(bb.width,bb.height));
		addChild(vBox);
		var cc:Rectangle = vBox.getBoundingBox();
		addChild(Shape.bounds(cc.width,cc.height));

//		var scale  = Scale.linear().domain([1,10]).range([10,20]);
//		var scale2:Scale = Scale.linear().domain(scale.getRange()).range(scale.getDomain());
//    trace("normal :"+scale);
//		trace("invert :"+scale2);
//		for (i in 1...10){
//			trace("UP :"+scale.value(i));
//		}
//		for (i in 1...10){
//			trace("DN :"+scale2.value(i));
//		}
	}


}