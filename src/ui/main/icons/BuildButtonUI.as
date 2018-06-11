/**Created by the LayaAirIDE,do not modify.*/
package ui.main.icons {
	import laya.ui.*;
	import laya.display.*; 
	import laya.html.dom.HTMLDivElement;

	public class BuildButtonUI extends View {
		public var close:Box;
		public var btnClose:Image;
		public var nameClose:HTMLDivElement;
		public var btnOpen:Image;
		public var redCon:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":54,"height":187},"child":[{"type":"Box","props":{"y":0,"x":0,"width":54,"var":"close","height":186},"child":[{"type":"Image","props":{"y":6,"x":0,"width":20,"var":"btnClose","skin":"main/icons/build_close.png","height":20}}]},{"type":"HTMLDivElement","props":{"y":3,"x":5,"width":44,"var":"nameClose","innerHTML":"<span style=\"width:45px;margin: 0 auto;line-height:50px;font-size:40px;color:#373737;font-family:'微软雅黑';align:center;\">许愿树</span>","height":169}},{"type":"Image","props":{"y":0,"x":1,"width":54,"var":"btnOpen","skin":"main/tiao.png","sizeGrid":"7,0,36,0","height":187},"child":[{"type":"Label","props":{"y":14,"x":9,"wordWrap":true,"width":36,"text":"许愿树","height":144,"fontSize":36,"font":"Microsoft YaHei","color":"#feffec"}}]},{"type":"Sprite","props":{"y":0,"x":22,"var":"redCon"}}]};
		override protected function createChildren():void {
			View.regComponent("HTMLDivElement",HTMLDivElement);
			super.createChildren();
			createView(uiView);

		}

	}
}