package com.game.module.plot.view
{
	import com.game.common.mvc.BaseMediator;
	import com.game.common.view.BaseFrame;
	import com.game.consts.ResPath;
	import com.game.module.plot.mediator.PlotMediator;
	import com.signal.SignalDispatcher;
	
	import config.story.IstoryCfg;
	
	import laya.events.Event;
	
	import ui.plot.PlotViewUI;
	

	/**
	 *剧情 
	 * @author svn
	 * 
	 */	
	public class PlotView extends BaseFrame
	{
		private var _ui:PlotViewUI = null;
		public var nextSigle:SignalDispatcher = null;
		

		public function PlotView(resArray:Array=null)
		{
			super(resArray);
			
			nextSigle = new SignalDispatcher();
		}
		
		public function get data():Object
		{
			//return 10101;
			return _data;
		}
		
		override public function dispose():void 
		{
			_ui.bgImg.off(Event.CLICK, this, onClickbg);
			
			if(_dialogview != null)
			{
				_dialogview.dispose();
				_dialogview = null;
			}
			
			_vo = null;
			super.dispose();
		}
		
		
		
		override public function getMediator():BaseMediator {
			return new PlotMediator(this);
		}
		
		override public function onComplete():void {
			__onComplete();
			super.onComplete();
		}
		
		private var _dialogview:DialogView = null;
		private function showDialog():void
		{
			trace("plotview.showDialog");
			if(_dialogview == null)
			{
				_dialogview = new DialogView();
				this.addChild(_dialogview);
				_dialogview.x = 57;
				_dialogview.y = 1169;
			}
			
			_dialogview.showDialog(_vo);
		}
		
		
		
		private var _vo:IstoryCfg = null;
		public function play(vo:IstoryCfg):void
		{
			
			_vo = vo;
			
			_ui.roleImg.skin = ResPath.getRole(_vo.role);
			_ui.bgImg.skin = ResPath.getStroyBG(_vo.bg);
			trace("vo.role:",vo.role);
			
			showDialog();
			
		}
		
		private function changeRole(value:String):void
		{
			_ui.roleImg.skin = value;
		}
		
		private function changebg(value:String):void
		{
			_ui.bgImg.skin = value;
		}
		
		
		private function __onComplete():void {

			init();
		}
		
		private function onClickbg():void
		{
			trace("plotview.onClickbg");
			if(_dialogview == null) return;
			if(_dialogview.isFinish == false)
			{
				_dialogview.finish();
			}
			else
			{
				nextSigle.dispatch(null);
			}
		}
		
		private function init():void
		{
			
			trace("plotview.init");
			_ui = new PlotViewUI();
			this.addChild(_ui);
			
			_ui.bgImg.on(Event.CLICK, this, onClickbg);
			
			/*_vo = new PlotVO();
			_vo.bg = "ui/bgImg/1031.png";
			_vo.role = "ui/role/10400.png";
			_vo.dialogDec = "真的么这，是真的么，是是超人超人超人超人超人超人";
			_vo.dialogHead = "ui/dialog/head/101.png";
			_vo.dialogRoleName = "AD械";
			_vo.nextid = 0;
			
			setPorxVO(_vo);*/
		}
	}
}