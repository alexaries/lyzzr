/**Created by the LayaAirIDE,do not modify.*/
package ui.main.icons {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class BaseIconViewUI extends View {
		public var imgIcon:Image;
		public var txtBg:Image;
		public var txtName:Text;
		public var redCon:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":132,"height":161},"child":[{"type":"Image","props":{"y":0,"x":2,"width":127,"var":"imgIcon","skin":"main/icons/beibao.png","height":135}},{"type":"Image","props":{"y":109,"x":0,"var":"txtBg","skin":"main/img_btn_charge.png"}},{"type":"Text","props":{"y":119,"x":0,"width":132,"var":"txtName","text":"七日狂欢","height":34,"fontSize":24,"font":"Microsoft YaHei","color":"#8bb6ff","align":"center"}},{"type":"Sprite","props":{"y":8,"x":88,"var":"redCon"}}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}