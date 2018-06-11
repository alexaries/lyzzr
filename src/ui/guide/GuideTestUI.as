/**Created by the LayaAirIDE,do not modify.*/
package ui.guide {
	import laya.ui.*;
	import laya.display.*; 

	public class GuideTestUI extends View {
		public var closeBtn:Button;
		public var testBtn:Button;
		public var xmlText:TextArea;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1114,"skin":"comp/bg.png","sizeGrid":"28,6,8,7","height":1866}},{"type":"Button","props":{"y":82,"x":898,"width":146,"var":"closeBtn","skin":"comp/button.png","label":"X","height":100}},{"type":"Button","props":{"y":1690,"x":319,"width":472,"var":"testBtn","skin":"comp/button.png","label":"测试","height":153}},{"type":"TextArea","props":{"y":232,"x":63,"width":1001,"var":"xmlText","text":"TextArea","skin":"comp/textarea.png","height":1380,"hScrollBarSkin":"comp/vscroll.png","fontSize":35}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}