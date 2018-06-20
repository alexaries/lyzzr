/**Created by the LayaAirIDE,do not modify.*/
package ui.tavern {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class TavernViewUI extends View {
		public var panel:Panel;
		public var stone:Box;
		public var gold:Box;
		public var tuBtn:Button;
		public var rightBtn:Button;
		public var leftBtn:Button;
		public var oneBtn:Button;
		public var tenBtn:Button;
		public var timeTxt:Text;
		public var leftTxt:Text;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"y":0,"x":0,"width":1080,"height":1920,"alpha":1},"child":[{"type":"Image","props":{"y":0,"x":-110,"width":1300,"skin":"ui/bgImg/1011.png","height":1920}},{"type":"Panel","props":{"y":0,"x":70,"width":940,"var":"panel","height":1920,"hScrollBarSkin":"222"},"child":[{"type":"Box","props":{"y":-50,"x":31,"var":"stone"},"child":[{"type":"Image","props":{"y":251,"x":37,"width":840,"skin":"ui/lottery/back_cardluck_getflower.mat/back_cardluck_getflower_Alpha.png","height":1297}},{"type":"Image","props":{"y":251,"x":18,"width":840,"skin":"ui/lottery/back_cardluck_getflower.mat/back_cardluck_getflower_RGB.png","sizeGrid":"0,40,0,40","height":1297}}]},{"type":"Box","props":{"y":-50,"x":1080,"var":"gold"},"child":[{"type":"Image","props":{"y":251,"x":37,"width":840,"skin":"ui/lottery/back_cardluck_getflower.mat/back_cardluck_getflower_Alpha.png","height":1297}},{"type":"Image","props":{"y":251,"x":18,"width":840,"skin":"ui/lottery/back_cardluck_getpetal.mat/back_cardluck_getpetal_RGB.png","sizeGrid":"0,40,0,40","height":1297}}]}]},{"type":"Button","props":{"y":112,"x":882,"width":174,"var":"tuBtn","stateNum":2,"skin":"common/button/btn_b_1.png","labelStrokeColor":"#000000","labelStroke":2,"labelSize":32,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"兑换","height":79}},{"type":"Button","props":{"y":801,"x":977,"width":75,"var":"rightBtn","stateNum":1,"skin":"common/button/bn_dir.png","labelStrokeColor":"#000000","labelStroke":2,"labelSize":32,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#feffec","height":119}},{"type":"Button","props":{"y":801,"x":107,"width":75,"var":"leftBtn","stateNum":1,"skin":"common/button/bn_dir.png","skewY":180,"labelStrokeColor":"#000000","labelStroke":2,"labelSize":32,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#feffec","height":119}},{"type":"Button","props":{"y":1458,"x":280,"width":174,"var":"oneBtn","stateNum":2,"skin":"common/button/btn_b_1.png","skewY":0,"labelStrokeColor":"#000000","labelStroke":0,"labelSize":32,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"买一次","height":79}},{"type":"Button","props":{"y":1458,"x":650,"width":174,"var":"tenBtn","stateNum":2,"skin":"common/button/btn_r_1.png","skewY":0,"labelStrokeColor":"#000000","labelStroke":0,"labelSize":32,"labelPadding":"-5","labelFont":"Microsoft YaHei","labelColors":"#feffec","label":"买十次","height":79}},{"type":"Image","props":{"y":1545,"x":235,"skin":"common/surface/bg_gain_benifit.png"}},{"type":"Image","props":{"y":1545,"x":602,"skin":"common/surface/bg_gain_benifit.png"}},{"type":"Text","props":{"y":1413,"x":253,"width":267,"var":"timeTxt","text":"00:00:00 后免费","height":46,"fontSize":32,"font":"Microsoft YaHei","color":"#000000"}},{"type":"Text","props":{"y":1635,"x":534,"width":523,"var":"leftTxt","text":"今日剩余购买次数：999999/999999","height":46,"fontSize":32,"font":"Microsoft YaHei","color":"#000000","align":"right"}}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}