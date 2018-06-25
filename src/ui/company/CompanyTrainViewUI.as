/**Created by the LayaAirIDE,do not modify.*/
package ui.company {
	import laya.ui.*;
	import laya.display.*; 

	public class CompanyTrainViewUI extends View {
		public var closeBtn:Button;
		public var nameLabel:Label;
		public var levelLabel:Label;
		public var departList:List;
		public var propertyList:List;
		public var oneKeyBtn:Button;
		public var container:Box;
		public var emptyBox:Box;
		public var selectList:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":-110,"width":1300,"skin":"ui/bgImg/1022.png","height":1920}},{"type":"Button","props":{"y":0,"x":0,"var":"closeBtn","stateNum":1,"skin":"common/button/btn_back.png"}},{"type":"Image","props":{"y":108,"x":194,"width":691,"skin":"common/surface/bg_gain_benifit.png","height":78},"child":[{"type":"Label","props":{"y":18,"x":62,"width":566,"var":"nameLabel","text":"怨灵心宜影视公司","height":42,"fontSize":42,"font":"Arial","color":"#feffec","align":"center"}},{"type":"Label","props":{"y":18,"x":642,"width":248,"var":"levelLabel","text":"LV.21","height":42,"fontSize":42,"font":"Arial","color":"#feffec","align":"left"}}]},{"type":"List","props":{"y":207,"x":121,"width":838,"var":"departList","height":198}},{"type":"List","props":{"y":407,"x":137,"width":805,"var":"propertyList","height":132}},{"type":"Image","props":{"y":1600,"x":-110,"width":1300,"skin":"comp/hscroll.png","height":320}},{"type":"Image","props":{"y":601,"x":181,"width":717,"skin":"ui/dialog/head/101.png","height":717}},{"type":"Button","props":{"y":1463,"x":721,"width":476,"var":"oneKeyBtn","stateNum":2,"skin":"button/btn_jibansuipiananiu.png","sizeGrid":"0,2,0,38","labelSize":32,"labelFont":"Arial","labelColors":"#ffffff","label":"一键收取","height":103}},{"type":"Box","props":{"y":0,"x":0,"var":"container"}},{"type":"Box","props":{"var":"emptyBox"}},{"type":"List","props":{"y":1637,"x":0,"width":1080,"var":"selectList","height":250}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}