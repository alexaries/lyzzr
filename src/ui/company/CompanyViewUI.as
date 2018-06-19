/**Created by the LayaAirIDE,do not modify.*/
package ui.company {
	import laya.ui.*;
	import laya.display.*; 

	public class CompanyViewUI extends View {
		public var closeBtn:Button;
		public var nameLabel:Label;
		public var changeBtn:Button;
		public var ruleBtn:Button;
		public var expBar:ProgressBar;
		public var levelLabel:Label;
		public var expLabel:Label;
		public var trainBtn:Button;
		public var moreBtn:Button;
		public var trainList:List;
		public var expertList:List;
		public var propertyList:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1300,"height":1920},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1300,"skin":"ui/bgImg/1021.png","height":1920}},{"type":"Button","props":{"y":0,"x":0,"var":"closeBtn","stateNum":1,"skin":"common/button/btn_back.png"}},{"type":"Image","props":{"y":108,"x":260,"width":780,"skin":"common/surface/bg_gain_benifit.png","height":78},"child":[{"type":"Label","props":{"y":18,"x":107,"width":566,"var":"nameLabel","text":"怨灵心宜影视公司","height":42,"fontSize":42,"font":"Arial","color":"#feffec","align":"center"}},{"type":"Button","props":{"y":3,"x":730,"var":"changeBtn","stateNum":2,"skin":"common/button/btn_blue_71_71.png","labelFont":"Arial","label":"改","sizeGrid":"8,8,8,8"}}]},{"type":"Button","props":{"y":95,"x":1114,"var":"ruleBtn","stateNum":2,"skin":"common/button/btn_r_1.png","labelFont":"Arial","labelColors":"#feffec","label":"规则"}},{"type":"Image","props":{"y":291,"x":129,"width":1041,"skin":"common/surface/bg_progress.png","height":34,"sizeGrid":"5,20,5,20"},"child":[{"type":"ProgressBar","props":{"y":4,"x":20,"width":1002,"var":"expBar","value":0.1,"skin":"common/surface/progress_green.png","height":26,"sizeGrid":"2,2,2,2"}},{"type":"Image","props":{"y":-61,"x":3,"width":212,"skin":"common/surface/map_name_bg.png","height":52},"child":[{"type":"Label","props":{"y":10,"x":28,"width":155,"var":"levelLabel","text":"LV.21","height":32,"fontSize":32,"font":"Arial","color":"#feffec","align":"center"}}]},{"type":"Image","props":{"y":-61,"x":894,"width":141,"skin":"common/surface/jindutiao.png","height":52,"sizeGrid":"0,16,0,16"},"child":[{"type":"Label","props":{"y":10,"x":-351,"width":328,"var":"expLabel","text":"0/1000","height":32,"fontSize":32,"font":"Arial","color":"#feffec","align":"right"}}]}]},{"type":"Image","props":{"y":496,"x":13,"skin":"common/surface/bg_gain_benifit.png"},"child":[{"type":"Label","props":{"y":10,"x":43,"width":182,"text":"公司部门","height":32,"fontSize":32,"font":"Arial","color":"#feffec","align":"center"}}]},{"type":"Button","props":{"y":841,"x":248,"width":803,"var":"trainBtn","stateNum":2,"skin":"common/button/btn_r_1.png","sizeGrid":"0,18,0,18","labelFont":"Arial","labelColors":"#feffec","label":"部门培训","height":79}},{"type":"Button","props":{"y":1761,"x":248,"width":803,"var":"moreBtn","stateNum":2,"skin":"common/button/btn_r_1.png","sizeGrid":"0,18,0,18","labelFont":"Arial","labelColors":"#feffec","label":"更多专家","height":79}},{"type":"List","props":{"y":572,"x":96,"width":1107,"var":"trainList","height":255}},{"type":"Image","props":{"y":945,"x":13,"skin":"common/surface/bg_gain_benifit.png"},"child":[{"type":"Label","props":{"y":10,"x":43,"width":182,"text":"我的专家","height":32,"fontSize":32,"font":"Arial","color":"#feffec","align":"center"}}]},{"type":"List","props":{"y":1032,"x":76,"width":1147,"var":"expertList","height":678}},{"type":"List","props":{"y":342,"x":96,"width":1107,"var":"propertyList","height":140}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}