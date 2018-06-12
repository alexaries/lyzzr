/**Created by the LayaAirIDE,do not modify.*/
package ui.achievement {
	import laya.ui.*;
	import laya.display.*; 

	public class HeadMapUI extends View {
		public var preTxt:Label;
		public var heroName:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":184,"height":240},"child":[{"type":"Image","props":{"y":0,"x":0,"width":184,"skin":"ui/card/10500.png/10500.png","height":184}},{"type":"Label","props":{"y":-2,"x":7,"var":"preTxt","text":"100%","color":"#0f0e0e"}},{"type":"Label","props":{"y":190,"x":47,"var":"heroName","text":"李泽言","color":"#fdfdfd"}},{"type":"Sprite","props":{"y":6,"x":145}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}