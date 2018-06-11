/**Created by the LayaAirIDE,do not modify.*/
package ui.copy {
	import laya.ui.*;
	import laya.display.*; 

	public class comboxListItemUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":234,"height":65},"child":[{"type":"Image","props":{"y":0,"x":2,"width":229,"skin":"common/surface/mask_yellow.png","name":"selectBox","height":65}},{"type":"Image","props":{"y":1,"x":2,"width":230,"skin":"common/surface/common_bg_4.png","height":62,"sizeGrid":"2,2,2,2"}},{"type":"Label","props":{"y":16,"x":19,"width":200,"text":"label","padding":"-4","name":"label","height":32,"fontSize":32,"font":"Microsoft YaHei","color":"#feffec","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}