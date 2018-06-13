/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class BattleStarItemUI extends View {
		public var check:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":200,"height":200},"child":[{"type":"Image","props":{"y":0,"x":0,"width":200,"skin":"main/bg_function_icon.png","height":200}},{"type":"Image","props":{"y":35,"x":34,"width":132,"var":"check","skin":"main/zhenying_1.png","height":129}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}