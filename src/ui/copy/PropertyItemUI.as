/**Created by the LayaAirIDE,do not modify.*/
package ui.copy {
	import laya.ui.*;
	import laya.display.*; 

	public class PropertyItemUI extends View {
		public var bg:Image;
		public var nameLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":120,"height":50},"child":[{"type":"Image","props":{"y":0,"x":0,"width":120,"var":"bg","skin":"common/surface/common_bg_4.png","height":50,"sizeGrid":"2,2,2,2"}},{"type":"Label","props":{"y":5,"x":0,"width":120,"var":"nameLabel","text":"综艺","height":28,"fontSize":28,"font":"Microsoft YaHei","color":"#ffffff","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}