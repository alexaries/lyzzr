/**Created by the LayaAirIDE,do not modify.*/
package ui.achievement {
	import laya.ui.*;
	import laya.display.*; 
	import ui.achievement.HeadMapUI;

	public class AchievementUI extends View {
		public var closeBtn:Button;
		public var tujian:Box;
		public var chengjiu:Box;
		public var tabbtn:Tab;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1080,"skin":"ui/bg/back_achv.png/back_achv.png","height":1920}},{"type":"Button","props":{"y":8,"x":19,"var":"closeBtn","stateNum":1,"skin":"common/button/btn_back.png"}},{"type":"Box","props":{"var":"tujian"},"child":[{"type":"HeadMap","props":{"y":434,"x":262,"runtime":"ui.achievement.HeadMapUI"}},{"type":"HeadMap","props":{"y":433,"x":529,"runtime":"ui.achievement.HeadMapUI"}},{"type":"HeadMap","props":{"y":721,"x":269,"runtime":"ui.achievement.HeadMapUI"}},{"type":"HeadMap","props":{"y":718,"x":532,"runtime":"ui.achievement.HeadMapUI"}},{"type":"HeadMap","props":{"y":999,"x":274,"runtime":"ui.achievement.HeadMapUI"}}]},{"type":"Box","props":{"y":0,"x":0,"var":"chengjiu"},"child":[{"type":"HeadMap","props":{"y":443,"x":261,"runtime":"ui.achievement.HeadMapUI"}},{"type":"HeadMap","props":{"y":442,"x":528,"runtime":"ui.achievement.HeadMapUI"}},{"type":"HeadMap","props":{"y":730,"x":268,"runtime":"ui.achievement.HeadMapUI"}},{"type":"HeadMap","props":{"y":727,"x":531,"runtime":"ui.achievement.HeadMapUI"}},{"type":"HeadMap","props":{"y":1008,"x":273,"runtime":"ui.achievement.HeadMapUI"}}]},{"type":"Tab","props":{"y":185,"x":395,"var":"tabbtn","space":0,"skin":"comp/tab.png","scaleY":1.5,"scaleX":1.5,"labels":"图鉴,成就","labelStrokeColor":"#fdf6f6","labelSize":16}}]};
		override protected function createChildren():void {
			View.regComponent("ui.achievement.HeadMapUI",HeadMapUI);
			super.createChildren();
			createView(uiView);

		}

	}
}