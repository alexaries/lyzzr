/**Created by the LayaAirIDE,do not modify.*/
package ui.base {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class BaseMenuUI extends View {
		public var icon:Image;
		public var txtName:Text;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":200,"height":245},"child":[{"type":"Clip","props":{"y":22,"x":0,"stateNum":2,"skin":"common/button/btn_tab_bg.png","index":1,"clipY":2,"clipX":1}},{"type":"Clip","props":{"y":3,"x":-3,"width":200,"skin":"common/button/clip_tab_selected.png","name":"selectBox","mouseEnabled":false,"layoutEnabled":false,"index":1,"height":0,"clipY":2,"clipX":1}},{"type":"Image","props":{"y":12,"x":197,"width":10,"skin":"common/surface/partition_line.png","height":220}},{"type":"Image","props":{"y":33,"x":20,"width":160,"var":"icon","skin":"ui/func_icon/1.png","height":160}},{"type":"Text","props":{"y":178,"x":0,"width":200,"var":"txtName","text":"法宝","mouseThrough":false,"mouseEnabled":false,"height":67,"fontSize":40,"font":"Microsoft YaHei","color":"#88a1c9","align":"center"}}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}