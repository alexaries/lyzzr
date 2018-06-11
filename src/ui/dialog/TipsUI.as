/**Created by the LayaAirIDE,do not modify.*/
package ui.dialog {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;
	import laya.html.dom.HTMLDivElement;

	public class TipsUI extends View {
		public var bg:Image;
		public var frame:Image;
		public var content:Text;
		public var contentHtml:HTMLDivElement;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":500,"height":500},"child":[{"type":"Image","props":{"y":0,"x":0,"width":500,"var":"bg","skin":"common/surface/tip_mask.png","height":500,"sizeGrid":"4,4,4,4"}},{"type":"Image","props":{"y":0,"x":0,"width":500,"var":"frame","skin":"common/surface/frame_selected_2.png","height":500,"sizeGrid":"20,20,20,20"}},{"type":"Text","props":{"y":7,"x":10,"var":"content","valign":"top","text":"text","fontSize":32,"font":"Microsoft YaHei","color":"#ffeb0a"}},{"type":"HTMLDivElement","props":{"y":7,"x":10,"width":100,"var":"contentHtml","innerHTML":"htmlText","height":100}}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			View.regComponent("HTMLDivElement",HTMLDivElement);
			super.createChildren();
			createView(uiView);

		}

	}
}