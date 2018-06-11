/**Created by the LayaAirIDE,do not modify.*/
package ui.base {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class BaseFrameUI extends View {
		public var bg:Image;
		public var topBg:Image;
		public var banner:Image;
		public var bottomBg:Clip;
		public var btnClose:Button;
		public var btnReturn:Button;
		public var menuList:List;
		public var txtTitle:Label;
		public var msgSp:Sprite;
		public var txtMsg:Text;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":87,"x":0,"width":1080,"var":"bg","skin":"main/common_bg.png","height":1635,"sizeGrid":"5,5,5,5"}},{"type":"Image","props":{"y":101,"x":0,"width":1080,"var":"topBg","skin":"common/surface/common_bg_3.png","height":185}},{"type":"Image","props":{"y":0,"x":0,"width":1080,"var":"banner","skin":"common/surface/top_title_bar.png","sizeGrid":"5,10,10,166","height":99}},{"type":"Clip","props":{"y":1700,"x":0,"width":1080,"var":"bottomBg","skin":"common/button/btn_tab_bg.png","label":"label","index":0,"height":220,"clipY":2,"clipX":1}},{"type":"Clip","props":{"y":1700,"x":0,"width":220,"skin":"common/button/btn_tab_bg.png","label":"label","index":1,"height":220,"clipY":2,"clipX":1}},{"type":"Button","props":{"y":4,"x":920,"width":160,"var":"btnClose","stateNum":1,"skin":"common/surface/close.png","name":"frame_guanbi","height":90}},{"type":"Button","props":{"y":1700,"x":0,"width":220,"var":"btnReturn","stateNum":2,"name":"frame_fanhui","labelSize":60,"labelPadding":"50","labelFont":"Microsoft YaHei","labelColors":"#88a1c9,#fffe95","height":220}},{"type":"List","props":{"y":1677,"x":220,"width":859,"var":"menuList","skin":"comp/tab.png","repeatY":1,"labels":"label1,label2","labelSize":40,"height":245},"child":[{"type":"HScrollBar","props":{"name":"scrollBar"}}]},{"type":"Label","props":{"y":23,"x":49,"width":824,"var":"txtTitle","text":"商城","strokeColor":"#343232","stroke":4,"height":58,"fontSize":45,"font":"Microsoft YaHei","color":"#e3d6ae"}},{"type":"Image","props":{"y":1700,"x":220,"width":5,"skin":"common/surface/partition_line.png","height":220}},{"type":"Image","props":{"y":1723,"x":28,"width":106,"skin":"common/button/icon_return.png","scaleY":1.5,"scaleX":1.5,"mouseThrough":false,"mouseEnabled":false,"height":116}},{"type":"Sprite","props":{"y":613,"x":171,"var":"msgSp"},"child":[{"type":"Image","props":{"skin":"main/Q_role_alert.png"}},{"type":"Text","props":{"y":37,"x":66,"width":609,"var":"txtMsg","text":"text","height":79,"fontSize":40,"font":"Microsoft YaHei","color":"#ffffff","bold":true,"align":"center"}}]}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}