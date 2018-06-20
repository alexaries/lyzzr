/**Created by the LayaAirIDE,do not modify.*/
package ui.jipan {
	import laya.ui.*;
	import laya.display.*; 

	public class JiPanItemUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":300,"height":400},"child":[{"type":"Image","props":{"y":0,"x":0,"width":300,"skin":"ui/cards/10500.png","height":300}},{"type":"Label","props":{"y":308,"x":43,"text":"白旗。星空之物","fontSize":35,"color":"#030303"}},{"type":"Label","props":{"y":355,"x":76,"text":"已拥有：1","fontSize":35,"color":"#030303"}},{"type":"Label","props":{"y":253,"x":209,"text":"lv.30","fontSize":35,"color":"#f9f9f9"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}