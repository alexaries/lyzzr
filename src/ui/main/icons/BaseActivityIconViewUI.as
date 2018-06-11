/**Created by the LayaAirIDE,do not modify.*/
package ui.main.icons {
	import laya.ui.*;
	import laya.display.*; 

	public class BaseActivityIconViewUI extends View {
		public var bgImage:Image;
		public var bar:Box;
		public var barImage:Image;
		public var barLabel:Label;
		public var container:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":314,"height":286},"child":[{"type":"Image","props":{"y":0,"x":0,"var":"bgImage","skin":"main/icons/seven_day_1.png"}},{"type":"Box","props":{"y":226,"x":29,"var":"bar"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":256,"var":"barImage","skin":"common/surface/jindutiao.png","height":30,"sizeGrid":"0,16,0,16"}},{"type":"Label","props":{"y":-7,"x":74,"width":108,"var":"barLabel","text":"0/6","height":32,"fontSize":32,"font":"Microsoft YaHei","color":"#feffec","align":"center"}}]},{"type":"Sprite","props":{"y":0,"x":0,"var":"container"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}