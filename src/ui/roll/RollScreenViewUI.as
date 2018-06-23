/**Created by the LayaAirIDE,do not modify.*/
package ui.roll {
	import laya.ui.*;
	import laya.display.*; 

	public class RollScreenViewUI extends View {
		public var alertTxt:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":415,"height":250},"child":[{"type":"Image","props":{"y":0,"x":0,"width":415,"skin":"surface/shuxingdi.png","height":250}},{"type":"Image","props":{"y":0,"x":0,"width":415,"skin":"surface/iconditiao2.png","sizeGrid":"0,50,0,50","height":250}},{"type":"Label","props":{"y":75,"x":18,"text":"!","fontSize":100,"color":"#f8f806","bold":true}},{"type":"Label","props":{"y":32,"x":77,"wordWrap":true,"width":324,"var":"alertTxt","valign":"middle","height":188,"fontSize":36,"font":"Arial","color":"#f1fdfd","align":"left"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}