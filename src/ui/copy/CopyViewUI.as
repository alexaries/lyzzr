/**Created by the LayaAirIDE,do not modify.*/
package ui.copy {
	import laya.ui.*;
	import laya.display.*; 

	public class CopyViewUI extends View {
		public var panel:Panel;
		public var bg:Image;
		public var list:List;
		public var closeBtn:Button;
		public var combox:ComboBox;
		public var chapterLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Panel","props":{"x":-110,"width":1300,"var":"panel","vScrollBarSkin":"scrollv","height":1920,"hScrollBarSkin":"scrollh"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1800,"var":"bg","skin":"ui/bg/back_investigate_1.png/back_investigate_1.png","height":2500}},{"type":"List","props":{"width":1800,"var":"list","height":2500}}]},{"type":"Button","props":{"y":340,"x":0,"var":"closeBtn","stateNum":1,"skin":"common/button/btn_back.png"}},{"type":"Image","props":{"y":52,"x":516,"skin":"common/surface/bg_gain_benifit.png"}},{"type":"ComboBox","props":{"y":42,"x":304,"width":240,"var":"combox","stateNum":3,"skin":"common/surface/combobox.png","sizeGrid":"10,18,8,16","selectedIndex":0,"scrollBarSkin":"scrollv","labels":"第一章,第二章,第三章,第四章,第五章,第六章,第七章","labelSize":32,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#feffec","itemSize":40,"height":70}},{"type":"Label","props":{"y":61,"x":532,"width":236,"var":"chapterLabel","text":"最后的节目","height":24,"fontSize":24,"font":"Microsoft YaHei","color":"#feffec","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}