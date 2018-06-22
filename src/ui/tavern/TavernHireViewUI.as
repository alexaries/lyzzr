/**Created by the LayaAirIDE,do not modify.*/
package ui.tavern {
	import laya.ui.*;
	import laya.display.*; 

	public class TavernHireViewUI extends View {
		public var getBtn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":-110,"width":1300,"skin":"ui/bg/back_cardluck.png/back_cardluck.png","height":1920}},{"type":"Button","props":{"y":920,"x":428,"var":"getBtn","stateNum":2,"skin":"button/btn_yeqian.png","labelSize":32,"labelFont":"Arial","labelColors":"#f1fdfd","label":"获得"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}