/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class BattleDisplayViewUI extends View {
		public var bgIcon:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":960,"x":540,"width":512,"var":"bgIcon","skin":"ui/role/10400.png","pivotY":512,"pivotX":256,"height":1024}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}