/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 
	import laya.html.dom.HTMLDivElement;

	public class BattleFetterViewUI extends View {
		public var pre:Box;
		public var preIcon:Image;
		public var contentHtml:HTMLDivElement;
		public var prefetterBtn:Button;
		public var info:Box;
		public var sureBtn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1460},"child":[{"type":"Box","props":{"var":"pre"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1080,"skin":"common/surface/common_bg_3.png","height":960}},{"type":"Image","props":{"y":224,"x":220,"width":618,"var":"preIcon","skin":"ui/dialog/head/101.png","height":618}},{"type":"HTMLDivElement","props":{"y":84,"x":64,"width":952,"var":"contentHtml","innerHTML":"经历了一次又一次的艰难，我的双脚已经无法迈动。我的双眼已经不再清明。就在我无力挣扎即将放弃，失去亲和力和创造力的时候，心中突然闪过了他的影子......","height":274}},{"type":"Button","props":{"y":817,"x":180,"width":720,"var":"prefetterBtn","stateNum":2,"skin":"common/button/btn_r_1.png","sizeGrid":"0,18,0,18","labelSize":36,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"召唤羁绊","height":106}}]},{"type":"Box","props":{"y":0,"x":0,"var":"info"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1080,"skin":"common/surface/common_bg_3.png","height":850}},{"type":"Button","props":{"y":698,"x":180,"width":720,"var":"sureBtn","stateNum":2,"skin":"common/button/btn_r_1.png","sizeGrid":"0,18,0,18","labelSize":36,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"确定","height":106}}]}]};
		override protected function createChildren():void {
			View.regComponent("HTMLDivElement",HTMLDivElement);
			super.createChildren();
			createView(uiView);

		}

	}
}