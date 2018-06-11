/**Created by the LayaAirIDE,do not modify.*/
package ui.loading {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class StartLoadingUI extends View {
		public var bg:Image;
		public var progressBarBg:Image;
		public var progressBar:ProgressBar;
		public var txtTips:Label;
		public var btnRefresh:Sprite;
		public var progressBarBg2:Image;
		public var progressBar2:ProgressBar;
		public var txtTips2:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1080,"var":"bg","skin":"module/loading/bg.png","height":1920}},{"type":"Image","props":{"y":1213,"x":171,"var":"progressBarBg","skin":"module/loading/loading_progress_bg.png"}},{"type":"ProgressBar","props":{"y":1219,"x":189,"width":702,"var":"progressBar","value":0.1,"skin":"module/loading/progress_loading.png","sizeGrid":"0,10,0,10"}},{"type":"Label","props":{"y":1451,"x":208,"wordWrap":true,"width":664,"var":"txtTips","valign":"top","text":"加载过程中显示的随机Tips","padding":"5","leading":5,"height":347,"fontSize":26,"font":"Microsoft YaHei","color":"#feffec","bold":false,"align":"center"}},{"type":"Image","props":{"y":1220,"x":1191,"width":281,"skin":"module/loading/loading_line.png","scaleX":-1,"height":5}},{"type":"Image","props":{"y":1221,"x":-110,"width":281,"skin":"module/loading/loading_line.png","height":5}},{"type":"Sprite","props":{"y":1660,"x":277,"var":"btnRefresh"},"child":[{"type":"Text","props":{"y":3,"text":"如果长时间无法进入游戏，请","height":50,"fontSize":30,"font":"Microsoft YaHei","color":"#feffec"}},{"type":"Button","props":{"x":389,"width":136,"stateNum":2,"labelSize":30,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#00ff00,#feffec","label":"点击刷新","height":50}}]},{"type":"Image","props":{"y":1290,"x":171,"var":"progressBarBg2","skin":"module/loading/loading_progress_bg.png"}},{"type":"ProgressBar","props":{"y":1296,"x":189,"width":702,"var":"progressBar2","value":0.1,"skin":"module/loading/progress_loading.png","sizeGrid":"0,10,0,10"}},{"type":"Label","props":{"y":1336,"x":208,"wordWrap":true,"width":664,"var":"txtTips2","valign":"top","text":"加载素材的名字","padding":"5","leading":5,"height":64,"fontSize":26,"font":"Microsoft YaHei","color":"#feffec","bold":false,"align":"center"}}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}