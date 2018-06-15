/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class ExpertItemUI extends View {
		public var icon:Image;
		public var nameLabel:Label;
		public var levelLabel:Label;
		public var list:List;
		public var box:Box;
		public var check:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":570,"height":370},"child":[{"type":"Image","props":{"y":0,"x":0,"width":570,"skin":"comp/hscroll.png","height":370}},{"type":"Panel","props":{"y":0,"x":0,"width":100,"height":370},"child":[{"type":"Image","props":{"y":0,"x":0,"width":185,"var":"icon","skin":"ui/dialog/head/101.png","height":370}}]},{"type":"Label","props":{"y":24,"x":215,"width":140,"var":"nameLabel","text":"林萌萌","height":32,"fontSize":32,"font":"Arial","align":"center"}},{"type":"Label","props":{"y":34,"x":427,"width":123,"var":"levelLabel","text":"Lv.1","height":28,"fontSize":28,"font":"Arial","color":"#fb69a4"}},{"type":"Image","props":{"y":74,"x":135,"width":409,"skin":"common/surface/partition_line_1.png","height":12,"sizeGrid":"3,13,3,12"}},{"type":"Label","props":{"y":101,"x":141,"width":398,"text":"综艺 / 电视剧 / 广告","height":28,"fontSize":28,"font":"Arial","color":"#000000","align":"center"}},{"type":"List","props":{"y":136,"x":168,"width":347,"var":"list","height":149}},{"type":"Box","props":{"y":291,"x":155,"width":377,"var":"box","height":64}},{"type":"Image","props":{"y":200,"x":413,"var":"check","skin":"common/surface/img_lock.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}