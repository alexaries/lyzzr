/**Created by the LayaAirIDE,do not modify.*/
package ui.jiban {
	import laya.ui.*;
	import laya.display.*; 

	public class JibanInfoViewUI extends View {
		public var tab:Tab;
		public var nameTxt:Label;
		public var roleShow:Box;
		public var sssImg:Image;
		public var roleGift:Box;
		public var giftBtn:Button;
		public var jibanBtn:Button;
		public var jbsj:Box;
		public var expTxt:Label;
		public var attack4Txt:Label;
		public var attack3Txt:Label;
		public var attack2Txt:Label;
		public var attack1Txt:Label;
		public var levelTxt:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1300,"height":1920},"child":[{"type":"Tab","props":{"y":1451,"x":10,"var":"tab"},"child":[{"type":"Button","props":{"y":0,"x":306,"stateNum":2,"skin":"button/btn_liushianniu.png","name":"item1","labelStrokeColor":"#ffffff","labelSize":33,"labelColors":"#f1fdfd,#f1fdfd","label":"羁绊升星"}},{"type":"Button","props":{"y":0,"x":593,"stateNum":2,"skin":"button/btn_jibansuipiananiu.png","name":"item2","labelSize":33,"labelColors":"#f1fdfd,#f1fdfd","label":"羁绊进化"}},{"type":"Button","props":{"y":0,"x":0,"stateNum":2,"skin":"button/btn_wodjibananniu.png","name":"item0","labelSize":33,"labelColors":"#f1fdfd,#f1fdfd","label":"羁绊升级"}}]},{"type":"Image","props":{"y":1529,"x":-83,"width":1330,"skin":"surface/shuxingdi.png","sizeGrid":"1,1,1,1","height":500,"alpha":0.8}},{"type":"Label","props":{"y":148,"x":280,"width":515,"var":"nameTxt","text":"白旗。星空之吻","height":49,"fontSize":40,"color":"#fffdfd","align":"center"}},{"type":"Box","props":{"y":238,"x":144,"var":"roleShow"},"child":[{"type":"Image","props":{"y":0,"x":0,"width":786,"skin":"ui/rolePic/1001.png","height":1190}},{"type":"Image","props":{"y":11,"x":31,"width":195,"var":"sssImg","skin":"icon/icon_quality_3.png","height":200}}]},{"type":"Box","props":{"y":832,"x":520,"width":805,"var":"roleGift","pivotY":596,"pivotX":396,"height":1207},"child":[{"type":"Image","props":{"y":0,"x":0,"width":805,"skin":"surface/shuxingdi.png","sizeGrid":"1,1,1,1","height":1207,"alpha":0.8}}]},{"type":"Button","props":{"y":1094,"x":926,"width":77,"var":"giftBtn","stateNum":2,"skin":"button/btn_liushianniu.png","label":"gift","height":337}},{"type":"Button","props":{"y":1098,"x":926,"width":77,"var":"jibanBtn","stateNum":2,"skin":"button/btn_liushianniu.png","label":"jiban","height":337}},{"type":"Box","props":{"var":"jbsj"},"child":[{"type":"Label","props":{"y":1776,"x":66,"width":939,"text":"亟盼等级已经达到上限，亟盼 进化后可鞥工进","height":122,"fontSize":35}},{"type":"Label","props":{"y":1639,"x":910,"width":250,"var":"expTxt","text":"99999/999999","height":44,"fontSize":35}},{"type":"Label","props":{"y":1562,"x":939,"width":122,"var":"attack4Txt","text":"99999","height":30,"fontSize":35}},{"type":"Label","props":{"y":1562,"x":688,"width":122,"var":"attack3Txt","text":"99999","height":30,"fontSize":35}},{"type":"Label","props":{"y":1563,"x":429,"width":122,"var":"attack2Txt","text":"999999","height":30,"fontSize":35}},{"type":"Label","props":{"y":1560,"x":167,"width":122,"var":"attack1Txt","text":"99999","height":30,"fontSize":35}},{"type":"Label","props":{"y":1634,"x":45,"width":122,"var":"levelTxt","text":"Lv.30/30","height":30,"fontSize":35,"color":"#000000"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}