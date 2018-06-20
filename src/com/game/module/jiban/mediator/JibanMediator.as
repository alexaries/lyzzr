package com.game.module.jiban.mediator
{
	import com.game.common.mvc.BaseMediator;
	import com.game.module.jiban.view.JibanView;
	
	import org.puremvc.as3.interfaces.IMediator;
	
	public class JibanMediator extends BaseMediator implements IMediator
	{
		public static const NAME:String = "JipanMediator";
		private var _view:JibanView = null;
		public function JibanMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		public function showMyJiban():void
		{
			
		}
		
		public function showJibanSuiPian():void
		{
			
		}
		
		public function showLiushi():void
		{
			
		}
		
		private function get view():JibanView {
			return getViewComponent() as JibanView;
		}
		
		override public function onRegister():void {
			super.onRegister();
			_view = view;
			
		}
	}
}