/**Created by the LayaAirIDE,do not modify.*/
package ui.main.icons {
	import laya.ui.*;
	import laya.display.*; 
	import ui.main.icons.BaseIconViewUI;

	public class ActivityIconListUI extends View {
		public var bg:Image;
		public var icons:List;
		public var turnBtn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":161},"child":[{"type":"Image","props":{"y":0,"x":1080,"width":161,"var":"bg","skin":"main/mask_black.png","rotation":90,"height":1080}},{"type":"List","props":{"y":0,"x":0,"width":1023,"var":"icons","spaceX":15,"height":161},"child":[{"type":"HScrollBar","props":{"touchScrollEnable":false,"name":"scrollBar","mouseEnabled":true}},{"type":"BaseIconView","props":{"renderType":"render","runtime":"ui.main.icons.BaseIconViewUI"}}]},{"type":"Button","props":{"y":74,"x":1055,"var":"turnBtn","stateNum":2,"skin":"main/btn_arrow_left.png","skewY":180,"pivotY":36,"pivotX":25}}]};
		override protected function createChildren():void {
			View.regComponent("ui.main.icons.BaseIconViewUI",BaseIconViewUI);
			super.createChildren();
			createView(uiView);

		}

	}
}