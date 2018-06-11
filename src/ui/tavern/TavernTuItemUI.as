/**Created by the LayaAirIDE,do not modify.*/
package ui.tavern {
	import laya.ui.*;
	import laya.display.*; 

	public class TavernTuItemUI extends View {
		public var nameLabel:Label;
		public var numLabel:Label;
		public var icon:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":310,"height":370},"child":[{"type":"Image","props":{"y":0,"x":0,"width":310,"skin":"common/surface/common_bg_6.png","name":"selectBox","height":370,"sizeGrid":"6,6,6,6"}},{"type":"Image","props":{"y":0,"x":20,"width":269,"skin":"common/surface/frame_blue.png","height":269}},{"type":"Label","props":{"y":270,"x":46,"width":218,"var":"nameLabel","text":"李泽言.掠夺者","height":32,"fontSize":32,"font":"Microsoft YaHei","align":"center"}},{"type":"Image","props":{"y":317,"x":1,"width":308,"skin":"common/surface/bg_gain_benifit.png","height":52}},{"type":"Label","props":{"y":320,"x":46,"width":218,"var":"numLabel","text":"100","height":32,"fontSize":32,"font":"Microsoft YaHei","align":"center"}},{"type":"Image","props":{"y":12,"x":33,"width":244,"var":"icon","skin":"ui/card/11200_11201.png/11200_11201.png","height":244}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}