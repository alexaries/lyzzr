/**Created by the LayaAirIDE,do not modify.*/
package ui.main {
	import laya.ui.*;
	import laya.display.*; 

	public class MoneyViewUI extends View {
		public var tiIcon:Image;
		public var tiBtn:Button;
		public var tiLabel:Label;
		public var jinIcon:Image;
		public var jinBtn:Button;
		public var jinLabel:Label;
		public var zuanIcon:Image;
		public var zuanBtn:Button;
		public var zuanLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":731,"height":49},"child":[{"type":"Image","props":{"y":0,"x":-1,"width":242,"skin":"main/bg_num.png","sizeGrid":"0,25,0,25","height":49},"child":[{"type":"Image","props":{"y":4,"x":3,"width":40,"var":"tiIcon","skin":"common/icon/stone.png","height":40}},{"type":"Button","props":{"y":3,"x":191,"width":44,"var":"tiBtn","stateNum":1,"skin":"common/button/img_plus_2.png","height":44}},{"type":"Label","props":{"y":7,"x":46,"width":150,"var":"tiLabel","text":"60/60","height":28,"fontSize":28,"font":"Microsoft YaHei","color":"#feffec","align":"center"}}]},{"type":"Image","props":{"y":0,"x":244,"width":242,"skin":"main/bg_num.png","sizeGrid":"0,25,0,25","height":49},"child":[{"type":"Image","props":{"y":4,"x":3,"width":40,"var":"jinIcon","skin":"common/icon/silver.png","height":40}},{"type":"Button","props":{"y":3,"x":191,"width":44,"var":"jinBtn","stateNum":1,"skin":"common/button/img_plus_2.png","height":44}},{"type":"Label","props":{"y":7,"x":46,"width":150,"var":"jinLabel","text":"10000","height":28,"fontSize":28,"font":"Microsoft YaHei","color":"#feffec","align":"center"}}]},{"type":"Image","props":{"y":0,"x":489,"width":242,"skin":"main/bg_num.png","sizeGrid":"0,25,0,25","height":49},"child":[{"type":"Image","props":{"y":4,"x":3,"width":40,"var":"zuanIcon","skin":"common/icon/gift.png","height":40}},{"type":"Button","props":{"y":3,"x":191,"width":44,"var":"zuanBtn","stateNum":1,"skin":"common/button/img_plus_2.png","height":44}},{"type":"Label","props":{"y":7,"x":46,"width":150,"var":"zuanLabel","text":"10000","height":28,"fontSize":28,"font":"Microsoft YaHei","color":"#feffec","align":"center"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}