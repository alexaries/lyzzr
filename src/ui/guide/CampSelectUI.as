/**Created by the LayaAirIDE,do not modify.*/
package ui.guide {
	import laya.ui.*;
	import laya.display.*; 

	public class CampSelectUI extends View {
		public var emBtn:Button;
		public var klBtn:Button;
		public var emIcon:Image;
		public var klIcon:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":-110,"skin":"module/guide/camp_select.jpg"}},{"type":"Button","props":{"y":1700,"x":566,"width":345,"var":"emBtn","stateNum":1,"skin":"common/button/img_yellow_royal.png","labelSize":48,"labelPadding":"-10","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"加入正道","height":105}},{"type":"Button","props":{"y":1700,"x":178,"width":345,"var":"klBtn","stateNum":1,"skin":"common/button/img_yellow_royal.png","labelSize":48,"labelPadding":"-10","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"加入魔宗","height":105}},{"type":"Image","props":{"y":544,"x":623,"var":"emIcon","skin":"common/icon/5.png"}},{"type":"Image","props":{"y":1294,"x":304,"var":"klIcon","skin":"common/icon/5.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}