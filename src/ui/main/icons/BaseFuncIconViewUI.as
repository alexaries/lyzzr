/**Created by the LayaAirIDE,do not modify.*/
package ui.main.icons {
	import laya.ui.*;
	import laya.display.*; 

	public class BaseFuncIconViewUI extends View {
		public var icon:Image;
		public var bg:Image;
		public var nameLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":196,"height":219},"child":[{"type":"Image","props":{"y":0,"x":5,"width":186,"skin":"surface/icondi.png","height":186}},{"type":"Image","props":{"y":0,"x":0,"var":"icon","skin":"icon/icon_meirirenwu.png"}},{"type":"Image","props":{"y":163,"x":0,"width":193,"var":"bg","skin":"surface/iconditiao.png","height":56}},{"type":"Label","props":{"y":172,"x":0,"width":196,"var":"nameLabel","text":"精彩活动","height":32,"fontSize":32,"font":"Arial","color":"#f1fdfd","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}