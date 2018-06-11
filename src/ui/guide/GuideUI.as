/**Created by the LayaAirIDE,do not modify.*/
package ui.guide {
	import laya.ui.*;
	import laya.display.*; 

	public class GuideUI extends View {
		public var ani1:FrameAnimation;
		public var maskBox:Sprite;
		public var maskArea:Sprite;
		public var interactionArea:Sprite;
		public var box:Clip;
		public var mouseXY:TextInput;
		public var tip:TextArea;
		public var arraw:Animation;
		public var jian:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"mouseEnabled":false,"height":1920},"child":[{"type":"Sprite","props":{"y":0,"x":0,"var":"maskBox"},"child":[{"type":"Sprite","props":{"y":0,"x":0,"var":"maskArea"}},{"type":"Sprite","props":{"y":0,"x":0,"var":"interactionArea"}}]},{"type":"Clip","props":{"y":503,"x":154,"width":178,"var":"box","skin":"module/guide_base/yindaofang.png","sizeGrid":"40,40,40,40","height":150,"clipY":1,"clipX":1}},{"type":"TextInput","props":{"y":0,"x":0,"width":128,"var":"mouseXY","text":"TextInput","skin":"comp/textinput.png","height":37,"fontSize":30,"font":"Microsoft YaHei"}},{"type":"TextArea","props":{"y":186,"x":30,"width":309,"var":"tip","valign":"middle","text":"查看技能界面吧！","skin":"module/guide_base/yindaokuang.png","sizeGrid":"41,25,41,25","mouseEnabled":false,"leading":10,"height":106,"fontSize":36,"font":"Microsoft YaHei","editable":false,"color":"#d6dee8","align":"center"}},{"type":"Animation","props":{"var":"arraw"},"compId":25,"child":[{"type":"Sprite","props":{"y":0,"x":0,"width":300,"var":"jian","pivotY":600,"pivotX":150,"height":600},"compId":19}]}],"animations":[{"nodes":[{"target":19,"keyframes":{"y":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":19,"key":"y","index":0},{"value":-6,"tweenMethod":"linearNone","tween":true,"target":19,"key":"y","index":5},{"value":0,"tweenMethod":"linearNone","tween":true,"target":19,"key":"y","index":10}]}},{"target":25,"keyframes":{"var":[{"value":"arrawClip","tweenMethod":"linearNone","tween":false,"target":25,"key":"var","index":0},{"value":"arraw","tweenMethod":"linearNone","tween":false,"target":25,"key":"var","index":10}],"autoPlay":[{"value":true,"tweenMethod":"linearNone","tween":false,"target":25,"key":"autoPlay","index":10}]}}],"name":"ani1","id":1,"frameRate":24,"action":0}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}