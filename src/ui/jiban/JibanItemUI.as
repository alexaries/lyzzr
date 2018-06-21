/**Created by the LayaAirIDE,do not modify.*/
package ui.jiban {
	import laya.ui.*;
	import laya.display.*; 

	public class JibanItemUI extends View {
		public var itemIcon:Image;
		public var srIcon:Image;
		public var nameTxt:Label;
		public var countTxt:Label;
		public var levelTxt:Label;
		public var icon0:Image;
		public var icon1:Image;
		public var icon2:Image;
		public var icon3:Image;
		public var icon4:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":360,"height":460},"child":[{"type":"Image","props":{"y":0,"x":0,"width":360,"var":"itemIcon","skin":"ui/cards/10500.png","height":360}},{"type":"Image","props":{"y":0,"x":0,"width":360,"skin":"surface/shuxing1.png","sizeGrid":"11,0,88,0","height":360}},{"type":"Image","props":{"y":3,"x":7,"var":"srIcon","skin":"icon/SR.png"}},{"type":"Label","props":{"y":373,"x":5,"width":350,"var":"nameTxt","text":"角色名字:翻星点点","height":45,"fontSize":30,"color":"#65565c","align":"center"}},{"type":"Label","props":{"y":415,"x":1,"width":350,"var":"countTxt","text":"已拥有:1","height":45,"fontSize":30,"color":"#65565c","bold":true,"align":"center"}},{"type":"Label","props":{"y":305,"x":15,"width":85,"var":"levelTxt","text":"Lv.4","height":45,"fontSize":33,"color":"#f1fdfd","bold":false,"align":"left"}},{"type":"Box","props":{"y":312,"x":97},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"surface/aixindi.png"}},{"type":"Image","props":{"y":0,"x":35,"skin":"surface/aixindi.png"}},{"type":"Image","props":{"y":0,"x":70,"skin":"surface/aixindi.png"}},{"type":"Image","props":{"y":0,"x":105,"skin":"surface/aixindi.png"}},{"type":"Image","props":{"y":0,"x":140,"skin":"surface/aixindi.png"}}]},{"type":"Box","props":{"y":312,"x":97},"child":[{"type":"Image","props":{"y":0,"x":0,"var":"icon0","skin":"surface/aixinshang.png"}},{"type":"Image","props":{"y":0,"x":35,"var":"icon1","skin":"surface/aixinshang.png"}},{"type":"Image","props":{"y":0,"x":70,"var":"icon2","skin":"surface/aixinshang.png"}},{"type":"Image","props":{"y":0,"x":105,"var":"icon3","skin":"surface/aixinshang.png"}},{"type":"Image","props":{"y":0,"x":140,"var":"icon4","skin":"surface/aixinshang.png"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}