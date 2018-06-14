/**Created by the LayaAirIDE,do not modify.*/
package ui.main {
	import laya.ui.*;
	import laya.display.*; 

	public class HomeMapUI extends View {
		public var map:Panel;
		public var ditu:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Panel","props":{"width":1300,"var":"map","height":1920},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1300,"var":"ditu","skin":"ui/maps/JY.png","height":1920}},{"type":"Sprite","props":{"y":471,"x":391,"name":"item0"}},{"type":"Sprite","props":{"y":699,"x":707,"name":"item1"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}