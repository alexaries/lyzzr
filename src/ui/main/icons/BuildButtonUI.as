/**Created by the LayaAirIDE,do not modify.*/
package ui.main.icons {
	import laya.ui.*;
	import laya.display.*; 

	public class BuildButtonUI extends View {
		public var close:Box;
		public var btnClose:Image;
		public var btnOpen:Image;
		public var nameLabel:Label;
		public var redCon:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":71,"height":371},"child":[{"type":"Box","props":{"y":0,"x":0,"width":54,"var":"close","height":186},"child":[{"type":"Image","props":{"y":6,"x":0,"width":0,"var":"btnClose","skin":"main/icons/build_close.png","height":0}}]},{"type":"Image","props":{"y":0,"x":0,"width":71,"var":"btnOpen","skin":"surface/biaoqiandi.png","sizeGrid":"7,0,36,0","height":371},"child":[{"type":"Label","props":{"y":89,"x":21,"wordWrap":true,"width":36,"var":"nameLabel","text":"许愿树","height":165,"fontSize":36,"font":"Arial","color":"#f1fdfd","align":"center"}}]},{"type":"Sprite","props":{"y":0,"x":22,"var":"redCon"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}