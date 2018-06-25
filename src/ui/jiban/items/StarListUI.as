/**Created by the LayaAirIDE,do not modify.*/
package ui.jiban.items {
	import laya.ui.*;
	import laya.display.*; 

	public class StarListUI extends View {
		public var bg0:Image;
		public var bg1:Image;
		public var bg2:Image;
		public var bg3:Image;
		public var bg4:Image;
		public var bg5:Image;
		public var bg6:Image;
		public var star0:Image;
		public var star1:Image;
		public var star2:Image;
		public var star3:Image;
		public var star4:Image;
		public var star5:Image;
		public var star6:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":250,"height":35},"child":[{"type":"Box","props":{"y":0,"x":0},"child":[{"type":"Image","props":{"y":0,"x":0,"var":"bg0","skin":"surface/aixindi.png","name":"bg0"}},{"type":"Image","props":{"y":0,"x":35,"var":"bg1","skin":"surface/aixindi.png","name":"bg1"}},{"type":"Image","props":{"y":0,"x":70,"var":"bg2","skin":"surface/aixindi.png","name":"bg2"}},{"type":"Image","props":{"y":0,"x":105,"var":"bg3","skin":"surface/aixindi.png","name":"bg3"}},{"type":"Image","props":{"y":0,"x":139,"var":"bg4","skin":"surface/aixindi.png","name":"bg4"}},{"type":"Image","props":{"y":0,"x":174,"var":"bg5","skin":"surface/aixindi.png","name":"bg5"}},{"type":"Image","props":{"y":0,"x":209,"var":"bg6","skin":"surface/aixindi.png","name":"bg6"}}]},{"type":"Box","props":{"y":0,"x":0},"child":[{"type":"Image","props":{"y":0,"x":0,"var":"star0","skin":"surface/aixinshang.png","name":"star0"}},{"type":"Image","props":{"y":0,"x":35,"var":"star1","skin":"surface/aixinshang.png","name":"star1"}},{"type":"Image","props":{"y":0,"x":70,"var":"star2","skin":"surface/aixinshang.png","name":"star2"}},{"type":"Image","props":{"y":0,"x":105,"var":"star3","skin":"surface/aixinshang.png","name":"star3"}},{"type":"Image","props":{"y":0,"x":139,"var":"star4","skin":"surface/aixinshang.png","name":"star4"}},{"type":"Image","props":{"y":0,"x":174,"var":"star5","skin":"surface/aixinshang.png","name":"star5"}},{"type":"Image","props":{"y":0,"x":209,"var":"star6","skin":"surface/aixinshang.png","name":"star6"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}