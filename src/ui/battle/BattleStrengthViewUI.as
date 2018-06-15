/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class BattleStrengthViewUI extends View {
		public var list:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1300,"height":360},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1300,"skin":"comp/textinput.png","sizeGrid":"2,2,2,2","height":360}},{"type":"Image","props":{"y":0,"x":0,"skin":"main/task_track_bg.png"}},{"type":"Label","props":{"y":18,"x":70,"width":298,"text":"公司实力","height":57,"fontSize":36,"font":"Microsoft YaHei","color":"#ffffff","align":"center"}},{"type":"List","props":{"y":117,"x":221,"width":858,"var":"list","height":204}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}