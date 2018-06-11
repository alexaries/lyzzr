package com.game.module.dailytask.view
{
	import com.game.common.mvc.BaseMediator;
	import com.game.common.view.BaseWindow;
	import com.game.module.dailytask.mediator.DailyTaskMediator;
	
	import ui.dailytask.DailyTaskUI;
	
	public class DailytaskView extends BaseWindow
	{
		
		private var _ui:DailyTaskUI = null;
		public function DailytaskView(resArray:Array=null)
		{
			super(resArray);
		}
		
		override public function getMediator():BaseMediator {
			return new DailyTaskMediator(this);
		}
		
		override public function onComplete():void {
			__onComplete();
			super.onComplete();
		}
		
		
		private function __onComplete():void {
			_ui = new DailyTaskUI();
			addChild(_ui);
			init();
		}
		
		private function init():void
		{
			
		}
	}
}