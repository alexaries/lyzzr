package com.game.module.achievement.view
{
	import com.game.common.mvc.BaseMediator;
	import com.game.common.view.BaseWindow;
	import com.game.consts.BaseLayer;
	import com.game.module.achievement.mediator.AchievementMediator;
	import com.game.module.map.mediator.MapMediator;
	import com.signal.SignalDispatcher;
	
	import laya.events.Event;
	
	import ui.achievement.AchievementUI;

	/**
	 *成就 
	 * @author AD
	 * 
	 */	
	public class AchievementView extends BaseWindow
	{
		public var closeSignal:SignalDispatcher;
		private var _ui:AchievementUI = null;
		public function AchievementView()
		{
			super();
			closeSignal = new SignalDispatcher();
			layer = BaseLayer.SPECIAL;
		}
		
		override public function getMediator():BaseMediator {
			return new AchievementMediator(this);
		}
		
		override public function onComplete():void {
			__onComplete();
			super.onComplete();
		}
		
		
		private function __onComplete():void {
			_ui = new AchievementUI();
			addChild(_ui);
			init();
		}
		
		private function init():void {
			_ui.closeBtn.on(Event.CLICK, this, onClickCloseBtn);
			
		}
		
		
		private function onClickCloseBtn(e:Event):void
		{
			trace("AchievementView:onClickCloseBtn");
			closeSignal.dispatch(null);
		}
		
		override public function dispose():void {
			super.dispose();
			_ui.closeBtn.off(Event.CLICK, this, onClickCloseBtn);
			closeSignal.dispose();
		}
	}
}