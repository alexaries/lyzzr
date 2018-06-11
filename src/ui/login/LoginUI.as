/**Created by the LayaAirIDE,do not modify.*/
package ui.login {
	import laya.ui.*;
	import laya.display.*; 

	public class LoginUI extends View {
		public var loginBtn:Image;
		public var pc:Sprite;
		public var combox:ComboBox;
		public var inputId:TextInput;
		public var patform:Sprite;
		public var changeBtn:Button;
		public var stateIcon:Image;
		public var areaLabel:Label;
		public var nameLabel:Label;
		public var stateLabel:Label;
		public var panel:Panel;
		public var list:List;
		public var container:Sprite;
		public var notice:Sprite;
		public var noticeLabel:Label;
		public var touch:Image;
		public var playerList:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"y":0,"x":0,"width":1080,"name":"denglu","height":1920},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1080,"var":"loginBtn","skin":"module/login/loginbg.png","height":1920}},{"type":"Image","props":{"y":1837,"x":0,"width":1080,"skin":"module/login/common_bg_4.png","sizeGrid":"2,2,2,2","height":83}},{"type":"Label","props":{"y":1843,"x":134,"wordWrap":true,"width":812,"text":"抵制不良游戏，拒绝盗版游戏，注意自我保护，谨防受骗上当适度游戏益脑，沉迷游戏伤身，合理安排时间，享受健康生活","height":60,"fontSize":30,"font":"Microsoft YaHei","color":"#bebebe","align":"left"}},{"type":"Sprite","props":{"width":0,"var":"pc"},"child":[{"type":"Label","props":{"y":1366,"x":74,"text":"服务器:","fontSize":32,"font":"Microsoft YaHei","color":"#000000"}},{"type":"ComboBox","props":{"y":1345,"x":218,"width":632,"var":"combox","skin":"module/login/tuijianliangbianxumengban.png","sizeGrid":"0,62,0,24","selectedIndex":0,"labels":"192.168.75.108:5601,192.168.72.61:5601,ssh5-tcp.gm.kingnet.com:5601,192.168.72.61:5602","labelSize":36,"itemSize":40,"height":86}},{"type":"TextInput","props":{"y":1467,"x":218,"width":632,"var":"inputId","type":"number","skin":"module/login/tuijianliangbianxumengban.png","padding":"-6","height":76,"fontSize":36,"font":"Microsoft YaHei","align":"left"}},{"type":"Label","props":{"y":1484,"x":106,"text":"用户:","fontSize":32,"font":"Microsoft YaHei","color":"#000000"}},{"type":"Label","props":{"y":1543,"x":100,"width":629,"text":"用户名为任意正整数！！！","height":32,"fontSize":32,"font":"Microsoft YaHei","color":"#f80a06"}}]},{"type":"Sprite","props":{"width":0,"var":"patform","height":0},"child":[{"type":"Button","props":{"y":1430,"x":55,"var":"changeBtn","stateNum":1,"skin":"module/login/heiyunwen.png"}},{"type":"Image","props":{"y":1456,"x":69,"var":"stateIcon","skin":"module/login/lvzuijin.png"}},{"type":"Label","props":{"y":1460,"x":149,"width":196,"var":"areaLabel","height":40,"fontSize":40,"font":"Microsoft YaHei","color":"#feffec"}},{"type":"Label","props":{"y":1460,"x":339,"width":196,"var":"nameLabel","height":40,"fontSize":40,"font":"Microsoft YaHei","color":"#feffec"}},{"type":"Label","props":{"y":1460,"x":549,"width":196,"var":"stateLabel","height":40,"fontSize":40,"font":"Microsoft YaHei","color":"#ff001e"}},{"type":"Label","props":{"y":1449,"x":777,"width":242,"text":"点击换区","labelSize":40,"labelPadding":"0","labelFont":"Microsoft YaHei","labelColors":"#7ef14c","label":"点击换区","height":76,"fontSize":48,"font":"Microsoft YaHei","color":"#7ef14c","align":"center"}},{"type":"Panel","props":{"y":1312,"x":110,"width":860,"var":"panel","height":73},"child":[{"type":"List","props":{"width":860,"var":"list","height":73}}]}]},{"type":"Sprite","props":{"width":0,"var":"container","height":0}},{"type":"Sprite","props":{"y":900,"x":15,"width":0,"var":"notice","height":0},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1049,"skin":"module/login/tuijianliangbianxumengban.png","sizeGrid":"0,0,0,0","height":120}},{"type":"Label","props":{"y":25,"x":165,"width":719,"var":"noticeLabel","text":"正在努力进入游戏 请稍后... ...","height":48,"fontSize":48,"font":"Microsoft YaHei","color":"#feffec","align":"center"}}]},{"type":"Image","props":{"y":1017,"x":243,"width":593,"var":"touch","stateNum":1,"skin":"module/login/touch.png","labelSize":40,"labelPadding":"-7","labelFont":"Microsoft YaHei","labelColors":"#ffffff,##8e8e8e","height":48}},{"type":"List","props":{"y":1136,"x":373,"width":334,"var":"playerList","height":167}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}