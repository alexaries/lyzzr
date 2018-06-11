/**Created by the LayaAirIDE,do not modify.*/
package ui.login {
	import laya.ui.*;
	import laya.display.*; 
	import laya.html.dom.HTMLDivElement;

	public class LoginNoticeUI extends View {
		public var closeBtn:Button;
		public var msgPanel:Panel;
		public var msgHtml:HTMLDivElement;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":-110,"width":1300,"skin":"module/login/tip_mask.png","height":1920}},{"type":"Image","props":{"y":441,"x":10,"width":1060,"skin":"module/login/common_bg.png","height":837,"sizeGrid":"2,2,2,2"}},{"type":"Image","props":{"y":440,"x":10,"width":1060,"skin":"module/login/top_title_bar_2.png","height":141}},{"type":"Image","props":{"y":543,"x":14,"width":1052,"skin":"module/login/mask_yellow.png","height":67}},{"type":"Button","props":{"y":443,"x":900,"var":"closeBtn","stateNum":1,"skin":"module/login/close.png"}},{"type":"Image","props":{"y":431,"x":10,"width":1060,"skin":"module/login/border_up_down.png","height":861,"sizeGrid":"25,0,25,0"}},{"type":"Image","props":{"y":441,"x":10,"width":1060,"skin":"module/login/border_left_right.png","sizeGrid":"10,60,10,60","height":841}},{"type":"Label","props":{"y":451,"x":428,"text":"游戏公告","fontSize":56,"font":"Microsoft YaHei","color":"#d9d5c5","bold":false}},{"type":"Label","props":{"y":549,"x":340,"text":"蜀山传奇，有你更精彩","fontSize":40,"font":"Microsoft YaHei","color":"#feffec","bold":false}},{"type":"Panel","props":{"y":621,"x":34,"width":1016,"var":"msgPanel","height":634},"child":[{"type":"HTMLDivElement","props":{"y":0,"x":0,"wordWrap":true,"width":1016,"var":"msgHtml","height":234,"fontSize":40,"font":"Microsoft YaHei","color":"#feffec","bold":false}}]}]};
		override protected function createChildren():void {
			View.regComponent("HTMLDivElement",HTMLDivElement);
			super.createChildren();
			createView(uiView);

		}

	}
}