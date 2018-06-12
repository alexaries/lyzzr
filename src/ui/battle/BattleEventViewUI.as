/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class BattleEventViewUI extends View {
		public var info:Box;
		public var moreBtn:Button;
		public var skipBtn:Button;
		public var sureBtn:Button;
		public var icon:Image;
		public var contentLabel:Label;
		public var list:List;
		public var player:Box;
		public var playerList:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1460},"child":[{"type":"Box","props":{"var":"info"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1080,"skin":"common/surface/common_bg_3.png","sizeGrid":"1,1,1,1","height":726}},{"type":"Button","props":{"y":730,"x":66,"width":234,"var":"moreBtn","stateNum":2,"skin":"common/button/btn_b_1.png","labelSize":36,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"更多专家","height":106}},{"type":"Button","props":{"y":730,"x":796,"width":234,"var":"skipBtn","stateNum":2,"skin":"common/button/btn_b_1.png","labelSize":36,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"放弃","height":106}},{"type":"Button","props":{"y":593,"x":180,"width":720,"var":"sureBtn","stateNum":2,"skin":"common/button/btn_r_1.png","sizeGrid":"0,18,0,18","labelSize":36,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"确定","height":106}},{"type":"Image","props":{"y":201,"x":398,"width":283,"skin":"common/surface/slot.png","height":353,"sizeGrid":"6,6,6,6"}},{"type":"Image","props":{"y":248,"x":412,"var":"icon","skin":"ui/card/32140.png/32140.png"}},{"type":"Label","props":{"y":119,"x":117,"width":860,"var":"contentLabel","text":"白起一直有一个问题,找一个人去帮助他","height":84,"fontSize":36,"font":"Microsoft YaHei","color":"#ffffff"}},{"type":"Image","props":{"y":1,"x":2,"width":177,"skin":"common/surface/partition_decorate.png","height":99,"sizeGrid":"38,51,0,12"}},{"type":"Label","props":{"y":29,"x":622,"width":104,"text":"关键词","height":38,"fontSize":36,"font":"Microsoft YaHei","color":"#ffffff"}},{"type":"List","props":{"y":32,"x":728,"width":329,"var":"list","height":74}}]},{"type":"Box","props":{"y":1060,"var":"player"},"child":[{"type":"List","props":{"y":0,"x":0,"width":1080,"var":"playerList","height":400}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}