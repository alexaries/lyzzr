/**Created by the LayaAirIDE,do not modify.*/
package ui.jiban {
	import laya.ui.*;
	import laya.display.*; 
	import ui.jiban.items.StarListUI;

	public class JibanItemUI extends View {
		public var itemIcon:Image;
		public var kuang:Image;
		public var srIcon:Image;
		public var nameTxt:Label;
		public var countTxt:Label;
		public var levelTxt:Label;
		public var starlist:StarListUI;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":360,"height":460},"child":[{"type":"Image","props":{"y":0,"x":0,"width":360,"var":"itemIcon","skin":"ui/cards/10500.png","height":360}},{"type":"Image","props":{"y":0,"x":0,"width":360,"var":"kuang","skin":"surface/shuxing1.png","sizeGrid":"11,0,88,0","height":360}},{"type":"Image","props":{"y":3,"x":7,"var":"srIcon","skin":"icon/SR.png"}},{"type":"Label","props":{"y":373,"x":5,"width":350,"var":"nameTxt","text":"角色名字:翻星点点","height":45,"fontSize":30,"color":"#65565c","align":"center"}},{"type":"Label","props":{"y":415,"x":1,"width":350,"var":"countTxt","text":"已拥有:1","height":45,"fontSize":30,"color":"#65565c","bold":true,"align":"center"}},{"type":"Label","props":{"y":305,"x":15,"width":85,"var":"levelTxt","text":"Lv.4","height":45,"fontSize":33,"color":"#f1fdfd","bold":false,"align":"left"}},{"type":"StarList","props":{"y":312,"x":81,"var":"starlist","runtime":"ui.jiban.items.StarListUI"}}]};
		override protected function createChildren():void {
			View.regComponent("ui.jiban.items.StarListUI",StarListUI);
			super.createChildren();
			createView(uiView);

		}

	}
}