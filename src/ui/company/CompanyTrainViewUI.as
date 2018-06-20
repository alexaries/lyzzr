/**Created by the LayaAirIDE,do not modify.*/
package ui.company {
	import laya.ui.*;
	import laya.display.*; 

	public class CompanyTrainViewUI extends View {
		public var closeBtn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":-110,"width":1300,"skin":"ui/bgImg/1022.png","height":1920}},{"type":"Button","props":{"y":0,"x":0,"var":"closeBtn","stateNum":1,"skin":"common/button/btn_back.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}