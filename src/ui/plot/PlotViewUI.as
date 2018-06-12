/**Created by the LayaAirIDE,do not modify.*/
package ui.plot {
	import laya.ui.*;
	import laya.display.*; 

	public class PlotViewUI extends View {
		public var bgSpr:Sprite;
		public var bgImg:Image;
		public var role:Sprite;
		public var roleImg:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1300,"height":1920},"child":[{"type":"Sprite","props":{"var":"bgSpr"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1388,"var":"bgImg","skin":"ui/bgImg/1011.png","height":2775}}]},{"type":"Sprite","props":{"var":"role"},"child":[{"type":"Image","props":{"y":489,"x":153,"width":1026,"var":"roleImg","skin":"ui/role/10300.png","height":2052}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}