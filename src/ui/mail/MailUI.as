/**Created by the LayaAirIDE,do not modify.*/
package ui.mail {
	import laya.ui.*;
	import laya.display.*; 
	import ui.mail.icon.MailItemUI;

	public class MailUI extends View {
		public var maillist:Box;
		public var friendList:Box;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1960},"child":[{"type":"Image","props":{"y":336,"x":52,"width":975,"skin":"common/surface/common_bg_3.png","sizeGrid":"3,4,4,3","height":1372,"alpha":0.7}},{"type":"Label","props":{"y":331,"x":495,"text":"邮箱","fontSize":44,"color":"#ffffff"}},{"type":"Tab","props":{"y":423,"x":343,"width":376,"pivotY":-2,"pivotX":-2,"height":94},"child":[{"type":"Button","props":{"y":4,"x":0,"stateNum":2,"skin":"common/button/btn_b_1.png","label":"系统邮件"}},{"type":"Button","props":{"y":0,"x":191,"stateNum":2,"skin":"common/button/btn_b_1.png","label":"好友邮件"}}]},{"type":"Box","props":{"y":511,"x":54,"var":"maillist"},"child":[{"type":"MailItem","props":{"y":0,"x":0,"runtime":"ui.mail.icon.MailItemUI"}}]},{"type":"Box","props":{"var":"friendList"}}]};
		override protected function createChildren():void {
			View.regComponent("ui.mail.icon.MailItemUI",MailItemUI);
			super.createChildren();
			createView(uiView);

		}

	}
}