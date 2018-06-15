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
		public var rewardList:List;
		public var companyLabel:Label;
		public var levelLabel:Label;
		public var playerList:List;
		public var moreBtn:Button;
		public var finishBtn:Button;
		public var strengthBox:Box;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1300,"height":1920},"child":[{"type":"Box","props":{"width":1300,"var":"first","height":1920},"child":[{"type":"Image","props":{"y":560,"x":0,"width":1300,"skin":"common/surface/common_bg_3.png","sizeGrid":"1,1,1,1","height":800}},{"type":"Image","props":{"y":535,"x":212,"width":876,"skin":"common/surface/top_sub_title_bar.png","height":77}},{"type":"Label","props":{"y":541,"x":464,"width":372,"var":"titleLabel","text":"城市新闻","height":48,"fontSize":48,"font":"Microsoft YaHei","color":"#feffec","align":"center"}},{"type":"Image","props":{"y":914,"x":138,"width":1024,"skin":"common/surface/partition_line_1.png","sizeGrid":"3,13,3,12"}},{"type":"Label","props":{"y":741,"x":268,"width":372,"text":"节目得分:","height":48,"fontSize":48,"font":"Microsoft YaHei","color":"#f43f72","align":"right"}},{"type":"Label","props":{"y":741,"x":668,"width":372,"var":"scoreLabel","text":"2428","height":48,"fontSize":48,"font":"Microsoft YaHei","color":"#f43f72","align":"left"}},{"type":"Label","props":{"y":979,"x":220,"width":859,"text":"没想到会发生这么骇人的事情","height":164,"fontSize":36,"font":"Microsoft YaHei","color":"#000000","align":"left"}},{"type":"Button","props":{"y":1195,"x":246,"width":808,"var":"fabuBtn","stateNum":2,"skin":"common/button/btn_r_1.png","sizeGrid":"0,18,0,18","labelSize":36,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#ffffff","label":"发 布","height":101}}]},{"type":"Box","props":{"width":1300,"var":"info","height":1920},"child":[{"type":"Image","props":{"width":1300,"skin":"ui/map/214.png/214.png","height":1920}},{"type":"List","props":{"y":115,"x":330,"width":639,"var":"starList","height":200}},{"type":"Image","props":{"y":315,"x":248,"width":804,"skin":"main/powerbg.png","height":219}},{"type":"Label","props":{"y":430,"x":171,"width":372,"text":"节目得分:","height":36,"fontSize":36,"font":"Microsoft YaHei","color":"#feffec","align":"right"}},{"type":"Label","props":{"y":417,"x":571,"width":372,"var":"infoScoreLabel","text":"1000","height":56,"fontSize":56,"font":"Microsoft YaHei","color":"#feffec","align":"left"}},{"type":"Label","props":{"y":555,"x":65,"width":372,"var":"contentLabel","text":"最后的净土.南极","height":36,"fontSize":36,"font":"Microsoft YaHei","color":"#000000","align":"left"}},{"type":"Box","props":{"y":650,"x":0,"width":1300,"var":"commentBox","height":1270},"child":[{"type":"Image","props":{"width":1300,"skin":"comp/hslider.png","sizeGrid":"2,2,2,2","height":40}},{"type":"Label","props":{"y":0,"x":26,"width":205,"var":"zhuanLabel","text":"转发 10000","height":28,"fontSize":28,"font":"Microsoft YaHei","color":"#1e1e1e","align":"left"}},{"type":"List","props":{"y":48,"x":0,"width":1300,"var":"commentList","height":1064}},{"type":"Label","props":{"y":0,"x":216,"width":205,"var":"pingLabel","text":"评论 10000","height":28,"fontSize":28,"font":"Microsoft YaHei","color":"#1e1e1e","align":"left"}},{"type":"Label","props":{"y":0,"x":836,"width":205,"var":"boLabel","text":"播放量 10000","height":28,"fontSize":28,"font":"Microsoft YaHei","color":"#1e1e1e","align":"left"}}]},{"type":"Box","props":{"y":650,"x":0,"width":1300,"var":"rewardBox","height":1270},"child":[{"type":"Image","props":{"skin":"main/task_track_bg.png"},"child":[{"type":"Label","props":{"y":19,"x":90,"width":224,"text":"奖 励","height":36,"fontSize":36,"color":"#ffffff","align":"center"}}]},{"type":"List","props":{"y":105,"x":116,"width":1067,"var":"rewardList","height":211}},{"type":"Image","props":{"y":320,"x":0,"skin":"main/task_track_bg.png"},"child":[{"type":"Label","props":{"y":19,"x":90,"width":224,"text":"经 验","height":36,"fontSize":36,"color":"#ffffff","align":"center"}}]},{"type":"Label","props":{"y":425,"x":76,"width":340,"var":"companyLabel","text":"怨灵心宜影视公司","height":36,"fontSize":36,"color":"#ffffff","align":"left"}},{"type":"Label","props":{"y":425,"x":436,"width":117,"var":"levelLabel","text":"Lv.0","height":36,"fontSize":36,"color":"#ffffff","align":"left"}},{"type":"Label","props":{"y":425,"x":738,"width":165,"text":"+300","height":36,"fontSize":36,"color":"#ffffff","align":"right"}},{"type":"Image","props":{"y":420,"x":953,"skin":"main/yinpiao.png"}},{"type":"ProgressBar","props":{"y":491,"x":185,"width":929,"value":0.1,"skin":"common/surface/progress_green.png","height":26,"sizeGrid":"2,2,2,2"}},{"type":"List","props":{"y":547,"x":116,"width":1067,"var":"playerList","height":273}},{"type":"Button","props":{"y":825,"x":218,"width":347,"var":"moreBtn","stateNum":2,"skin":"common/button/btn_b_1.png","sizeGrid":"0,18,0,18","labelSize":36,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#ffffff","label":"重拍一次","height":101}},{"type":"Button","props":{"y":825,"x":748,"width":347,"var":"finishBtn","stateNum":2,"skin":"common/button/btn_r_1.png","sizeGrid":"0,18,0,18","labelSize":36,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#ffffff","label":"结束拍摄","height":101}},{"type":"Box","props":{"y":939,"x":0,"width":1300,"var":"strengthBox","height":320},"child":[{"type":"Image","props":{"y":0,"x":150,"width":1000,"skin":"common/surface/mask_yellow.png","height":51}},{"type":"Label","props":{"y":5,"x":470,"width":359,"text":"试试提高节目得分吧","height":30,"fontSize":28,"font":"Microsoft YaHei","color":"#000000","align":"center"}},{"type":"Button","props":{"y":104,"x":290,"width":184,"stateNum":1,"skin":"main/icons/guaji.png","height":188}},{"type":"Button","props":{"y":104,"x":565,"width":166,"stateNum":1,"skin":"main/icons/beibao.png","height":169}},{"type":"Button","props":{"y":104,"x":830,"width":184,"stateNum":1,"skin":"main/icons/fuben.png","height":188}}]}]}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}