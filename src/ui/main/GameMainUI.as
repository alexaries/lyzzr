/**Created by the LayaAirIDE,do not modify.*/
package ui.main {
	import laya.ui.*;
	import laya.display.*; 

	public class GameMainUI extends View {
		public var battle:Sprite;
		public var homeWin:Sprite;
		public var win:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"name":"zhujiemian","height":1920},"child":[{"type":"Sprite","props":{"y":0,"x":0,"var":"battle"}},{"type":"Sprite","props":{"y":0,"x":0,"var":"homeWin"}},{"type":"Sprite","props":{"y":0,"x":0,"var":"win"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}