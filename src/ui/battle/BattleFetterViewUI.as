/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 
	import laya.html.dom.HTMLDivElement;

	public class BattleFetterViewUI extends View {
		public var pre:Box;
		public var preIcon:Image;
		public var contentHtml:HTMLDivElement;
		public var prefetterBtn:Button;
		public var info:Box;
		public var sureBtn:Button;
		public var needList:List;
		public var lastBtn:Button;
		public var selectedList:List;
		public var propertyList:List;
		public var tab:Tab;
		public var playerList:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1300,"height":1720},"child":[{"type":"Box","props":{"width":1300,"var":"pre","height":1720},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1300,"skin":"common/surface/common_bg_3.png","sizeGrid":"1,1,1,1","height":960}},{"type":"Image","props":{"y":224,"x":341,"width":618,"var":"preIcon","skin":"ui/dialog/head/101.png","height":618}},{"type":"HTMLDivElement","props":{"y":84,"x":174,"width":952,"var":"contentHtml","innerHTML":"经历了一次又一次的艰难，我的双脚已经无法迈动。我的双眼已经不再清明。就在我无力挣扎即将放弃，失去亲和力和创造力的时候，心中突然闪过了他的影子......","height":274}},{"type":"Button","props":{"y":817,"x":290,"width":720,"var":"prefetterBtn","stateNum":2,"skin":"common/button/btn_r_1.png","sizeGrid":"0,18,0,18","labelSize":36,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"召唤羁绊","height":106}}]},{"type":"Box","props":{"y":0,"x":0,"width":1300,"var":"info"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1300,"skin":"common/surface/common_bg_3.png","sizeGrid":"1,1,1,1","height":850}},{"type":"Button","props":{"y":713,"x":290,"width":720,"var":"sureBtn","stateNum":2,"skin":"common/button/btn_r_1.png","sizeGrid":"0,18,0,18","labelSize":36,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"确定","height":106}},{"type":"Label","props":{"y":143,"x":89,"width":164,"text":"实力需求:","height":41,"fontSize":28,"font":"Microsoft YaHei","color":"#feffec"}},{"type":"List","props":{"y":146,"x":232,"width":550,"var":"needList","height":43}},{"type":"Button","props":{"y":127,"x":905,"var":"lastBtn","stateNum":2,"skin":"common/button/btn_r_1.png","labelSize":28,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"上次召唤"}},{"type":"List","props":{"y":247,"x":182,"width":936,"var":"selectedList","height":245}},{"type":"List","props":{"y":515,"x":182,"width":936,"var":"propertyList","height":174}},{"type":"Tab","props":{"y":911,"x":124,"var":"tab"},"child":[{"type":"Button","props":{"width":200,"stateNum":2,"skin":"common/button/btn_tab_bg.png","name":"item0","labelSize":28,"labelPadding":"-4","label":"全部","height":78}},{"type":"Button","props":{"x":213,"width":200,"stateNum":2,"skin":"common/button/btn_tab_bg.png","name":"item1","labelSize":28,"labelPadding":"-4","label":"决策力","height":78}},{"type":"Button","props":{"x":426,"width":200,"stateNum":2,"skin":"common/button/btn_tab_bg.png","name":"item2","labelSize":28,"labelPadding":"-4","label":"创造力","height":78}},{"type":"Button","props":{"x":638,"width":200,"stateNum":2,"skin":"common/button/btn_tab_bg.png","name":"item3","labelSize":28,"labelPadding":"-4","label":"亲和力","height":78}},{"type":"Button","props":{"x":851,"width":200,"stateNum":2,"skin":"common/button/btn_tab_bg.png","name":"item4","labelSize":28,"labelPadding":"-4","label":"行动力","height":78}}]},{"type":"List","props":{"y":1004,"x":147,"width":1005,"var":"playerList","height":700}}]}]};
		override protected function createChildren():void {
			View.regComponent("HTMLDivElement",HTMLDivElement);
			super.createChildren();
			createView(uiView);

		}

	}
}