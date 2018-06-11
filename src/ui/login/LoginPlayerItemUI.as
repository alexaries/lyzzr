/**Created by the LayaAirIDE,do not modify.*/
package ui.login {
	import laya.ui.*;
	import laya.display.*; 
	import laya.html.dom.HTMLDivElement;

	public class LoginPlayerItemUI extends View {
		public var occuImage:Image;
		public var nameHtml:HTMLDivElement;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":322,"height":52},"child":[{"type":"Image","props":{"y":0,"x":0,"width":50,"var":"occuImage","skin":"module/login/shi.png","height":52}},{"type":"HTMLDivElement","props":{"y":10,"x":50,"width":264,"var":"nameHtml","height":32,"fontSize":24,"font":"Microsoft YaHei","color":"#ffffff","align":"left"}}]};
		override protected function createChildren():void {
			View.regComponent("HTMLDivElement",HTMLDivElement);
			super.createChildren();
			createView(uiView);

		}

	}
}