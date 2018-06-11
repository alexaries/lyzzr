/**Created by the LayaAirIDE,do not modify.*/
package ui.guide {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class LevelUpRewardUI extends View {
		public var closeBtn:Image;
		public var list:List;
		public var levelTxt:Text;
		public var getBtn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":-110,"width":1300,"skin":"common/surface/common_bg_6.png","height":1920,"sizeGrid":"6,6,6,6"}},{"type":"Image","props":{"y":0,"x":-110,"width":1300,"var":"closeBtn","skin":"common/surface/common_bg_6.png","height":1920,"sizeGrid":"6,6,6,6"}},{"type":"Image","props":{"y":289,"x":-104,"width":1288,"skin":"module/onlinelevel/dengjizaixianbg.png","height":878},"child":[{"type":"Image","props":{"y":134,"x":520,"skin":"module/onlinelevel/dengjilibaobiaoti.png"}}]},{"type":"List","props":{"y":817,"x":1004,"width":960,"var":"list","pivotY":120,"pivotX":480,"height":240}},{"type":"Text","props":{"y":650,"x":579,"width":313,"var":"levelTxt","valign":"middle","text":"1","stroke":1,"height":26,"fontSize":26,"font":"Microsoft YaHei","color":"#ffd542","align":"left"}},{"type":"Button","props":{"y":950,"x":524,"var":"getBtn","stateNum":1,"skin":"common/button/img_yellow_royal.png","labelSize":36,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#ffffff,#7ef14c","labelAlign":"center","label":"领取奖励"}}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}