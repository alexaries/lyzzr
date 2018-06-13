/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class BattleCommentItemUI extends View {
		public var icon:Image;
		public var nameLabel:Label;
		public var contentLabel:Label;
		public var zanLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":250},"child":[{"type":"Image","props":{"y":13,"x":40,"width":87,"var":"icon","skin":"ui/card/11500.png/11500.png","height":87}},{"type":"Label","props":{"y":39,"x":159,"width":217,"var":"nameLabel","text":"小小强@11","height":30,"fontSize":28,"font":"Microsoft YaHei","color":"#000000","align":"left"}},{"type":"Label","props":{"y":116,"x":159,"width":882,"var":"contentLabel","text":"制作组这样做和抓一只企鹅烤了吃有什么区别","height":36,"fontSize":36,"font":"Microsoft YaHei","color":"#000000","align":"left"}},{"type":"Image","props":{"y":37,"x":735,"skin":"common/surface/img_upArrow.png"}},{"type":"Label","props":{"y":39,"x":769,"width":128,"var":"zanLabel","text":"1.9万","height":30,"fontSize":28,"font":"Microsoft YaHei","color":"#000000","align":"left"}},{"type":"Image","props":{"y":42,"x":919,"skin":"common/surface/img_redpoint.png"}},{"type":"Image","props":{"y":233,"x":159,"width":862,"skin":"common/surface/partition_line_1.png","sizeGrid":"3,13,3,12"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}