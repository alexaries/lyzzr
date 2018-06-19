/**Created by the LayaAirIDE,do not modify.*/
package ui.company {
	import laya.ui.*;
	import laya.display.*; 

	public class CompanyDepartItemUI extends View {
		public var nameLabel:Label;
		public var levelLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":210,"height":210},"child":[{"type":"Image","props":{"y":0,"x":0,"width":210,"skin":"main/bg_function_icon.png","height":210}},{"type":"Label","props":{"y":60,"x":18,"width":173,"var":"nameLabel","text":"品牌部","height":36,"fontSize":36,"font":"Arial","color":"#feffec","align":"center"}},{"type":"Label","props":{"y":110,"x":18,"width":173,"var":"levelLabel","text":"LV.0","height":36,"fontSize":36,"font":"Arial","color":"#feffec","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}