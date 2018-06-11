/**Created by the LayaAirIDE,do not modify.*/
package ui.dialog {
	import laya.ui.*;
	import laya.display.*; 

	public class OnekeyEquipUI extends View {
		public var iconBg:Image;
		public var icon:Image;
		public var eqNameLb:Label;
		public var changeBtn:Button;
		public var powerBox:Box;
		public var powerTxt:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":370,"height":440},"child":[{"type":"Box","props":{"y":0,"x":0},"child":[{"type":"Image","props":{"y":0,"x":0,"width":360,"skin":"common/surface/common_bg_3.png","sizeGrid":"1,1,1,1","height":430}},{"type":"Image","props":{"y":0,"x":0,"width":360,"skin":"common/surface/frame_tip.png","sizeGrid":"21,25,25,21","height":430}},{"type":"Image","props":{"y":70,"x":166,"skin":"module/onekeyeq/huawen.png"}},{"type":"Image","props":{"y":70,"x":200,"skin":"module/onekeyeq/huawen.png","scaleX":-1}},{"type":"Image","props":{"y":271,"x":8,"width":340,"skin":"common/surface/light_line.png","height":27}},{"type":"Image","props":{"y":18,"x":38,"width":296,"skin":"common/surface/map_name_bg.png"}},{"type":"Image","props":{"y":77,"x":106,"var":"iconBg","skin":"common/surface/frame_yellow.png"}},{"type":"Image","props":{"y":85,"x":114,"width":140,"var":"icon","skin":"","height":140}},{"type":"Label","props":{"y":22,"x":78,"wordWrap":false,"width":215,"var":"eqNameLb","text":"弑·五火遁龙剑","mouseEnabled":false,"height":35,"fontSize":32,"font":"Microsoft YaHei","color":"#ba4dff","align":"center"}},{"type":"Button","props":{"y":317,"x":72,"width":218,"var":"changeBtn","stateNum":2,"skin":"common/button/btn_blue_change.png","labelSize":32,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","label":"一键换装","height":86,"sizeGrid":"20,20,20,20"}},{"type":"Box","props":{"y":232,"x":66,"var":"powerBox"},"child":[{"type":"Image","props":{"skin":"main/zhan.png"}},{"type":"Image","props":{"y":17,"x":218,"skin":"common/surface/img_upArrow.png"}},{"type":"Label","props":{"y":12,"x":73,"wordWrap":false,"width":136,"var":"powerTxt","text":"999","mouseEnabled":false,"height":34,"fontSize":32,"font":"Microsoft YaHei","color":"#feffec","align":"center"}}]}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}