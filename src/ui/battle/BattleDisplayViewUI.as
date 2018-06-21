/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class BattleDisplayViewUI extends View {
		public var bgIcon:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":1064,"x":540,"width":856,"var":"bgIcon","skin":"ui/role/10400.png","scaleX":1,"pivotY":856,"pivotX":428,"height":1712}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}