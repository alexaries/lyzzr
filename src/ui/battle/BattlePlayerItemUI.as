/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class BattlePlayerItemUI extends View {
		public var empty:Box;
		public var info:Box;
		public var bg:Image;
		public var icon:Image;
		public var styleIcon:Image;
		public var levelLabel:Label;
		public var starBar:ProgressBar;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":250,"height":250},"child":[{"type":"Box","props":{"width":250,"var":"empty","height":250},"child":[{"type":"Image","props":{"y":0,"x":0,"width":250,"skin":"common/surface/slot.png","sizeGrid":"6,6,6,6","height":250}}]},{"type":"Box","props":{"y":0,"x":0,"width":250,"var":"info","height":250},"child":[{"type":"Image","props":{"y":0,"x":0,"width":250,"var":"bg","skin":"common/surface/frame_blue.png","height":250}},{"type":"Image","props":{"y":12,"x":12,"width":225,"var":"icon","skin":"ui/card/10100_10101_10190.png/10100_10101_10190.png","height":225}},{"type":"Image","props":{"y":9,"x":9,"skin":"common/surface/corner_purple_circle.png"}},{"type":"Image","props":{"y":12,"x":12,"width":44,"var":"styleIcon","skin":"common/surface/img_redpoint.png","height":44}},{"type":"Image","props":{"y":195,"x":12,"width":226,"skin":"common/surface/bg_skill_name.png","height":43}},{"type":"Label","props":{"y":199,"x":8,"width":42,"var":"levelLabel","text":"Lv.\\n100","height":36,"fontSize":16,"color":"#ffffff","align":"center"}},{"type":"ProgressBar","props":{"y":206,"x":56,"width":178,"var":"starBar","value":0.2,"skin":"common/surface/progress_green.png","height":26,"sizeGrid":"2,2,2,2"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}