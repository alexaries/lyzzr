/**Created by the LayaAirIDE,do not modify.*/
package ui.login {
	import laya.ui.*;
	import laya.display.*; 

	public class LoginServerUI extends View {
		public var bg:Image;
		public var selectTab:Tab;
		public var panel:Panel;
		public var list:List;
		public var noticeBtn:Button;
		public var container:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":-110,"width":1300,"var":"bg","skin":"module/login/tip_mask.png","sizeGrid":"2,2,2,2","height":1920}},{"type":"Image","props":{"y":423,"x":63,"width":954,"skin":"module/login/common_bg_4.png","height":1074,"sizeGrid":"2,2,2,2"}},{"type":"Image","props":{"y":412,"x":70,"width":940,"skin":"module/login/border_up_down.png","height":1096,"sizeGrid":"25,0,25,0"}},{"type":"Image","props":{"y":422,"x":61,"width":958,"skin":"module/login/border_left_right.png","sizeGrid":"10,50,10,50","height":1076}},{"type":"Tab","props":{"y":439,"x":76,"var":"selectTab"},"child":[{"type":"Button","props":{"stateNum":2,"skin":"module/login/commonbtn.png","name":"item0","labelSize":36,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#336699,#ffffff","label":"全部服务器"}},{"type":"Button","props":{"x":346,"stateNum":2,"skin":"module/login/commonbtn.png","name":"item1","labelSize":36,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#336699,#ffffff","label":"历史服务器"}}]},{"type":"Panel","props":{"y":552,"x":84,"width":921,"var":"panel","height":924},"child":[{"type":"List","props":{"width":921,"var":"list","height":924}}]},{"type":"Image","props":{"y":536,"x":73,"width":934,"skin":"module/login/partition_line_1.png","height":12,"sizeGrid":"0,13,0,13"}},{"type":"Button","props":{"y":20,"x":953,"var":"noticeBtn","stateNum":1,"skin":"module/login/notice.png"}},{"type":"Sprite","props":{"var":"container"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}