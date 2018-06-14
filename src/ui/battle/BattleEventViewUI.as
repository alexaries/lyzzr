/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class BattleEventViewUI extends View {
		public var dialogBox:Box;
		public var dialogLabel:Label;
		public var dialogList:List;
		public var eventInfo:Box;
		public var info:Box;
		public var moreBtn:Button;
		public var skipBtn:Button;
		public var sureBtn:Button;
		public var icon:Image;
		public var contentLabel:Label;
		public var list:List;
		public var player:Box;
		public var playerList:List;
		public var eventResult:Box;
		public var resultSureBtn:Button;
		public var resultIcon:Image;
		public var resultContentLabel:Label;
		public var magLabel:Label;
		public var scoreLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1460},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1080,"skin":"common/surface/common_bg_3.png","sizeGrid":"1,1,1,1","height":726}},{"type":"Box","props":{"y":0,"x":0,"width":1080,"var":"dialogBox","height":1460},"child":[{"type":"Label","props":{"y":125,"x":103,"wordWrap":true,"width":874,"var":"dialogLabel","text":"参与拍摄的女嘉宾需要保镖保护，不然不拍摄，员工怎么办","height":134,"fontSize":36,"font":"Microsoft YaHei","color":"#ffffff","align":"left"}},{"type":"List","props":{"y":246,"x":94,"width":890,"var":"dialogList","height":430}}]},{"type":"Box","props":{"width":1080,"var":"eventInfo","height":1460},"child":[{"type":"Box","props":{"y":0,"x":0,"var":"info"},"child":[{"type":"Button","props":{"y":730,"x":66,"width":234,"var":"moreBtn","stateNum":2,"skin":"common/button/btn_b_1.png","labelSize":36,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"更多专家","height":106}},{"type":"Button","props":{"y":730,"x":796,"width":234,"var":"skipBtn","stateNum":2,"skin":"common/button/btn_b_1.png","labelSize":36,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"放弃","height":106}},{"type":"Button","props":{"y":593,"x":180,"width":720,"var":"sureBtn","stateNum":2,"skin":"common/button/btn_r_1.png","sizeGrid":"0,18,0,18","labelSize":36,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"确定","height":106}},{"type":"Image","props":{"y":201,"x":398,"width":283,"skin":"common/surface/slot.png","height":353,"sizeGrid":"6,6,6,6"}},{"type":"Image","props":{"y":248,"x":412,"var":"icon","skin":"ui/card/32140.png/32140.png"}},{"type":"Label","props":{"y":119,"x":117,"width":860,"var":"contentLabel","text":"白起一直有一个问题,找一个人去帮助他","height":84,"fontSize":36,"font":"Microsoft YaHei","color":"#ffffff"}},{"type":"Image","props":{"y":1,"x":2,"width":177,"skin":"common/surface/partition_decorate.png","height":99,"sizeGrid":"38,51,0,12"}},{"type":"Label","props":{"y":29,"x":622,"width":104,"text":"关键词","height":38,"fontSize":36,"font":"Microsoft YaHei","color":"#ffffff"}},{"type":"List","props":{"y":32,"x":728,"width":329,"var":"list","height":74}}]},{"type":"Box","props":{"y":1060,"x":0,"var":"player"},"child":[{"type":"List","props":{"y":0,"x":0,"width":1080,"var":"playerList","height":400}}]}]},{"type":"Box","props":{"y":0,"x":0,"width":1080,"var":"eventResult","height":1460},"child":[{"type":"Button","props":{"y":593,"x":180,"width":720,"var":"resultSureBtn","stateNum":2,"skin":"common/button/btn_r_1.png","sizeGrid":"0,18,0,18","labelSize":36,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"确定","height":106}},{"type":"Image","props":{"y":102,"x":90,"width":283,"skin":"common/surface/slot.png","height":353,"sizeGrid":"6,6,6,6"}},{"type":"Image","props":{"y":149,"x":104,"var":"resultIcon","skin":"ui/card/32140.png/32140.png"}},{"type":"Label","props":{"y":505,"x":213,"width":860,"var":"resultContentLabel","text":"白起一直有一个问题,找一个人去帮助他","height":84,"fontSize":36,"font":"Microsoft YaHei","color":"#ffffff"}},{"type":"Image","props":{"y":115,"x":395,"skin":"main/powerbg.png"}},{"type":"Image","props":{"y":275,"x":394,"width":599,"skin":"main/frame_chat.png","height":171}},{"type":"Label","props":{"y":305,"x":423,"width":621,"var":"magLabel","text":"白起一直有一个问题,找一个人去帮助他","height":124,"fontSize":36,"font":"Microsoft YaHei","color":"#ffffff"}},{"type":"Label","props":{"y":185,"x":378,"width":277,"var":"scoreLabel","text":"0","height":36,"fontSize":36,"font":"Microsoft YaHei","color":"#ffffff","align":"center"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}