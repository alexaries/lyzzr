/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class BattleSelectionItemUI extends View {
		public var posBox:Box;
		public var check:Image;
		public var making:Image;
		public var nameLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":230,"height":340},"child":[{"type":"Box","props":{"var":"posBox"},"child":[{"type":"Image","props":{"y":39,"x":0,"width":202,"skin":"common/surface/slot.png","height":301,"sizeGrid":"6,6,6,6"}},{"type":"Image","props":{"y":76,"x":-32,"skin":"ui/dialog/head/101.png"}},{"type":"Image","props":{"y":9,"x":182,"width":37,"var":"check","skin":"common/surface/img_upArrow.png","height":50}},{"type":"Image","props":{"y":160,"x":0,"width":202,"var":"making","skin":"common/surface/bg_gain_benifit.png","height":39},"child":[{"type":"Label","props":{"y":2,"x":31,"width":140,"text":"项目制作中","height":30,"fontSize":24,"color":"#b0b0b0","align":"center"}}]},{"type":"Image","props":{"y":310,"x":73,"width":128,"skin":"main/exp_yellow.png","height":22}},{"type":"Label","props":{"y":307,"x":81,"width":114,"var":"nameLabel","text":"林萌萌","height":26,"fontSize":20,"color":"#ffffff","align":"center"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}