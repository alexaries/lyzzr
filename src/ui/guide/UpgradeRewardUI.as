/**Created by the LayaAirIDE,do not modify.*/
package ui.guide {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class UpgradeRewardUI extends View {
		public var closeBtn:Button;
		public var title:Label;
		public var btnFreeGet:Button;
		public var btnGoldGet:Button;
		public var txtLevel:Text;
		public var txtNextLevel:Text;
		public var txtNextFunc:Text;
		public var tileList:List;
		public var tileList1:List;
		public var panel:Panel;
		public var tileList2:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"y":0,"x":0,"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":-110,"width":1300,"skin":"common/surface/common_bg_6.png","height":1920,"sizeGrid":"6,6,6,6"}},{"type":"Image","props":{"y":0,"x":-110,"width":1300,"skin":"common/surface/common_bg_6.png","height":1920,"sizeGrid":"6,6,6,6"}},{"type":"Image","props":{"y":120,"x":10,"width":1060,"skin":"common/surface/top_title_bar_2.png","height":140}},{"type":"Image","props":{"y":529,"x":13,"width":1054,"skin":"common/surface/common_bg_4.png","height":1275,"sizeGrid":"2,2,2,2"}},{"type":"Image","props":{"y":215,"x":13,"skin":"module/guide/upgrade_banner.png"}},{"type":"Image","props":{"y":110,"x":10,"width":1060,"skin":"main/border_up_down.png","height":1706,"sizeGrid":"24,0,24,0"}},{"type":"Image","props":{"y":120,"x":10,"width":1060,"skin":"common/surface/border_left_right.png","sizeGrid":"10,50,10,50","height":1686}},{"type":"Button","props":{"y":125,"x":905,"width":160,"var":"closeBtn","stateNum":1,"skin":"common/surface/close.png","name":"close","height":91}},{"type":"Label","props":{"y":134,"x":237,"width":606,"var":"title","text":"升级奖励","height":65,"fontSize":45,"font":"Microsoft YaHei","color":"#e3d6ae","align":"center"}},{"type":"Image","props":{"y":906,"x":73,"width":931,"skin":"common/surface/partition_line_1.png","height":14,"sizeGrid":"3,13,3,12"}},{"type":"Image","props":{"y":1231,"x":74,"width":931,"skin":"common/surface/partition_line_1.png","height":14,"sizeGrid":"3,13,3,12"}},{"type":"Button","props":{"y":797,"x":233,"var":"btnFreeGet","stateNum":2,"skin":"common/button/btn_blue_218_86.png","name":"ok","labelSize":30,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#ffffff,#ffffff","labelAlign":"center","label":"免费领取","sizeGrid":"20,20,20,20"}},{"type":"Button","props":{"y":797,"x":618,"var":"btnGoldGet","stateNum":2,"skin":"common/button/btn_yellow_218_86.png","name":"cancel","labelSize":30,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#ffffff,#ffffff","labelAlign":"center","label":"双倍领取"}},{"type":"Text","props":{"y":307,"x":647,"width":185,"var":"txtLevel","valign":"middle","text":"1","strokeColor":"#3b3c39","stroke":4,"height":59,"fontSize":48,"font":"Microsoft YaHei","color":"#fbefd1","align":"center"}},{"type":"Text","props":{"y":935,"x":320,"width":473,"var":"txtNextLevel","text":"等级达到{0}级即可,获得了下列物品:","height":40,"fontSize":26,"font":"Microsoft YaHei","color":"#ffd542"}},{"type":"Text","props":{"y":1262,"x":323,"width":473,"var":"txtNextFunc","text":"等级达到{0}级即可开启下列功能","height":40,"fontSize":26,"font":"Microsoft YaHei","color":"#ffd542"}},{"type":"List","props":{"y":546,"x":51,"width":959,"var":"tileList","height":238}},{"type":"List","props":{"y":990,"x":55,"width":952,"var":"tileList1","height":230}},{"type":"Panel","props":{"y":1321,"x":17,"width":1046,"var":"panel","height":454},"child":[{"type":"List","props":{"y":0,"x":0,"width":1046,"var":"tileList2","height":454}}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}