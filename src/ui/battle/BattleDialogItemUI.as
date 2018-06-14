/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class BattleDialogItemUI extends View {
		public var btn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":890,"height":120},"child":[{"type":"Button","props":{"y":0,"x":0,"width":890,"var":"btn","stateNum":2,"skin":"common/button/btn_r_1.png","sizeGrid":"0,18,0,18","labelSize":32,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"请自己的健身女教练来帮忙","height":120}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}