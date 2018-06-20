/**Created by the LayaAirIDE,do not modify.*/
package ui.main {
	import laya.ui.*;
	import laya.display.*; 

	public class MoneyViewUI extends View {
		public var tiIcon:Image;
		public var tiBtn:Button;
		public var tiLabel:Label;
		public var jinIcon:Image;
		public var jinBtn:Button;
		public var jinLabel:Label;
		public var zuanIcon:Image;
		public var zuanBtn:Button;
		public var zuanLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":80},"child":[{"type":"Image","props":{"y":0,"x":218,"width":249,"skin":"surface/ziyuanditiao.png","height":72},"child":[{"type":"Image","props":{"y":0,"x":-21,"width":80,"var":"tiIcon","skin":"icon/icon_aixin.png","height":80}},{"type":"Button","props":{"y":11,"x":188,"width":50,"var":"tiBtn","stateNum":2,"skin":"button/btn_ziyuanjiaanniu.png","height":55}},{"type":"Label","props":{"y":21,"x":53,"width":133,"var":"tiLabel","text":"99/100","overflow":"hidden","height":36,"fontSize":32,"font":"Arial","color":"#f1fdfd","align":"center"}}]},{"type":"Image","props":{"y":0,"x":499,"width":249,"skin":"surface/ziyuanditiao.png","height":72},"child":[{"type":"Image","props":{"y":0,"x":-21,"width":80,"var":"jinIcon","skin":"icon/icon_ziyuanbi.png","height":80}},{"type":"Button","props":{"y":11,"x":188,"width":50,"var":"jinBtn","stateNum":2,"skin":"button/btn_ziyuanjiaanniu.png","height":55}},{"type":"Label","props":{"y":21,"x":53,"width":133,"var":"jinLabel","text":"99/100","overflow":"hidden","height":36,"fontSize":32,"font":"Arial","color":"#f1fdfd","align":"center"}}]},{"type":"Image","props":{"y":0,"x":780,"width":249,"skin":"surface/ziyuanditiao.png","height":72},"child":[{"type":"Image","props":{"y":0,"x":-21,"width":80,"var":"zuanIcon","skin":"icon/icon_zuanshi.png","height":80}},{"type":"Button","props":{"y":11,"x":188,"width":50,"var":"zuanBtn","stateNum":2,"skin":"button/btn_ziyuanjiaanniu.png","height":55}},{"type":"Label","props":{"y":21,"x":53,"width":133,"var":"zuanLabel","text":"99/100","overflow":"hidden","height":36,"fontSize":32,"font":"Arial","color":"#f1fdfd","align":"center"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}