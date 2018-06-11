/**Created by the LayaAirIDE,do not modify.*/
package ui.login {
	import laya.ui.*;
	import laya.display.*; 

	public class LoginRecommandItemUI extends View {
		public var areaLabel:Label;
		public var nameLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":860,"height":73},"child":[{"type":"Image","props":{"y":0,"x":0,"width":860,"skin":"module/login/tuijianliangbianxumengban.png","sizeGrid":"0,30,0,30","height":73}},{"type":"Image","props":{"y":17,"x":62,"skin":"module/login/lanlingxing.png"}},{"type":"Image","props":{"y":6,"x":131,"skin":"module/login/honghuobao.png"}},{"type":"Image","props":{"y":17,"x":757,"skin":"module/login/lanlingxing.png"}},{"type":"Image","props":{"y":1,"x":569,"skin":"module/login/xinfu.png"}},{"type":"Image","props":{"y":1,"x":654,"skin":"module/login/tuijian.png"}},{"type":"Label","props":{"y":11,"x":219,"width":148,"var":"areaLabel","text":"正在获取请稍候... ...","height":36,"fontSize":36,"font":"Microsoft YaHei","color":"#ffffff"}},{"type":"Label","props":{"y":11,"x":379,"width":191,"var":"nameLabel","height":36,"fontSize":36,"font":"Microsoft YaHei","color":"#ffffff"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}