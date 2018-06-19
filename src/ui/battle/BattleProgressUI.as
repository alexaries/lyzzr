/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class BattleProgressUI extends View {
		public var progress:ProgressBar;
		public var scoreLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":850,"height":100},"child":[{"type":"Image","props":{"y":66,"x":0,"width":850,"skin":"common/surface/bg_progress.png","sizeGrid":"5,20,5,20"}},{"type":"ProgressBar","props":{"y":69,"x":19,"width":813,"var":"progress","value":0.01,"skin":"common/surface/progress_yellow.png","sizeGrid":"2,2,2,2","height":26}},{"type":"Label","props":{"y":28,"x":582,"width":137,"text":"节目得分","height":24,"fontSize":24,"font":"Microsoft YaHei","color":"#feffec","align":"right"}},{"type":"Label","props":{"y":28,"x":732,"width":116,"var":"scoreLabel","text":"0","height":24,"fontSize":24,"font":"Microsoft YaHei","color":"#feffec","align":"left"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}