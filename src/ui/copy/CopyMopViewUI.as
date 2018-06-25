/**Created by the LayaAirIDE,do not modify.*/
package ui.copy {
	import laya.ui.*;
	import laya.display.*; 

	public class CopyMopViewUI extends View {
		public var bg:Image;
		public var panel:Panel;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":-110,"width":1300,"var":"bg","skin":"surface/shuxingdi.png","height":1920,"alpha":0.01,"sizeGrid":"1,1,1,1"}},{"type":"Image","props":{"y":360,"x":-110,"width":1300,"skin":"surface/shuxingdi.png","height":1200,"sizeGrid":"1,1,1,1"}},{"type":"Image","props":{"y":360,"x":273,"width":534,"skin":"surface/iconditiao.png","height":102}},{"type":"Label","props":{"y":387,"x":439,"width":201,"text":"重拍获得","height":48,"fontSize":48,"color":"#f1fdfd","align":"center"}},{"type":"Label","props":{"y":1477,"x":7,"width":1065,"text":"每次重拍获得的羁绊经验自动转化成初识心愿","height":36,"fontSize":36,"color":"#65565c","align":"center"}},{"type":"Panel","props":{"y":485,"x":0,"width":1080,"var":"panel","vScrollBarSkin":"comp/vscroll.png","height":950}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}