/**Created by the LayaAirIDE,do not modify.*/
package ui.guide {
	import laya.ui.*;
	import laya.display.*; 

	public class WelcomeUI extends View {
		public var btnOK:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1300,"name":"huanying","height":1920},"child":[{"type":"Image","props":{"y":431,"x":0,"skin":"module/guide/welcome.jpg"}},{"type":"Button","props":{"y":1268,"x":500,"width":300,"var":"btnOK","stateNum":2,"skin":"common/button/btn_yellow_218_86.png","sizeGrid":"25,40,25,40","name":"huanying_lingqu","labelSize":30,"labelPadding":"-2","labelFont":"Microsoft YaHei","labelColors":"#ffffff","label":"点击领取","height":86}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}