/**Created by the LayaAirIDE,do not modify.*/
package ui.dailytask {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class DailyTaskUI extends View {
		public var daytaskB:Box;
		public var weektaskB:Box;
		public var maskbg:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Box","props":{"y":250,"x":36,"var":"daytaskB"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1004,"skin":"common/surface/bar_blood_bg.png","sizeGrid":"1,1,1,1","height":1468}},{"type":"Text","props":{"y":17,"x":52,"text":"每日任务","fontSize":55,"color":"#ffffff"}},{"type":"Text","props":{"y":32,"x":706,"text":"今日活跃度：","fontSize":33,"color":"#ffffff"}},{"type":"Text","props":{"y":39,"x":895,"text":"100","fontSize":33,"color":"#ffffff"}},{"type":"Text","props":{"y":101,"x":50,"text":"每日任务获得的活跃度可以用来领取奖励，每日5点刷新重置","fontSize":33,"color":"#ffffff"}}]},{"type":"Box","props":{"y":149,"x":76,"var":"weektaskB"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1004,"skin":"common/surface/bar_blood_bg.png","sizeGrid":"1,1,1,1","height":1468}},{"type":"Text","props":{"y":19,"x":68,"text":"每周活跃","fontSize":55,"color":"#ffffff"}},{"type":"Text","props":{"y":36,"x":714,"text":"本周活跃度：","fontSize":33,"color":"#ffffff"}},{"type":"Text","props":{"y":43,"x":903,"text":"100","fontSize":33,"color":"#ffffff"}},{"type":"Text","props":{"y":105,"x":58,"text":"每日任务获得的活跃度可以用来领取奖励，每日5点刷新重置","fontSize":33,"color":"#ffffff"}}]},{"type":"Image","props":{"y":246,"x":34,"width":1004,"var":"maskbg","skin":"common/surface/bar_blood_bg.png","sizeGrid":"1,1,1,1","height":1468}}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}