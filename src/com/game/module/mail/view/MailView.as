package com.game.module.mail.view
{
	import com.game.common.mvc.BaseMediator;
	import com.game.common.view.BaseWindow;
	import com.game.module.mail.mediator.MailMediator;
	
	import ui.mail.MailUI;
	
	public class MailView extends BaseWindow
	{
		private var _ui:MailUI;
		public function MailView(resArray:Array=null)
		{
			super(resArray);
		}
		
		override public function getMediator():BaseMediator {
			return new MailMediator(this);
		}
		
		override public function onComplete():void {
			__onComplete();
			super.onComplete();
		}
		
		
		private function __onComplete():void {
			_ui = new MailUI();
			addChild(_ui);
		}
		
	}
}