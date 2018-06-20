/**Created by the LayaAirIDE,do not modify.*/
package ui.main {
	import laya.ui.*;
	import laya.display.*; 

	public class MyHomeUI extends View {
		public var mapPart:Sprite;
		public var upPart:Box;
		public var headBox:Box;
		public var topBg:Image;
		public var headIcon:Image;
		public var levelTxt:Label;
		public var nameLabel:Label;
		public var moneyBox:Box;
		public var downPart:Box;
		public var btnOut:Image;
		public var rightBtnGroup:List;
		public var activityIconCollect:Sprite;
		public var activityContainer:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Sprite","props":{"var":"mapPart"}},{"type":"Box","props":{"y":0,"x":0,"width":1080,"var":"upPart","height":192},"child":[{"type":"Box","props":{"y":40,"x":10,"width":349,"var":"headBox","height":192},"child":[{"type":"Image","props":{"y":0,"x":0,"var":"topBg","skin":"surface/touxiangjindutiao.png"},"child":[{"type":"Image","props":{"y":2,"x":3,"width":230,"var":"headIcon","height":230}}]},{"type":"Image","props":{"y":0,"x":0,"skin":"surface/dengjidi.png"},"child":[{"type":"Label","props":{"y":18,"x":7,"wordWrap":true,"width":48,"var":"levelTxt","text":"99","height":28,"fontSize":28,"font":"Arial","color":"#f1fdfd","align":"center"}}]},{"type":"Image","props":{"y":212,"x":20,"width":193,"skin":"surface/iconditiao.png","height":56},"child":[{"type":"Label","props":{"y":12,"x":-10,"width":214,"var":"nameLabel","text":"李泽言","height":32,"fontSize":32,"font":"Arial","color":"#f1fdfd","align":"center"}}]}]},{"type":"Box","props":{"x":0,"width":1080,"var":"moneyBox","height":80}}]},{"type":"Box","props":{"y":1465,"x":0,"width":1080,"var":"downPart","height":455},"child":[{"type":"Image","props":{"y":0,"x":648,"width":432,"var":"btnOut","skin":"button/btn_kais.png","height":455}}]},{"type":"List","props":{"y":726,"x":947,"width":126,"var":"rightBtnGroup","spaceY":5,"repeatX":1},"child":[{"type":"VScrollBar","props":{"name":"scrollBar"}}]},{"type":"Sprite","props":{"y":195,"x":0,"var":"activityIconCollect"}},{"type":"Sprite","props":{"y":365,"x":0,"var":"activityContainer"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}