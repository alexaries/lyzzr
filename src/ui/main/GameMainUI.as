/**Created by the LayaAirIDE,do not modify.*/
package ui.main {
	import laya.ui.*;
	import laya.display.*; 

	public class GameMainUI extends View {
		public var map:Sprite;
		public var battle:Sprite;
		public var sky:Sprite;
		public var cityWarWin:Sprite;
		public var btnHome:Button;
		public var homeWin:Sprite;
		public var win:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"name":"zhujiemian","height":1920},"child":[{"type":"Sprite","props":{"y":0,"x":0,"var":"map","name":"map"}},{"type":"Sprite","props":{"y":0,"x":0,"var":"battle"}},{"type":"Sprite","props":{"y":0,"x":0,"var":"sky"}},{"type":"Sprite","props":{"y":0,"x":0,"var":"cityWarWin","mouseThrough":true}},{"type":"Button","props":{"y":1740,"x":52,"var":"btnHome","stateNum":1,"skin":"common/button/btn_back.png","labelSize":35,"labelFont":"Microsoft YaHei"}},{"type":"Sprite","props":{"y":0,"x":0,"var":"homeWin"}},{"type":"Sprite","props":{"y":0,"x":0,"var":"win"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}