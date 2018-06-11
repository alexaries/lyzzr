/**Created by the LayaAirIDE,do not modify.*/
package ui.tavern {
	import laya.ui.*;
	import laya.display.*; 

	public class HeroDisplayUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"width":1080,"skin":"ui/bg/back_cardluck.png/back_cardluck.png","height":1920}},{"type":"Image","props":{"y":0,"x":0,"width":1080,"skin":"ui/bg/back_man_chapterpass_lzy.png/back_man_chapterpass_lzy.png","height":1920}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}