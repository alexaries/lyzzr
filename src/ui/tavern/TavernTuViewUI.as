/**Created by the LayaAirIDE,do not modify.*/
package ui.tavern {
	import laya.ui.*;
	import laya.display.*; 

	public class TavernTuViewUI extends View {
		public var iconBg:Image;
		public var icon:Image;
		public var tab:Tab;
		public var nameLabel:Label;
		public var ownLabel:Label;
		public var msgLabel:Label;
		public var closeBtn:Button;
		public var list:List;
		public var getBtn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1080,"skin":"ui/bg/back_cardluck.png/back_cardluck.png","height":1920}},{"type":"Image","props":{"y":145,"x":0,"width":1080,"skin":"comp/textarea.png","sizeGrid":"4,40,4,40","height":954,"alpha":0.5}},{"type":"Image","props":{"y":181,"x":30,"width":474,"var":"iconBg","skin":"comp/textarea.png","sizeGrid":"4,40,4,40","height":784,"alpha":1}},{"type":"Image","props":{"y":201,"x":46,"width":442,"var":"icon","skin":"ui/bg/back_man_chapterpass_lzy.png/back_man_chapterpass_lzy.png","height":749}},{"type":"Tab","props":{"y":989,"x":32,"var":"tab","selectedIndex":0},"child":[{"type":"Button","props":{"x":0,"stateNum":2,"skin":"common/button/btn_b_1.png","name":"item0","labelSize":32,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#feffec","labelAlign":"center","label":"全部"}},{"type":"Button","props":{"x":211,"stateNum":2,"skin":"common/button/btn_b_1.png","name":"item1","labelSize":32,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#feffec","labelAlign":"center","label":"李泽言"}},{"type":"Button","props":{"x":422,"stateNum":2,"skin":"common/button/btn_b_1.png","name":"item2","labelSize":32,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#feffec","labelAlign":"center","label":"许墨"}},{"type":"Button","props":{"x":632,"stateNum":2,"skin":"common/button/btn_b_1.png","name":"item3","labelSize":32,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#feffec","labelAlign":"center","label":"周棋洛"}},{"type":"Button","props":{"y":0,"x":843,"stateNum":2,"skin":"common/button/btn_b_1.png","name":"item4","labelSize":32,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#feffec","labelAlign":"center","label":"白起"}}]},{"type":"Label","props":{"y":179,"x":612,"var":"nameLabel","text":"李泽言.掠夺者","fontSize":60,"font":"Microsoft YaHei"}},{"type":"Image","props":{"y":271,"x":528,"width":524,"skin":"common/surface/bg_gain_benifit.png","height":76}},{"type":"Label","props":{"y":287,"x":622,"width":346,"var":"ownLabel","text":"已拥有:0","height":32,"fontSize":32,"font":"Microsoft YaHei","color":"#feffec","align":"center"}},{"type":"Label","props":{"y":639,"x":521,"width":547,"var":"msgLabel","text":"不拉不拉不拉","height":126,"fontSize":32,"font":"Microsoft YaHei","color":"#000000","align":"left"}},{"type":"Button","props":{"y":9,"x":5,"var":"closeBtn","stateNum":1,"skin":"common/button/btn_back.png"}},{"type":"List","props":{"y":1118,"x":30,"width":1019,"var":"list","vScrollBarSkin":"scrollv","spaceY":10,"spaceX":110,"repeatY":5,"repeatX":3,"height":722}},{"type":"Button","props":{"y":787,"x":706,"var":"getBtn","stateNum":2,"skin":"common/button/btn_r_1.png","labelSize":32,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"兑换"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}