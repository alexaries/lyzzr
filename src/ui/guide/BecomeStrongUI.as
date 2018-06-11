/**Created by the LayaAirIDE,do not modify.*/
package ui.guide {
	import laya.ui.*;
	import laya.display.*; 
	import laya.html.dom.HTMLDivElement;

	public class BecomeStrongUI extends View {
		public var closeBtn:Button;
		public var strong:Sprite;
		public var tfHeroName:HTMLDivElement;
		public var tfCurr:HTMLDivElement;
		public var tfNext:HTMLDivElement;
		public var tfTip:HTMLDivElement;
		public var bmpGoods:Image;
		public var lstCurr:List;
		public var lstNext:List;
		public var container:Sprite;
		public var btnGotoTf:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":678,"height":820},"child":[{"type":"Image","props":{"y":8,"x":0,"width":678,"skin":"common/surface/top_title_bar_3.png"}},{"type":"Image","props":{"y":99,"x":2,"width":673,"skin":"main/common_bg.png","height":691,"sizeGrid":"5,5,5,5"}},{"type":"Button","props":{"y":12,"x":509,"var":"closeBtn","stateNum":1,"skin":"common/surface/close.png"}},{"type":"Label","props":{"y":17,"x":291,"width":96,"text":"变强","height":62,"fontSize":48,"font":"Microsoft YaHei","color":"#feffec","align":"center"}},{"type":"Image","props":{"y":346,"x":33,"width":611,"skin":"common/surface/partition_line_1.png","height":12,"sizeGrid":"3,13,3,12"}},{"type":"Image","props":{"y":0,"x":0,"width":678,"skin":"main/border_up_down.png","height":802,"sizeGrid":"24,0,24,0"}},{"type":"Image","props":{"y":9,"x":0,"width":678,"skin":"common/surface/border_left_right.png","sizeGrid":"10,10,10,10","height":782}},{"type":"Sprite","props":{"y":104,"x":36,"var":"strong"},"child":[{"type":"HTMLDivElement","props":{"y":260,"x":14,"width":400,"var":"tfHeroName","height":48}},{"type":"HTMLDivElement","props":{"y":343,"x":14,"width":400,"var":"tfCurr","height":48}},{"type":"HTMLDivElement","props":{"y":426,"x":14,"width":400,"var":"tfNext","height":48}},{"type":"HTMLDivElement","props":{"y":508,"x":14,"width":592,"var":"tfTip","height":68}},{"type":"Image","props":{"y":9,"x":11,"var":"bmpGoods"}},{"type":"List","props":{"y":9,"x":11,"width":600,"var":"lstCurr","height":"100"}},{"type":"List","props":{"y":119,"x":11,"width":600,"var":"lstNext","height":100}},{"type":"Sprite","props":{"y":0,"x":0,"var":"container"}},{"type":"Button","props":{"y":576,"x":194,"var":"btnGotoTf","skin":"common/button/btn_yellow_218_86.png","labelSize":40,"labelPadding":"-10","labelFont":"Microsoft YaHei","labelColors":"#ffffff","label":"关闭","stateNum":2}}]}]};
		override protected function createChildren():void {
			View.regComponent("HTMLDivElement",HTMLDivElement);
			super.createChildren();
			createView(uiView);

		}

	}
}