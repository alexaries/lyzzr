/**Created by the LayaAirIDE,do not modify.*/
package ui.copy {
	import laya.ui.*;
	import laya.display.*; 

	public class CopyInfoViewUI extends View {
		public var closeBtn:Button;
		public var icon:Image;
		public var infoLabel:Label;
		public var onceBtn:Button;
		public var costLabel:Label;
		public var fiveBtn:Button;
		public var startBtn:Button;
		public var list:List;
		public var propertyList:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Button","props":{"y":0,"x":-110,"width":1300,"var":"closeBtn","stateNum":1,"skin":"comp/textarea.png","sizeGrid":"2,2,2,2","height":1920,"alpha":0.01}},{"type":"Image","props":{"y":267,"x":-110,"width":1300,"skin":"common/surface/common_bg_3.png","sizeGrid":"2,2,2,2","height":1253,"alpha":1}},{"type":"Image","props":{"y":267,"x":-110,"width":1300,"skin":"comp/textarea.png","sizeGrid":"2,2,2,2","height":575,"alpha":0.5}},{"type":"Image","props":{"y":318,"x":50,"width":398,"var":"icon","skin":"ui/card/14600.png/14600.png","height":398}},{"type":"Label","props":{"y":498,"x":474,"wordWrap":true,"width":592,"var":"infoLabel","text":"我决定拍摄一部在线教小朋友绘画的网络节目，估计会有很多无聊的人来看吧","height":204,"fontSize":48,"font":"Microsoft YaHei"}},{"type":"Image","props":{"y":856,"x":84,"width":478,"skin":"common/surface/bg_gain_benifit.png","height":93}},{"type":"Label","props":{"y":867,"x":180,"wordWrap":true,"width":250,"text":"可能获得","height":48,"fontSize":48,"font":"Microsoft YaHei","color":"#ffffff","align":"center"}},{"type":"Button","props":{"y":1272,"x":68,"var":"onceBtn","stateNum":2,"skin":"common/button/btn_b_1.png","labelSize":28,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"重拍一次"}},{"type":"Image","props":{"y":1413,"x":543,"width":478,"skin":"common/surface/bg_gain_benifit.png","height":93}},{"type":"Label","props":{"y":1424,"x":616,"wordWrap":true,"width":286,"var":"costLabel","text":"消耗体力5","height":48,"fontSize":48,"font":"Microsoft YaHei","color":"#ffffff","align":"right"}},{"type":"Image","props":{"y":1426,"x":919,"skin":"common/icon/vigour.png"}},{"type":"Button","props":{"y":1272,"x":338,"var":"fiveBtn","stateNum":2,"skin":"common/button/btn_b_1.png","labelSize":28,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"重拍五次"}},{"type":"Button","props":{"y":1272,"x":768,"width":174,"var":"startBtn","stateNum":2,"skin":"common/button/btn_r_1.png","labelSize":28,"labelPadding":"-4","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"开始制作","height":79}},{"type":"List","props":{"y":965,"x":52,"width":976,"var":"list","height":277}},{"type":"List","props":{"y":319,"x":472,"width":539,"var":"propertyList","height":134}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}