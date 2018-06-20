/**Created by the LayaAirIDE,do not modify.*/
package ui.company {
	import laya.ui.*;
	import laya.display.*; 

	public class CompanyExpertItemUI extends View {
		public var icon:Image;
		public var nameLabel:Label;
		public var levelLabel:Label;
		public var propertyLabel:Label;
		public var list:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":320,"height":678},"child":[{"type":"Image","props":{"y":78,"x":0,"width":320,"skin":"common/surface/common_bg_3.png","sizeGrid":"1,1,1,1","height":600}},{"type":"Image","props":{"y":0,"x":0,"width":320,"var":"icon","skin":"ui/dialog/head/101.png","height":401}},{"type":"Label","props":{"y":413,"x":55,"width":209,"var":"nameLabel","text":"泰森娜","height":32,"fontSize":32,"font":"Arial","color":"#000000","align":"center"}},{"type":"Image","props":{"y":463,"x":18,"width":284,"skin":"common/surface/partition_line_2.png","sizeGrid":"0,12,0,12","height":14}},{"type":"Label","props":{"y":430,"x":247,"width":71,"var":"levelLabel","text":"lv.1","height":24,"fontSize":24,"font":"Arial","color":"#ff56cf","align":"left"}},{"type":"Label","props":{"y":483,"x":0,"width":320,"var":"propertyLabel","text":"综艺 / 纪录片","height":28,"fontSize":28,"font":"Arial","color":"#000000","align":"center"}},{"type":"List","props":{"y":530,"x":21,"width":278,"var":"list","height":74}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}