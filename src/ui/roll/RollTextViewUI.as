/**Created by the LayaAirIDE,do not modify.*/
package ui.roll {
	import laya.ui.*;
	import laya.display.*; 
	import laya.html.dom.HTMLDivElement;

	public class RollTextViewUI extends View {
		public var rollText:HTMLDivElement;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":710,"height":70},"child":[{"type":"Clip","props":{"width":710,"skin":"main/alertgoodBg.png","sizeGrid":"15,15,15,15","height":70}},{"type":"HTMLDivElement","props":{"y":22,"x":4,"width":701,"var":"rollText","height":37}}]};
		override protected function createChildren():void {
			View.regComponent("HTMLDivElement",HTMLDivElement);
			super.createChildren();
			createView(uiView);

		}

	}
}