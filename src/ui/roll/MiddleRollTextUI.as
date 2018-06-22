/**Created by the LayaAirIDE,do not modify.*/
package ui.roll {
	import laya.ui.*;
	import laya.display.*; 
	import laya.html.dom.HTMLDivElement;

	public class MiddleRollTextUI extends View {
		public var rollText:HTMLDivElement;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":550,"height":70},"child":[{"type":"Clip","props":{"y":2,"x":0,"width":550,"skin":"common/surface/frame_guide.png","sizeGrid":"15,15,15,15","height":65}},{"type":"HTMLDivElement","props":{"y":20,"x":6,"width":537,"var":"rollText","height":33}}]};
		override protected function createChildren():void {
			View.regComponent("HTMLDivElement",HTMLDivElement);
			super.createChildren();
			createView(uiView);

		}

	}
}