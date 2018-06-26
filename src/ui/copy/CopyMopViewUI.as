/**Created by the LayaAirIDE,do not modify.*/
package ui.copy {
	import laya.ui.*;
	import laya.display.*; 

	public class CopyMopViewUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":360,"x":-110,"width":1300,"skin":"surface/shuxingdi.png","height":1200}},{"type":"Image","props":{"y":360,"x":273,"width":534,"skin":"surface/iconditiao.png","height":124}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}