/**Created by the LayaAirIDE,do not modify.*/
package ui.copy {
	import laya.ui.*;
	import laya.display.*; 

	public class CopyItemUI extends View {
		public var bgBtn:Image;
		public var nameLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":320,"height":200},"child":[{"type":"Image","props":{"y":67,"x":8,"width":303,"skin":"main/fire.png","height":103}},{"type":"Image","props":{"y":20,"x":2,"width":314,"var":"bgBtn","skin":"main/task_track_bg.png","sizeGrid":"0,32,0,124","height":88}},{"type":"Label","props":{"y":42,"x":106,"width":153,"var":"nameLabel","text":"1-1","height":56,"fontSize":32,"font":"Microsoft YaHei","color":"#ffffff","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}