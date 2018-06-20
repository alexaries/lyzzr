package com.game.module.jipan.mediator
{
	import com.game.common.mvc.BaseMediator;
	import com.game.module.jipan.view.JipanView;
	
	import org.puremvc.as3.interfaces.IMediator;
	
	public class JipanMediator extends BaseMediator implements IMediator
	{
		public static const NAME:String = "JipanMediator";
		private var _view:JipanView = null;
		public function JipanMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		private function get view():JipanView {
			return getViewComponent() as JipanView;
		}
		
		override public function onRegister():void {
			super.onRegister();
			_view = view;
			
		}
	}
}