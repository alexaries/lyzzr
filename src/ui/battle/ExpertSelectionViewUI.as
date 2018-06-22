/**Created by the LayaAirIDE,do not modify.*/
package ui.battle {
	import laya.ui.*;
	import laya.display.*; 

	public class ExpertSelectionViewUI extends View {
		public var bg:Image;
		public var selectedList:List;
		public var list:List;
		public var cancelBtn:Button;
		public var sureBtn:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1080,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":-110,"width":1300,"var":"bg","skin":"common/surface/common_bg_4.png","sizeGrid":"2,2,2,2","height":1920,"alpha":0.01}},{"type":"Image","props":{"y":295,"x":80,"width":920,"skin":"surface/bg_erjidi.png","sizeGrid":"13,9,6,9","height":1329}},{"type":"Image","props":{"y":307,"x":364,"width":352,"skin":"surface/iconditiao.png","height":88},"child":[{"type":"Label","props":{"y":20,"x":51,"width":249,"text":"专家筛选","height":48,"fontSize":48,"font":"Arial","color":"#f1fdfd","align":"center"}},{"type":"Label","props":{"y":137,"x":-245,"width":249,"text":"已选择的标签:","height":36,"fontSize":36,"font":"Arial","color":"#65565c","align":"left"}}]},{"type":"List","props":{"y":500,"x":168,"width":744,"var":"selectedList","height":142}},{"type":"Image","props":{"y":647,"x":124,"width":831,"skin":"common/surface/partition_line_2.png","height":14,"sizeGrid":"0,12,0,12"}},{"type":"List","props":{"y":670,"x":137,"width":805,"var":"list","height":632}},{"type":"Button","props":{"y":1398,"x":250,"var":"cancelBtn","stateNum":2,"skin":"button/btn_yeqian.png","labelSize":32,"labelFont":"Arial","labelColors":"#f1fdfd","label":"取 消"}},{"type":"Button","props":{"y":1398,"x":610,"var":"sureBtn","stateNum":2,"skin":"button/btn_yeqian.png","labelSize":32,"labelFont":"Arial","labelColors":"#f1fdfd","label":"确 定"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}