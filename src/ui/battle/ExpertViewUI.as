/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class ExpertViewUI extends View {
		public var closeBtn:Button;
		public var selectBtn:Button;
		public var cancelSelectBtn:Button;
		public var containerBox:Box;
		public var propertyList:List;
		public var panel:Panel;
		public var ownBox:Box;
		public var ownTitleBox:Box;
		public var ownLabel:Label;
		public var ownList:List;
		public var otherBox:Box;
		public var otherTitleBox:Box;
		public var otherLabel:Label;
		public var otherList:List;
		public var bottomLabel:Label;
		public var container:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1300,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1300,"skin":"common/surface/common_bg_3.png","sizeGrid":"1,1,1,1","height":1920}},{"type":"Button","props":{"y":0,"x":0,"var":"closeBtn","stateNum":1,"skin":"common/button/btn_back.png"}},{"type":"Button","props":{"y":105,"x":1111,"var":"selectBtn","stateNum":2,"skin":"common/button/btn_b_1.png","labelSize":32,"labelFont":"Arial","labelColors":"#feffec","label":"筛选"}},{"type":"Button","props":{"y":105,"x":1111,"var":"cancelSelectBtn","stateNum":2,"skin":"common/button/btn_b_1.png","labelSize":32,"labelFont":"Arial","labelColors":"#feffec","label":"取消"}},{"type":"Box","props":{"y":0,"x":0,"var":"containerBox"}},{"type":"List","props":{"y":140,"x":211,"width":877,"var":"propertyList","height":175}},{"type":"Panel","props":{"y":347,"x":0,"width":1300,"var":"panel","height":1500},"child":[{"type":"Box","props":{"y":0,"x":0,"var":"ownBox"},"child":[{"type":"Box","props":{"y":0,"x":0,"width":1300,"var":"ownTitleBox","height":50},"child":[{"type":"Label","props":{"y":9,"x":0,"width":244,"text":"特聘顾问","height":32,"fontSize":32,"font":"Arial","color":"#000000","align":"center"}},{"type":"Image","props":{"y":19,"x":275,"width":750,"skin":"common/surface/partition_line_1.png","sizeGrid":"3,13,3,12"}},{"type":"Label","props":{"y":9,"x":1042,"width":244,"var":"ownLabel","text":"顾问数量:6/6","height":32,"fontSize":32,"font":"Arial","color":"#000000","align":"left"}}]},{"type":"List","props":{"y":50,"x":67,"width":0,"var":"ownList","spaceY":20,"spaceX":20,"height":0}}]},{"type":"Box","props":{"y":1050,"x":0,"var":"otherBox"},"child":[{"type":"Box","props":{"y":0,"x":0,"width":1300,"var":"otherTitleBox","height":50},"child":[{"type":"Label","props":{"y":9,"x":0,"width":244,"text":"其他专家","height":32,"fontSize":32,"font":"Arial","color":"#000000","align":"center"}},{"type":"Image","props":{"y":19,"x":275,"width":750,"skin":"common/surface/partition_line_1.png","sizeGrid":"3,13,3,12"}},{"type":"Label","props":{"y":9,"x":1042,"width":244,"var":"otherLabel","text":"专家数量:6/6","height":32,"fontSize":32,"font":"Arial","color":"#000000","align":"left"}}]},{"type":"List","props":{"y":50,"x":67,"var":"otherList"}}]}]},{"type":"Image","props":{"y":1850,"x":0,"width":1300,"skin":"common/surface/mask_yellow.png","height":70},"child":[{"type":"Label","props":{"y":13,"x":170,"width":959,"var":"bottomLabel","text":"主线过关、人才市场（主线3-1开启）中可获得更多专家","height":32,"fontSize":32,"font":"Microsoft YaHei","color":"#333333","align":"center"}}]},{"type":"Sprite","props":{"var":"container"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}