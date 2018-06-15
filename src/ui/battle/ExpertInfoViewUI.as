/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class ExpertInfoViewUI extends View {
		public var bg:Image;
		public var icon:Image;
		public var contentLabel:Label;
		public var freeBtn:Button;
		public var hireBtn:Button;
		public var hireLabel:Label;
		public var upBtn:Button;
		public var upLabel:Label;
		public var nameLabel:Label;
		public var levelLabel:Label;
		public var propertyLabel:Label;
		public var propertyList:List;
		public var propertyContainer:Box;
		public var descLabel_1:Label;
		public var descLabel_2:Label;
		public var descLabel_3:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1300,"height":1920},"child":[{"type":"Image","props":{"y":240,"x":55,"width":1190,"var":"bg","skin":"comp/hscroll.png","sizeGrid":"1,1,1,1","height":1440}},{"type":"Image","props":{"y":359,"x":128,"width":368,"skin":"common/surface/slot.png","height":515,"sizeGrid":"6,6,6,6"}},{"type":"Image","props":{"y":268,"x":13,"width":600,"var":"icon","skin":"ui/dialog/head/101.png","height":600}},{"type":"Image","props":{"y":884,"x":100,"width":1100,"skin":"common/surface/partition_line_2.png","sizeGrid":"0,13,0,13"}},{"type":"Image","props":{"y":1014,"x":100,"width":1100,"skin":"common/surface/partition_line_2.png","sizeGrid":"0,13,0,13"}},{"type":"Label","props":{"y":910,"x":138,"wordWrap":true,"width":1024,"var":"contentLabel","text":"我是一个甜点师，最喜欢可爱的东西。如果你也是个可爱的人的话，我们一定可以好好相处哦。","height":84,"fontSize":42,"color":"#000000"}},{"type":"Button","props":{"y":1480,"x":252,"width":316,"var":"freeBtn","stateNum":2,"skin":"common/button/btn_b_1.png","sizeGrid":"0,18,0,18","labelSize":32,"labelFont":"Arial","labelColors":"#ffffff","label":"休   假","height":91}},{"type":"Button","props":{"y":1480,"x":492,"width":316,"var":"hireBtn","stateNum":2,"skin":"common/button/btn_b_1.png","sizeGrid":"0,18,0,18","labelSize":32,"labelFont":"Arial","labelColors":"#ffffff","labelAlign":"left","label":"   雇佣","height":91},"child":[{"type":"Image","props":{"y":17,"x":230,"skin":"common/icon/silver.png"}},{"type":"Label","props":{"y":29,"x":103,"width":122,"var":"hireLabel","text":"2270","height":32,"fontSize":32,"font":"Arial","color":"#ffffff","align":"left"}}]},{"type":"Button","props":{"y":1480,"x":722,"width":316,"var":"upBtn","stateNum":2,"skin":"common/button/btn_r_1.png","sizeGrid":"0,18,0,18","labelSize":32,"labelFont":"Arial","labelColors":"#ffffff","labelAlign":"left","label":"   升级","height":91},"child":[{"type":"Image","props":{"y":17,"x":230,"skin":"common/icon/silver.png"}},{"type":"Label","props":{"y":29,"x":103,"width":122,"var":"upLabel","text":"2270","height":32,"fontSize":32,"font":"Arial","color":"#ffffff","align":"left"}}]},{"type":"Label","props":{"y":372,"x":700,"wordWrap":true,"width":300,"var":"nameLabel","text":"林萌萌","height":50,"fontSize":50,"color":"#000000","align":"center"}},{"type":"Label","props":{"y":408,"x":1015,"wordWrap":true,"width":191,"var":"levelLabel","text":"lv.1","height":36,"fontSize":36,"color":"#ff5fb8","align":"center"}},{"type":"Image","props":{"y":452,"x":559,"width":600,"skin":"common/surface/partition_line_2.png","sizeGrid":"0,13,0,13"}},{"type":"Label","props":{"y":478,"x":648,"wordWrap":true,"width":410,"var":"propertyLabel","text":"综艺 / 娱乐 / 广告","height":36,"fontSize":36,"color":"#000000","align":"center"}},{"type":"List","props":{"y":550,"x":615,"width":498,"var":"propertyList","height":172}},{"type":"Box","props":{"y":760,"x":593,"width":494,"var":"propertyContainer","height":100}},{"type":"Label","props":{"y":1080,"x":288,"wordWrap":true,"width":874,"var":"descLabel_1","text":"出生在一个普普通通的三口之家，从小很得服务的疼爱。","height":84,"fontSize":42,"color":"#000000"}},{"type":"Label","props":{"y":1200,"x":288,"wordWrap":true,"width":874,"var":"descLabel_2","text":"出生在一个普普通通的三口之家，从小很得服务的疼爱。","height":84,"fontSize":42,"color":"#000000"}},{"type":"Label","props":{"y":1330,"x":288,"wordWrap":true,"width":874,"var":"descLabel_3","text":"出生在一个普普通通的三口之家，从小很得服务的疼爱。","height":84,"fontSize":42,"color":"#000000"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}