/**Created by the LayaAirIDE,do not modify.*/
package ui.guide {
	import laya.ui.*;
	import laya.display.*; 

	public class UpgradeRewardItemUI extends View {
		public var icon:Image;
		public var nameLabel:Label;
		public var contentLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1046,"height":216},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1046,"skin":"common/surface/common_bg_5.png","height":216,"sizeGrid":"6,6,6,6"}},{"type":"Image","props":{"y":0,"x":0,"width":1046,"skin":"common/surface/common_bg_partition.png","sizeGrid":"5,0,5,0","height":216}},{"type":"Image","props":{"y":30,"x":28,"skin":"common/surface/frame_purple.png"}},{"type":"Image","props":{"y":40,"x":37,"width":138,"var":"icon","skin":"ui/goods/i25027.jpg","height":138}},{"type":"Label","props":{"y":39,"x":242,"width":340,"var":"nameLabel","text":"1.新功能开启","height":32,"fontSize":32,"font":"Microsoft YaHei","color":"#ffffff"}},{"type":"Label","props":{"y":89,"x":242,"wordWrap":true,"width":779,"var":"contentLabel","text":"新功能描述...............................","height":107,"fontSize":32,"font":"Microsoft YaHei","color":"#ffffff"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}