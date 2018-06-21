/**Created by the LayaAirIDE,do not modify.*/
package ui.main {
	import laya.ui.*;
	import laya.display.*; 

	public class GameMainUI extends View {
		public var map:Sprite;
		public var copy:Sprite;
		public var home:Sprite;
		public var btnOut:Image;
		public var rightBtnList:List;
		public var leftBtnList:List;
		public var win:Sprite;
		public var money:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"name":"zhujiemian","height":1920},"child":[{"type":"Sprite","props":{"y":0,"x":0,"var":"map"}},{"type":"Sprite","props":{"y":0,"x":0,"var":"copy"}},{"type":"Sprite","props":{"y":0,"x":0,"width":0,"var":"home","height":0},"child":[{"type":"Box","props":{"y":40,"x":10,"width":0,"height":0},"child":[{"type":"Image","props":{"y":13,"x":14,"width":208,"skin":"surface/touxiangdi.png","height":209}},{"type":"Image","props":{"y":0,"x":0,"width":236,"skin":"surface/touxiangjindutiao.png","height":235}},{"type":"Image","props":{"y":0,"x":0,"skin":"surface/dengjidi.png"},"child":[{"type":"Label","props":{"y":18,"x":7,"wordWrap":true,"width":48,"text":"99","height":28,"fontSize":28,"font":"Arial","color":"#f1fdfd","align":"center"}}]},{"type":"Image","props":{"y":212,"x":20,"width":193,"skin":"surface/iconditiao.png","height":56},"child":[{"type":"Label","props":{"y":12,"x":-10,"width":214,"text":"李泽言","height":32,"fontSize":32,"font":"Arial","color":"#f1fdfd","align":"center"}}]}]},{"type":"Box","props":{"y":1465,"x":0,"width":0,"height":0},"child":[{"type":"Image","props":{"y":0,"x":648,"width":432,"var":"btnOut","skin":"button/btn_kais.png","height":455}}]},{"type":"List","props":{"y":146,"x":947,"var":"rightBtnList","spaceY":5,"repeatX":1}},{"type":"List","props":{"y":1202,"x":30,"var":"leftBtnList","spaceY":5,"repeatX":1}}]},{"type":"Sprite","props":{"y":0,"x":0,"var":"win"}},{"type":"Sprite","props":{"y":0,"x":0,"var":"money"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}