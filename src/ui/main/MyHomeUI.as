/**Created by the LayaAirIDE,do not modify.*/
package ui.main {
	import laya.ui.*;
	import laya.display.*; 
	import ui.main.icons.MainIconViewUI;
	import laya.display.Text;

	public class MyHomeUI extends View {
		public var mapPart:Sprite;
		public var upPart:Box;
		public var headBox:Box;
		public var topBg:Image;
		public var headIcon:Image;
		public var levelTxt:Label;
		public var btnRecharge:Button;
		public var nameLabel:Label;
		public var moneyBox:Box;
		public var downPart:Box;
		public var chatbg:Image;
		public var downFrameBg:Image;
		public var richangBtn:Image;
		public var btnOut:Image;
		public var expProgress:Image;
		public var iconList:List;
		public var chat:Box;
		public var chatImage:Image;
		public var btnMusic:Button;
		public var chatPanel:Panel;
		public var btnRank:Image;
		public var taskTips:Sprite;
		public var taskTip:Text;
		public var taskTrack:Sprite;
		public var rightBtnGroup:List;
		public var activityIconCollect:Sprite;
		public var activityContainer:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Sprite","props":{"var":"mapPart"}},{"type":"Box","props":{"y":0,"x":0,"width":1080,"var":"upPart","height":192},"child":[{"type":"Box","props":{"y":0,"x":0,"width":349,"var":"headBox","height":192},"child":[{"type":"Image","props":{"y":0,"x":14,"var":"topBg","skin":"main/bg_function_icon.png"}},{"type":"Image","props":{"y":14,"x":29,"width":140,"var":"headIcon","height":140}},{"type":"Image","props":{"y":140,"x":0,"width":214,"skin":"main/baseName.png"}},{"type":"Label","props":{"y":90,"x":145,"wordWrap":true,"width":116,"var":"levelTxt","text":"100级","height":27,"fontSize":32,"font":"Microsoft YaHei","color":"#feffec","align":"left"}},{"type":"Button","props":{"y":15,"x":158,"var":"btnRecharge","stateNum":2,"skin":"main/btn_recharge.png","labelSize":28,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#feffec"}},{"type":"Label","props":{"y":140,"x":0,"width":214,"var":"nameLabel","text":"李泽言","height":48,"fontSize":32,"font":"Microsoft YaHei","color":"#feffec","align":"center"}}]},{"type":"Box","props":{"x":349,"width":731,"var":"moneyBox","height":49}}]},{"type":"Box","props":{"y":1675,"x":0,"width":1080,"var":"downPart","height":245},"child":[{"type":"Image","props":{"y":-69,"x":0,"width":1080,"var":"chatbg","skin":"main/chat_bg2.png","sizeGrid":"0,5,0,5","height":137}},{"type":"Image","props":{"y":56,"x":0,"var":"downFrameBg","skin":"main/bg_down.png"}},{"type":"Image","props":{"y":81,"x":12,"var":"richangBtn","skin":"main/richang.png","name":"zhujiemian_richang"}},{"type":"Image","props":{"y":78,"x":909,"var":"btnOut","skin":"main/chuzhan.png"}},{"type":"Image","props":{"y":79,"x":218,"width":686,"var":"expProgress","skin":"main/exp_yellow.png","sizeGrid":"0,15,0,15"}},{"type":"List","props":{"y":94,"x":186,"width":706,"var":"iconList","spaceX":7,"repeatY":1,"repeatX":5,"height":137},"child":[{"type":"MainIconView","props":{"renderType":"render","runtime":"ui.main.icons.MainIconViewUI"}}]}]},{"type":"Box","props":{"y":1605,"x":0,"width":1080,"var":"chat"},"child":[{"type":"Image","props":{"y":0,"x":-110,"width":1300,"var":"chatImage","skin":"main/chat_bg.png","height":144,"alpha":0}},{"type":"Button","props":{"y":23,"x":48,"var":"btnMusic","stateNum":2,"skin":"main/btn_music.png"}},{"type":"Panel","props":{"y":8,"x":164,"width":751,"var":"chatPanel","height":128}},{"type":"Image","props":{"y":20,"x":941,"var":"btnRank","skin":"main/rank.png"}}]},{"type":"Sprite","props":{"y":1306,"x":15,"width":1050,"var":"taskTips","mouseEnabled":false},"child":[{"type":"Clip","props":{"y":0,"x":0,"width":1050,"skin":"main/baseName.png","sizeGrid":"8,7,7,7","height":90}},{"type":"Text","props":{"y":22,"x":25,"width":1000,"var":"taskTip","height":60,"fontSize":36,"font":"Microsoft YaHei","color":"#feffec","bold":false,"align":"center"}}]},{"type":"Sprite","props":{"y":1505,"x":33,"width":571,"var":"taskTrack","height":88}},{"type":"List","props":{"y":726,"x":947,"width":126,"var":"rightBtnGroup","spaceY":5,"repeatX":1},"child":[{"type":"VScrollBar","props":{"name":"scrollBar"}}]},{"type":"Sprite","props":{"y":195,"x":0,"var":"activityIconCollect"}},{"type":"Sprite","props":{"y":365,"x":0,"var":"activityContainer"}}]};
		override protected function createChildren():void {
			View.regComponent("ui.main.icons.MainIconViewUI",MainIconViewUI);
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}