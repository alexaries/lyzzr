/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class BattleResultViewUI extends View {
		public var first:Box;
		public var titleLabel:Label;
		public var scoreLabel:Label;
		public var fabuBtn:Button;
		public var info:Box;
		public var starList:List;
		public var infoScoreLabel:Label;
		public var contentLabel:Label;
		public var commentBox:Box;
		public var zhuanLabel:Label;
		public var commentList:List;
		public var pingLabel:Label;
		public var boLabel:Label;
		public var rewardBox:Box;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Box","props":{"width":1080,"var":"first","height":1920},"child":[{"type":"Image","props":{"y":560,"x":0,"width":1080,"skin":"common/surface/common_bg_3.png","sizeGrid":"1,1,1,1","height":800}},{"type":"Image","props":{"y":535,"x":102,"width":876,"skin":"common/surface/top_sub_title_bar.png","height":77}},{"type":"Label","props":{"y":541,"x":354,"width":372,"var":"titleLabel","text":"城市新闻","height":48,"fontSize":48,"font":"Microsoft YaHei","color":"#feffec","align":"center"}},{"type":"Image","props":{"y":914,"x":28,"width":1024,"skin":"common/surface/partition_line_1.png","sizeGrid":"3,13,3,12"}},{"type":"Label","props":{"y":741,"x":138,"width":372,"text":"节目得分:","height":48,"fontSize":48,"font":"Microsoft YaHei","color":"#f43f72","align":"right"}},{"type":"Label","props":{"y":741,"x":538,"width":372,"var":"scoreLabel","text":"2428","height":48,"fontSize":48,"font":"Microsoft YaHei","color":"#f43f72","align":"left"}},{"type":"Label","props":{"y":979,"x":110,"width":859,"text":"没想到会发生这么骇人的事情","height":164,"fontSize":36,"font":"Microsoft YaHei","color":"#000000","align":"left"}},{"type":"Button","props":{"y":1195,"x":136,"width":808,"var":"fabuBtn","stateNum":2,"skin":"common/button/btn_r_1.png","sizeGrid":"0,18,0,18","labelSize":36,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#ffffff","label":"发 布","height":101}}]},{"type":"Box","props":{"width":1080,"var":"info","height":1920},"child":[{"type":"Image","props":{"width":1080,"skin":"ui/map/214.png/214.png","height":1920}},{"type":"List","props":{"y":115,"x":220,"width":639,"var":"starList","height":200}},{"type":"Image","props":{"y":315,"x":138,"width":804,"skin":"main/powerbg.png","height":219}},{"type":"Label","props":{"y":430,"x":51,"width":372,"text":"节目得分:","height":36,"fontSize":36,"font":"Microsoft YaHei","color":"#feffec","align":"right"}},{"type":"Label","props":{"y":417,"x":451,"width":372,"var":"infoScoreLabel","text":"1000","height":56,"fontSize":56,"font":"Microsoft YaHei","color":"#feffec","align":"left"}},{"type":"Label","props":{"y":555,"x":65,"width":372,"var":"contentLabel","text":"最后的净土.南极","height":36,"fontSize":36,"font":"Microsoft YaHei","color":"#000000","align":"left"}},{"type":"Box","props":{"y":650,"x":0,"width":1080,"var":"commentBox","height":1270},"child":[{"type":"Image","props":{"width":1080,"skin":"comp/hslider.png","sizeGrid":"2,2,2,2","height":40}},{"type":"Label","props":{"y":0,"x":26,"width":205,"var":"zhuanLabel","text":"转发 10000","height":28,"fontSize":28,"font":"Microsoft YaHei","color":"#1e1e1e","align":"left"}},{"type":"List","props":{"y":48,"x":0,"width":1080,"var":"commentList","height":1064}},{"type":"Label","props":{"y":0,"x":216,"width":205,"var":"pingLabel","text":"评论 10000","height":28,"fontSize":28,"font":"Microsoft YaHei","color":"#1e1e1e","align":"left"}},{"type":"Label","props":{"y":0,"x":836,"width":205,"var":"boLabel","text":"播放量 10000","height":28,"fontSize":28,"font":"Microsoft YaHei","color":"#1e1e1e","align":"left"}}]},{"type":"Box","props":{"y":650,"x":0,"width":1080,"var":"rewardBox","height":1270}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}