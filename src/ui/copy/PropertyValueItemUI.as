/**Created by the LayaAirIDE,do not modify.*/
package ui.copy {
	import laya.ui.*;
	import laya.display.*; 

	public class PropertyValueItemUI extends View {
		public var bg:Image;
		public var nameLabel:Label;
		public var valueLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":250,"height":50},"child":[{"type":"Image","props":{"y":0,"x":0,"width":120,"var":"bg","skin":"common/surface/common_bg_4.png","height":50,"sizeGrid":"2,2,2,2"}},{"type":"Label","props":{"y":4,"x":2,"width":117,"var":"nameLabel","text":"亲和力","height":43,"fontSize":28,"color":"#feffec","align":"center"}},{"type":"Label","props":{"y":4,"x":126,"width":117,"var":"valueLabel","text":"100","height":43,"fontSize":28,"color":"#000000","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}