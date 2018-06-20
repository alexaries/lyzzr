/**Created by the LayaAirIDE,do not modify.*/
package ui.jipan {
	import laya.ui.*;
	import laya.display.*; 

	public class JipanUI extends View {
		public var back:Button;
		public var tab:Tab;
		public var nameTab:Tab;
		public var list:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1300,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1300,"skin":"ui/bgImg/1011.png","height":2635}},{"type":"Button","props":{"y":35,"x":25,"var":"back","stateNum":1,"skin":"common/button/btn_back.png","label":"label"}},{"type":"Tab","props":{"y":167,"x":469,"var":"tab"},"child":[{"type":"Button","props":{"y":1,"x":0,"stateNum":2,"skin":"common/button/btn_b_1.png","label":"我的羁绊"}},{"type":"Button","props":{"y":0,"x":218,"stateNum":2,"skin":"common/button/btn_b_1.png","label":"羁绊碎片"}}]},{"type":"Tab","props":{"y":297,"x":92,"var":"nameTab"},"child":[{"type":"Button","props":{"y":0,"x":0,"stateNum":2,"skin":"common/button/btn_b_1.png","label":"全部"}},{"type":"Button","props":{"y":0,"x":197,"stateNum":2,"skin":"common/button/btn_b_1.png","label":"胡哥"}},{"type":"Button","props":{"y":0,"x":394,"stateNum":2,"skin":"common/button/btn_b_1.png","label":"谢霆锋"}},{"type":"Button","props":{"y":0,"x":590,"stateNum":2,"skin":"common/button/btn_b_1.png","label":"张卫键"}},{"type":"Button","props":{"y":0,"x":787,"stateNum":2,"skin":"common/button/btn_b_1.png","label":"李连杰"}},{"type":"Button","props":{"y":0,"x":984,"stateNum":2,"skin":"common/button/btn_b_1.png","label":"其它"}}]},{"type":"List","props":{"y":389,"x":63,"width":1129,"var":"list","height":1467}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}