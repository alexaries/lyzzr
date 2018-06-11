/**Created by the LayaAirIDE,do not modify.*/
package ui.dialog {
	import laya.ui.*;
	import laya.display.*; 
	import laya.html.dom.HTMLDivElement;

	public class AlertUI extends Dialog {
		public var bg1:Image;
		public var bg2:Image;
		public var bg3:Image;
		public var bg4:Image;
		public var bar:Image;
		public var lineBg:Image;
		public var txtTitle:Label;
		public var txtContent:HTMLDivElement;
		public var btnOk:Button;
		public var btnCancel:Button;
		public var btnClose:Button;
		public var btnSure:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"Dialog","props":{"width":740,"height":500},"child":[{"type":"Image","props":{"y":103,"x":0,"width":740,"var":"bg1","skin":"common/surface/common_bg_4.png","height":386,"sizeGrid":"2,2,2,2"}},{"type":"Image","props":{"y":10,"x":0,"width":175,"var":"bg2","skin":"common/surface/border_left.png","height":480,"sizeGrid":"5,0,5,5"}},{"type":"Image","props":{"y":10,"x":565,"width":175,"var":"bg3","skin":"common/surface/border_right.png","height":480,"sizeGrid":"5,5,5,0"}},{"type":"Image","props":{"y":0,"x":173,"width":394,"var":"bg4","skin":"main/border_up_down.png","height":500,"sizeGrid":"24,0,24,0"}},{"type":"Image","props":{"y":11,"x":1,"width":740,"var":"bar","skin":"common/surface/top_title_bar_3.png","height":140}},{"type":"Image","props":{"y":356,"x":63,"width":614,"var":"lineBg","skin":"common/surface/partition_line_1.png","height":14,"sizeGrid":"3,13,3,12"}},{"type":"Label","props":{"y":27,"x":67,"width":606,"var":"txtTitle","text":"提示标题","height":65,"fontSize":45,"font":"Microsoft YaHei","color":"#e3d6ae","align":"center"}},{"type":"HTMLDivElement","props":{"y":119,"x":46,"wordWrap":true,"width":648,"var":"txtContent","valign":"middle","padding":"10","leading":10,"height":225,"fontSize":26,"font":"Microsoft YaHei","color":"#fbfeea","bold":true,"align":"center"}},{"type":"Button","props":{"y":383,"x":27,"width":218,"var":"btnOk","stateNum":2,"skin":"common/button/btn_blue_change.png","name":"ok","labelSize":30,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#ffffff,#ffffff","labelAlign":"center","label":"确 定","height":86,"sizeGrid":"20,20,20,20"}},{"type":"Button","props":{"y":383,"x":495,"width":218,"var":"btnCancel","stateNum":2,"skin":"common/button/btn_blue_change.png","name":"cancel","labelSize":30,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#ffffff,#ffffff","labelAlign":"center","label":"取 消","height":86,"sizeGrid":"20,20,20,20"}},{"type":"Button","props":{"y":14,"x":578,"width":160,"var":"btnClose","stateNum":1,"skin":"common/surface/close.png","name":"close","height":91}},{"type":"Button","props":{"y":383,"x":261,"width":218,"var":"btnSure","stateNum":2,"skin":"common/button/btn_blue_change.png","name":"sure","labelSize":30,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#ffffff,#ffffff","labelAlign":"center","label":"确定并不再提示","height":86,"sizeGrid":"20,20,20,20"}}]};
		override protected function createChildren():void {
			View.regComponent("HTMLDivElement",HTMLDivElement);
			super.createChildren();
			createView(uiView);

		}

	}
}