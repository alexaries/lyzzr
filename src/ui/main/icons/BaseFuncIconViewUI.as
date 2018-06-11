/**Created by the LayaAirIDE,do not modify.*/
package ui.main.icons {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class BaseFuncIconViewUI extends View {
		public var bg:Image;
		public var icon:Image;
		public var nameBg:Image;
		public var lockBox:Box;
		public var lock:Image;
		public var txtDesc:Label;
		public var bDesc:Box;
		public var txtDesc2Bg:Image;
		public var txtDesc2:Label;
		public var redCon:Sprite;
		public var txtName:Text;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":190,"height":176},"child":[{"type":"Image","props":{"y":0,"x":34,"width":122,"var":"bg","skin":"main/bg_function_icon.png","height":122}},{"type":"Image","props":{"y":0,"x":43,"width":106,"var":"icon","skin":"main/icons/jineng.png","height":112,"gray":true}},{"type":"Image","props":{"y":83,"x":21,"width":147,"var":"nameBg","skin":"main/img_btn_charge.png","height":42}},{"type":"Box","props":{"y":14,"x":43,"var":"lockBox"},"child":[{"type":"Image","props":{"x":3,"var":"lock","skin":"main/lock.png"}},{"type":"Label","props":{"y":32,"x":0,"width":103,"var":"txtDesc","text":"8级开启","height":32,"fontSize":24,"font":"Microsoft YaHei","color":"#feffec","align":"center"}}]},{"type":"Box","props":{"y":123,"x":-39,"var":"bDesc"},"child":[{"type":"Image","props":{"var":"txtDesc2Bg","skin":"common/surface/bg_gain_benifit.png"}},{"type":"Label","props":{"y":8,"x":39,"width":190,"var":"txtDesc2","text":"00:59:59后可领","height":33,"fontSize":25,"font":"Microsoft YaHei","color":"#feffec","align":"center"}}]},{"type":"Sprite","props":{"y":8,"x":126,"var":"redCon"}},{"type":"Text","props":{"y":88,"x":0,"width":190,"var":"txtName","text":"100级奖励","height":34,"fontSize":24,"font":"Microsoft YaHei","color":"#8bb6ff","align":"center"}}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}