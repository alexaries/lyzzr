package com.game.module.mail.mediator
{
	import com.game.common.mvc.BaseMediator;
	import com.game.module.mail.view.MailView;
	
	import org.puremvc.as3.interfaces.IMediator;
	
	public class MailMediator extends BaseMediator implements IMediator
	{
		public function MailMediator(viewComponent:Object=null)
		{
			super("MailMediator", viewComponent);
		}
		
		
		private function get view():MailView {
			return getViewComponent() as MailView;	
		}
		
		override public function onRegister():void {
			super.onRegister();
			
		}
	}
}