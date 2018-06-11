package com.game.module.dailytask.mediator
{
	import com.game.common.mvc.BaseMediator;
	import com.game.module.dailytask.view.DailytaskView;
	
	import org.puremvc.as3.interfaces.IMediator;
	
	public class DailyTaskMediator extends BaseMediator implements IMediator
	{
		public function DailyTaskMediator(viewComponent:Object=null)
		{
			super("DailyTaskMediator", viewComponent);
		}
		
		private function get view():DailytaskView {
			return getViewComponent() as DailytaskView;
		}
		
		override public function onRegister():void {
			super.onRegister();
			
		}
	}
}