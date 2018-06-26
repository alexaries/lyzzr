/**Created by the LayaAirIDE,do not modify.*/
package ui.copy {
	import laya.ui.*;
	import laya.display.*; 

	public class CopyMopItemUI extends View {
		public var indexLabel:Label;
		public var expLabel:Label;
		public var list:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":360},"child":[{"type":"Label","props":{"y":0,"x":50,"var":"indexLabel","text":"第1次————————————公司经验：","fontSize":36}},{"type":"Label","props":{"y":0,"x":760,"width":156,"var":"expLabel","text":"+300","height":36,"fontSize":36,"align":"center"}},{"type":"Image","props":{"y":0,"x":934,"width":96,"skin":"surface/iconditiao2.png","height":36}},{"type":"List","props":{"y":70,"x":82,"width":916,"var":"list","height":242}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}