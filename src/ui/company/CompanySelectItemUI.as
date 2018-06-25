/**Created by the LayaAirIDE,do not modify.*/
package ui.company {
	import laya.ui.*;
	import laya.display.*; 

	public class CompanySelectItemUI extends View {
		public var numLabel:Label;
		public var timeLabel:Label;
		public var nameLabel:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":215,"height":250},"child":[{"type":"Image","props":{"y":0,"x":0,"width":215,"skin":"surface/shuxing1.png","height":250}},{"type":"Image","props":{"y":0,"x":173,"width":42,"skin":"surface/aixindi.png","height":37},"child":[{"type":"Label","props":{"y":9,"x":5,"width":32,"var":"numLabel","text":"1","height":18,"fontSize":18,"color":"#f1fdfd","align":"center"}}]},{"type":"Label","props":{"y":61,"x":36,"width":143,"var":"timeLabel","text":"05:00","height":48,"fontSize":48,"color":"#f1fdfd","align":"center"}},{"type":"Label","props":{"y":125,"x":21,"width":173,"var":"nameLabel","text":"基础公关","height":32,"fontSize":32,"color":"#65565c","align":"center"}},{"type":"Image","props":{"y":197,"x":86,"skin":"surface/aixinshang.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}