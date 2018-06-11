/**Created by the LayaAirIDE,do not modify.*/
package ui.login {
	import laya.ui.*;
	import laya.display.*; 

	public class LoginServerItemUI extends View {
		public var enterBtn:Button;
		public var server:Sprite;
		public var newIcon:Image;
		public var stateIcon:Image;
		public var areaLabel:Label;
		public var nameLabel:Label;
		public var stateLabel:Label;
		public var recommandIcon:Image;
		public var history:Sprite;
		public var hnameLabel:Label;
		public var hlevelLabel:Label;
		public var htimeLabel:Label;
		public var hcareerLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":457,"height":135},"child":[{"type":"Button","props":{"y":0,"x":0,"var":"enterBtn","stateNum":2,"skin":"module/login/xuanqubtn.png"}},{"type":"Sprite","props":{"var":"server"},"child":[{"type":"Image","props":{"y":-7,"x":359,"var":"newIcon","skin":"module/login/xinfu.png"}},{"type":"Image","props":{"y":37,"x":15,"var":"stateIcon","skin":"module/login/lvzuijin.png"}},{"type":"Label","props":{"y":44,"x":88,"width":132,"var":"areaLabel","text":"1区","height":36,"fontSize":32,"font":"Microsoft YaHei","color":"#ffffff"}},{"type":"Label","props":{"y":44,"x":224,"width":132,"var":"nameLabel","text":"恋与制作","height":36,"fontSize":32,"font":"Microsoft YaHei","color":"#ffffff"}},{"type":"Label","props":{"y":44,"x":365,"width":85,"var":"stateLabel","text":"正常","height":36,"fontSize":32,"font":"Microsoft YaHei","color":"#ffd236","align":"center"}},{"type":"Image","props":{"y":-7,"x":269,"var":"recommandIcon","skin":"module/login/tuijian.png"}}]},{"type":"Sprite","props":{"var":"history"},"child":[{"type":"Label","props":{"y":23,"x":15,"width":200,"var":"hnameLabel","text":"角色名字六子","height":36,"fontSize":32,"font":"Microsoft YaHei","color":"#ffffff"}},{"type":"Label","props":{"y":23,"x":245,"width":115,"var":"hlevelLabel","text":"Lv:0","height":36,"fontSize":32,"font":"Microsoft YaHei","color":"#ffffff"}},{"type":"Label","props":{"y":70,"x":10,"width":465,"var":"htimeLabel","text":"登录日期:1970-1-1","height":36,"fontSize":32,"font":"Microsoft YaHei","color":"#ff0014","align":"left"}},{"type":"Label","props":{"y":23,"x":375,"width":67,"var":"hcareerLabel","text":"道","height":36,"fontSize":32,"font":"Microsoft YaHei","color":"#ffffff"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}