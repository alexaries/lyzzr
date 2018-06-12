/**Created by the LayaAirIDE,do not modify.*/
package ui.plot {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class DialogViewUI extends View {
		public var bgImg:Image;
		public var decTxt:Text;
		public var headImg:Image;
		public var nameBgImg:Image;
		public var nameTxt:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1300,"height":550},"child":[{"type":"Image","props":{"y":327,"width":1042,"var":"bgImg","skin":"ui/dialog/dialogbg/bg01.png","pivotY":188,"pivotX":519,"height":381,"centerX":-3}},{"type":"Text","props":{"y":216,"x":397,"wordWrap":true,"width":728,"var":"decTxt","text":"我的名字叫顺流我叫顺流我叫顺流我叫顺流我叫顺流我","height":265,"fontSize":55,"color":"#000000"}},{"type":"Image","props":{"y":10,"x":10,"width":456,"var":"headImg","skin":"ui/dialog/head/101.png","height":456}},{"type":"Image","props":{"y":104,"x":371,"width":284,"var":"nameBgImg","skin":"ui/dialog/titlebg.png","height":63}},{"type":"Label","props":{"y":109,"x":408,"var":"nameTxt","text":"我是小顺流","fontSize":40,"color":"#fff6f6"}}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}