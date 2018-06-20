/**Created by the LayaAirIDE,do not modify.*/
package ui.main {
	import laya.ui.*;
	import laya.display.*; 

	public class MyHomeUI extends View {
		public var mapPart:Sprite;
		public var upPart:Box;
		public var headBox:Box;
		public var headIcon:Image;
		public var topBg:Image;
		public var levelTxt:Label;
		public var nameLabel:Label;
		public var downPart:Box;
		public var btnOut:Image;
		public var rightBtnList:List;
		public var leftBtnList:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Sprite","props":{"var":"mapPart"}},{"type":"Box","props":{"y":0,"x":0,"width":1080,"var":"upPart","height":192},"child":[{"type":"Box","props":{"y":40,"x":10,"width":349,"var":"headBox","height":192},"child":[{"type":"Image","props":{"y":13,"x":14,"width":208,"var":"headIcon","skin":"surface/touxiangdi.png","height":209}},{"type":"Image","props":{"y":0,"x":0,"width":236,"var":"topBg","skin":"surface/touxiangjindutiao.png","height":235}},{"type":"Image","props":{"y":0,"x":0,"skin":"surface/dengjidi.png"},"child":[{"type":"Label","props":{"y":18,"x":7,"wordWrap":true,"width":48,"var":"levelTxt","text":"99","height":28,"fontSize":28,"font":"Arial","color":"#f1fdfd","align":"center"}}]},{"type":"Image","props":{"y":212,"x":20,"width":193,"skin":"surface/iconditiao.png","height":56},"child":[{"type":"Label","props":{"y":12,"x":-10,"width":214,"var":"nameLabel","text":"李泽言","height":32,"fontSize":32,"font":"Arial","color":"#f1fdfd","align":"center"}}]}]}]},{"type":"Box","props":{"y":1465,"x":0,"width":1080,"var":"downPart","height":455},"child":[{"type":"Image","props":{"y":0,"x":648,"width":432,"var":"btnOut","skin":"button/btn_kais.png","height":455}}]},{"type":"List","props":{"y":146,"x":947,"var":"rightBtnList","spaceY":5,"repeatX":1}},{"type":"List","props":{"y":1202,"x":30,"var":"leftBtnList","spaceY":5,"repeatX":1}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}