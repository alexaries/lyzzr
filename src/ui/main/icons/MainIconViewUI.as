/**Created by the LayaAirIDE,do not modify.*/
package ui.main.icons {
	import laya.ui.*;
	import laya.display.*; 

	public class MainIconViewUI extends View {
		public var icon:Image;
		public var lockBox:Box;
		public var lock:Image;
		public var txtDesc:Label;
		public var redCon:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":135,"height":137},"child":[{"type":"Image","props":{"y":-3,"x":-13,"width":161,"var":"icon","height":143}},{"type":"Box","props":{"y":3,"x":16,"var":"lockBox"},"child":[{"type":"Image","props":{"x":3,"var":"lock","skin":"main/lock.png"}},{"type":"Label","props":{"y":32,"x":0,"width":103,"var":"txtDesc","text":"8级开启","height":32,"fontSize":24,"font":"Microsoft YaHei","color":"#feffec","align":"center"}}]},{"type":"Sprite","props":{"y":15,"x":96,"var":"redCon"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}