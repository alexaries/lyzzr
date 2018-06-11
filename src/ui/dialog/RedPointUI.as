/**Created by the LayaAirIDE,do not modify.*/
package ui.dialog {
	import laya.ui.*;
	import laya.display.*; 

	public class RedPointUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":30,"height":30},"child":[{"type":"Image","props":{"skin":"common/surface/img_redpoint.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}