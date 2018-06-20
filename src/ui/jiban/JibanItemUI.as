/**Created by the LayaAirIDE,do not modify.*/
package ui.jiban {
	import laya.ui.*;
	import laya.display.*; 

	public class JibanItemUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":360,"height":460},"child":[{"type":"Image","props":{"y":0,"x":0,"width":360,"skin":"ui/cards/10500.png","height":360}},{"type":"Image","props":{"y":0,"x":0,"width":360,"skin":"surface/shuxing1.png","sizeGrid":"11,0,88,0","height":360}},{"type":"Image","props":{"y":3,"x":7,"skin":"icon/SR.png"}},{"type":"Label","props":{"y":373,"x":5,"width":350,"text":"角色名字:翻星点点","height":45,"fontSize":30,"color":"#65565c","align":"center"}},{"type":"Label","props":{"y":415,"x":1,"width":350,"text":"已拥有:1","height":45,"fontSize":30,"color":"#65565c","bold":true,"align":"center"}},{"type":"Label","props":{"y":305,"x":15,"width":85,"text":"Lv.4","height":45,"fontSize":33,"color":"#f1fdfd","bold":false,"align":"left"}},{"type":"Box","props":{"y":312,"x":97},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"icon/aixindi.png"}},{"type":"Image","props":{"y":0,"x":35,"skin":"icon/aixindi.png"}},{"type":"Image","props":{"y":0,"x":70,"skin":"icon/aixindi.png"}},{"type":"Image","props":{"y":0,"x":105,"skin":"icon/aixindi.png"}},{"type":"Image","props":{"y":0,"x":140,"skin":"icon/aixindi.png"}}]},{"type":"Box","props":{"y":312,"x":97},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"icon/aixinshang.png"}},{"type":"Image","props":{"y":0,"x":35,"skin":"icon/aixinshang.png"}},{"type":"Image","props":{"y":0,"x":70,"skin":"icon/aixinshang.png"}},{"type":"Image","props":{"y":0,"x":105,"skin":"icon/aixinshang.png"}},{"type":"Image","props":{"y":0,"x":140,"skin":"icon/aixinshang.png"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}