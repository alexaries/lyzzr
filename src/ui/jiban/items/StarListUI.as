/**Created by the LayaAirIDE,do not modify.*/
package ui.jiban.items {
	import laya.ui.*;
	import laya.display.*; 

	public class StarListUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":250,"height":35},"child":[{"type":"Box","props":{"y":0,"x":0},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"surface/aixindi.png","name":"bg0"}},{"type":"Image","props":{"y":0,"x":35,"skin":"surface/aixindi.png","name":"bg1"}},{"type":"Image","props":{"y":0,"x":70,"skin":"surface/aixindi.png","name":"bg2"}},{"type":"Image","props":{"y":0,"x":105,"skin":"surface/aixindi.png","name":"bg3"}},{"type":"Image","props":{"y":0,"x":139,"skin":"surface/aixindi.png","name":"bg4"}},{"type":"Image","props":{"y":0,"x":174,"skin":"surface/aixindi.png","name":"bg5"}},{"type":"Image","props":{"y":0,"x":209,"skin":"surface/aixindi.png","name":"bg6"}}]},{"type":"Box","props":{"y":0,"x":0},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"surface/aixinshang.png","name":"star0"}},{"type":"Image","props":{"y":0,"x":35,"skin":"surface/aixinshang.png","name":"star1"}},{"type":"Image","props":{"y":0,"x":70,"skin":"surface/aixinshang.png","name":"star2"}},{"type":"Image","props":{"y":0,"x":105,"skin":"surface/aixinshang.png","name":"star3"}},{"type":"Image","props":{"y":0,"x":139,"skin":"surface/aixinshang.png","name":"star4"}},{"type":"Image","props":{"y":0,"x":174,"skin":"surface/aixinshang.png","name":"star5"}},{"type":"Image","props":{"y":0,"x":209,"skin":"surface/aixinshang.png","name":"star6"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}