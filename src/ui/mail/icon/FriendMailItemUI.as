/**Created by the LayaAirIDE,do not modify.*/
package ui.mail.icon {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class FriendMailItemUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":900,"height":140},"child":[{"type":"Image","props":{"y":13,"x":22,"width":103,"skin":"main/bg_function_icon.png","height":103}},{"type":"Text","props":{"y":18,"x":134,"text":"我的名字叫顺流","fontSize":28}},{"type":"Text","props":{"y":69,"x":152,"text":"爱心体力","fontSize":25,"color":"#fb6361"}},{"type":"Text","props":{"y":20,"x":413,"text":"01天46分钟02秒前","fontSize":24}},{"type":"Button","props":{"y":12,"x":701,"stateNum":2,"skin":"common/button/btn_b_1.png","label":"领取"}},{"type":"Image","props":{"y":119,"x":22,"width":870,"skin":"common/surface/partition_line_1.png","sizeGrid":"3,13,3,12","height":12}}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}