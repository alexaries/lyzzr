/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class BattlePlayerSelectItemUI extends View {
		public var bg:Image;
		public var icon:Image;
		public var styleIcon:Image;
		public var levelLabel:Label;
		public var starBar:ProgressBar;
		public var nameLabel:Label;
		public var check:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":240,"height":290},"child":[{"type":"Image","props":{"y":0,"x":0,"width":240,"var":"bg","skin":"common/surface/frame_blue.png","height":240}},{"type":"Image","props":{"y":12,"x":12,"width":215,"var":"icon","skin":"ui/card/10100_10101_10190.png/10100_10101_10190.png","height":215}},{"type":"Image","props":{"y":9,"x":9,"skin":"common/surface/corner_purple_circle.png"}},{"type":"Image","props":{"y":12,"x":12,"width":44,"var":"styleIcon","skin":"common/surface/img_redpoint.png","height":44}},{"type":"Image","props":{"y":188,"x":12,"width":215,"skin":"common/surface/bg_skill_name.png","height":43}},{"type":"Label","props":{"y":192,"x":8,"width":42,"var":"levelLabel","text":"Lv.\\n100","height":36,"fontSize":16,"color":"#ffffff","align":"center"}},{"type":"ProgressBar","props":{"y":199,"x":56,"width":178,"var":"starBar","value":0.2,"skin":"common/surface/progress_green.png","height":26,"sizeGrid":"2,2,2,2"}},{"type":"Label","props":{"y":244,"x":13,"width":213,"var":"nameLabel","text":"许默.点点荧光","height":24,"fontSize":24,"color":"#ffffff","align":"center"}},{"type":"Image","props":{"y":12,"x":185,"width":43,"var":"check","skin":"common/surface/img_upArrow.png","height":57}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}