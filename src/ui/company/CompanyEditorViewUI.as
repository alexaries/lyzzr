/**Created by the LayaAirIDE,do not modify.*/
package ui.company {
	import laya.ui.*;
	import laya.display.*; 

	public class CompanyEditorViewUI extends View {
		public var bg:Image;
		public var nameLabel:Label;
		public var cancelBtn:Button;
		public var sureBtn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":980,"height":660},"child":[{"type":"Image","props":{"y":0,"x":0,"width":980,"var":"bg","skin":"common/surface/common_bg_3.png","height":660}},{"type":"Label","props":{"y":107,"x":125,"width":795,"var":"nameLabel","text":"当前公司名：怨灵心宜影视公司","height":48,"fontSize":48,"font":"Arial","color":"#000000"}},{"type":"TextInput","props":{"y":200,"x":130,"width":534,"type":"text","skin":"comp/textinput.png","sizeGrid":"1,1,1,1","promptColor":"#444444","prompt":"请输入新的公司名","height":104,"fontSize":48,"font":"Arial","color":"#000000","align":"center"}},{"type":"Label","props":{"y":228,"x":687,"width":189,"text":"公司","height":48,"fontSize":48,"font":"Arial","color":"#000000"}},{"type":"Label","props":{"y":337,"x":132,"width":503,"text":"确认后不能随意修改公司名","height":32,"fontSize":32,"font":"Arial","color":"#000000"}},{"type":"Button","props":{"y":473,"x":113,"width":294,"var":"cancelBtn","stateNum":2,"skin":"common/button/btn_b_1.png","sizeGrid":"0,18,0,18","labelSize":32,"labelFont":"Arial","labelColors":"#ffffff","label":"取消","height":97}},{"type":"Button","props":{"y":473,"x":573,"width":294,"var":"sureBtn","stateNum":2,"skin":"common/button/btn_r_1.png","sizeGrid":"0,18,0,18","labelSize":32,"labelFont":"Arial","labelColors":"#ffffff","label":"确定","height":97}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}