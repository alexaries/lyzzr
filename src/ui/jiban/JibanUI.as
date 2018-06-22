/**Created by the LayaAirIDE,do not modify.*/
package ui.jiban {
	import laya.ui.*;
	import laya.display.*; 
	import ui.jiban.JibanItemUI;

	public class JibanUI extends View {
		public var tab:Tab;
		public var nameTab:Tab;
		public var list:List;
		public var back:Button;
		public var liushibtn:Button;
		public var splist:List;
		public var lslist:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1300,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1300,"skin":"ui/bgImg/1011.png","height":2635}},{"type":"Tab","props":{"y":145,"x":342,"var":"tab"},"child":[{"type":"Button","props":{"y":0,"x":0,"stateNum":2,"skin":"button/btn_wodjibananniu.png","selected":true,"labelSize":33,"labelPadding":"10,20,18","labelColors":"#f1fdfd,#f1fdfd","label":"我的羁绊"}},{"type":"Button","props":{"y":0,"x":257,"stateNum":2,"skin":"button/btn_jibansuipiananiu.png","selected":false,"labelStrokeColor":"#c1c1c1","labelSize":33,"labelPadding":"10,-10,20","labelColors":"#f1fdfd,#f1fdfd","label":"羁绊碎片"}}]},{"type":"Tab","props":{"y":267,"x":11,"var":"nameTab"},"child":[{"type":"Button","props":{"y":0,"x":0,"stateNum":2,"skin":"button/btn_yeqian.png","selected":true,"labelSize":33,"labelColors":"#f1fdfd,#f1fdfd","labelAlign":"center","label":"全部"}},{"type":"Button","props":{"y":0,"x":242,"stateNum":2,"skin":"button/btn_yeqian.png","selected":false,"labelSize":33,"labelColors":"#f1fdfd,#f1fdfd","labelAlign":"center","label":"全部"}},{"type":"Button","props":{"y":0,"x":484,"stateNum":2,"skin":"button/btn_yeqian.png","selected":false,"labelSize":33,"labelColors":"#f1fdfd,#f1fdfd","labelAlign":"center","label":"全部"}},{"type":"Button","props":{"y":0,"x":726,"stateNum":2,"skin":"button/btn_yeqian.png","selected":false,"labelSize":33,"labelColors":"#f1fdfd,#f1fdfd","labelAlign":"center","label":"全部"}},{"type":"Button","props":{"y":0,"x":968,"stateNum":2,"skin":"button/btn_yeqian.png","selected":false,"labelSize":33,"labelColors":"#f1fdfd,#f1fdfd","labelAlign":"center","label":"全部"}}]},{"type":"List","props":{"y":388,"x":51,"width":1214,"var":"list","repeatY":10,"repeatX":60,"height":1503},"child":[{"type":"JibanItem","props":{"y":0,"x":0,"runtime":"ui.jiban.JibanItemUI"}},{"type":"JibanItem","props":{"y":0,"x":420,"runtime":"ui.jiban.JibanItemUI"}},{"type":"JibanItem","props":{"y":0,"x":847,"runtime":"ui.jiban.JibanItemUI"}},{"type":"JibanItem","props":{"y":471,"x":0,"runtime":"ui.jiban.JibanItemUI"}},{"type":"JibanItem","props":{"y":471,"x":413,"runtime":"ui.jiban.JibanItemUI"}},{"type":"JibanItem","props":{"y":471,"x":832,"runtime":"ui.jiban.JibanItemUI"}}]},{"type":"Button","props":{"y":15,"x":38,"var":"back","stateNum":1,"skin":"button/btn_fanhui.png"}},{"type":"Button","props":{"y":143,"x":962,"var":"liushibtn","stateNum":2,"skin":"button/btn_liushianniu.png","labelSize":33,"labelPadding":"10,-35,20","labelColors":"#f1fdfd,#f1fdfd","label":"流逝羁绊"},"child":[{"type":"Image","props":{"y":24,"x":34,"skin":"icon/liushiicon.png"}}]},{"type":"List","props":{"y":388,"x":51,"width":1214,"var":"splist","repeatY":10,"repeatX":60,"height":1503},"child":[{"type":"JibanItem","props":{"y":0,"x":0,"runtime":"ui.jiban.JibanItemUI"}},{"type":"JibanItem","props":{"y":0,"x":420,"runtime":"ui.jiban.JibanItemUI"}},{"type":"JibanItem","props":{"y":0,"x":847,"runtime":"ui.jiban.JibanItemUI"}},{"type":"JibanItem","props":{"y":471,"x":0,"runtime":"ui.jiban.JibanItemUI"}},{"type":"JibanItem","props":{"y":471,"x":413,"runtime":"ui.jiban.JibanItemUI"}},{"type":"JibanItem","props":{"y":471,"x":832,"runtime":"ui.jiban.JibanItemUI"}}]},{"type":"List","props":{"y":388,"x":51,"width":1214,"var":"lslist","repeatY":10,"repeatX":60,"height":1503},"child":[{"type":"JibanItem","props":{"y":0,"x":0,"runtime":"ui.jiban.JibanItemUI"}},{"type":"JibanItem","props":{"y":0,"x":420,"runtime":"ui.jiban.JibanItemUI"}},{"type":"JibanItem","props":{"y":0,"x":847,"runtime":"ui.jiban.JibanItemUI"}},{"type":"JibanItem","props":{"y":471,"x":0,"runtime":"ui.jiban.JibanItemUI"}},{"type":"JibanItem","props":{"y":471,"x":413,"runtime":"ui.jiban.JibanItemUI"}},{"type":"JibanItem","props":{"y":471,"x":832,"runtime":"ui.jiban.JibanItemUI"}}]}]};
		override protected function createChildren():void {
			View.regComponent("ui.jiban.JibanItemUI",JibanItemUI);
			super.createChildren();
			createView(uiView);

		}

	}
}