/**Created by the LayaAirIDE,do not modify.*/
package ui.jiban {
	import laya.ui.*;
	import laya.display.*; 

	public class JibanInfoViewUI extends View {
		public var levelTxt:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1300,"height":1920},"child":[{"type":"Button","props":{"y":45,"x":35,"stateNum":1,"skin":"common/button/btn_back.png"}},{"type":"Label","props":{"y":1634,"x":45,"width":122,"var":"levelTxt","text":"Lv.30/30","height":30,"fontSize":35,"color":"#000000"}},{"type":"Label","props":{"y":1560,"x":167,"width":122,"text":"99999","height":30,"fontSize":35}},{"type":"Label","props":{"y":1563,"x":429,"width":122,"text":"999999","height":30,"fontSize":35}},{"type":"Label","props":{"y":1562,"x":688,"width":122,"text":"99999","height":30,"fontSize":35}},{"type":"Label","props":{"y":1562,"x":939,"width":122,"text":"99999","height":30,"fontSize":35}},{"type":"Label","props":{"y":1639,"x":910,"width":122,"text":"99999/999999","height":30,"fontSize":35}},{"type":"Label","props":{"y":1776,"x":66,"width":939,"text":"亟盼等级已经达到上限，亟盼 进化后可鞥工进","height":122,"fontSize":35}},{"type":"Label","props":{"y":142,"x":423,"width":257,"text":"白旗。星空之吻","height":49,"fontSize":35}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}