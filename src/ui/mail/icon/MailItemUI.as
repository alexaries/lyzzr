/**Created by the LayaAirIDE,do not modify.*/
package ui.mail.icon {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class MailItemUI extends View {
		public var titleTxt:Text;
		public var timeTxt:Text;
		public var fromTxt:Text;
		public var getBtn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":140},"child":[{"type":"Image","props":{"y":-1,"x":35,"skin":"common/icon/card_1.png"}},{"type":"Text","props":{"y":7,"x":100,"width":240,"var":"titleTxt","text":"邮件标题邮件标题","height":46,"color":"#080808"}},{"type":"Text","props":{"y":62,"x":53,"width":480,"var":"timeTxt","text":"到期时间：10月10日 23：22：22","height":46,"color":"#080808"}},{"type":"Text","props":{"y":5,"x":470,"width":269,"var":"fromTxt","text":"来自：中华人民共和国","height":35,"fontSize":24,"color":"#080808"}},{"type":"Image","props":{"y":121,"x":44,"width":880,"skin":"common/surface/partition_line_2.png","sizeGrid":"0,20,0,17","height":14}},{"type":"Button","props":{"y":15,"x":729,"var":"getBtn","stateNum":2,"skin":"common/button/btn_b_1.png","label":"查看"}}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}