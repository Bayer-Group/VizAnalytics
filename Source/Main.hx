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

	private function makeList():Array<Sprite>{
		var list:Array<Sprite> = [];
		var scale  = Scale.log().range([1,50]).domain([0,10]);
		var color  = Color.linear().range([0xff,0x00ff00]).domain([0,10]);
		for (i in 0...10){
			var style = new utility.Style();
			trace(i, scale.value(i));
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
//		for (r in list){
//			var g = cast(r,Sprite).graphics;
//			var opts = Actuate.transform(g, 5).color(0x00ff00, 2);
//
//
//
////      g.lineStyle(0,0x000000);
////			g.beginFill(0x006666);
//		}
		return list;

	}
	public function new () {

		super ();

		var hBox:HBox = new HBox();
		hBox.addChildren(Align.middle(getDifSzRcts()));
		var circles:Array<DisplayObject> = cast makeList();
		var hBox1:HBox = new HBox();
		hBox1.addChildren(Align.bottom(circles));
//
//    var vBox:VBox = new VBox();
//    var scale:Dynamic = new Scale(1,100,0,hBox.width);
//    var xAxis = new XAxis(scale);
//
//		var bChart = new HBox();
//		bChart.addChildren(Align.bottom(getDifSzRcts()));
//
//    var vChildren:Array<DisplayObject> = cast [];
//    vChildren.push(hBox);
//
//		vChildren.push(bChart);
//    vChildren.push(xAxis);
//
//
//    vBox.addChildren(vChildren);
//
//
//
//
//
		var bb:Rectangle = hBox.getBoundingBox();
//		addChild(vBox);

		var vBox:VBox = new VBox();
		vBox.addChildren([hBox,hBox1]);
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