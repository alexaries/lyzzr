/**Created by the LayaAirIDE,do not modify.*/
package ui.company {
	import laya.ui.*;
	import laya.display.*; 

	public class CompanyCourseItemUI extends View {
		public var bg:Image;
		public var info:Box;
		public var nameLabel:Label;
		public var timeLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":215,"height":215},"child":[{"type":"Image","props":{"y":0,"x":0,"width":215,"var":"bg","skin":"surface/icondi.png","height":215}},{"type":"Box","props":{"var":"info"},"child":[{"type":"Image","props":{"width":215,"skin":"surface/dengjidi.png","height":215}},{"type":"Label","props":{"y":122,"x":16,"width":183,"var":"nameLabel","text":"镜头语言","height":32,"fontSize":32,"font":"Arial","color":"#000000","align":"center"}},{"type":"Label","props":{"y":62,"x":16,"width":183,"var":"timeLabel","text":"00:00","height":48,"fontSize":48,"font":"Arial","color":"#000000","align":"center"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}