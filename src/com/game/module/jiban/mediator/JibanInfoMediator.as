package com.game.module.jiban.mediator
{
	import com.game.common.mvc.BaseMediator;
	import com.game.module.jiban.view.JibanInfoView;
	
	import org.puremvc.as3.interfaces.IMediator;
	
	public class JibanInfoMediator extends BaseMediator implements IMediator
	{
		public static const NAME:String = "JibanInfoMediator"; 
		public function JibanInfoMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		
		private function get view():JibanInfoView {
			return getViewComponent() as JibanInfoView;
		}
	}
}