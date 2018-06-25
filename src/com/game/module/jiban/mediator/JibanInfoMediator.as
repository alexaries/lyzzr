package com.game.module.jiban.mediator
{
	import com.game.common.mvc.BaseMediator;
	import com.game.module.jiban.view.JibanInfoView;
	
	import org.puremvc.as3.interfaces.IMediator;
	
	public class JibanInfoMediator extends BaseMediator implements IMediator
	{
		public static const NAME:String = "JibanInfoMediator"; 
		private var _view:JibanInfoView = null;
		public function JibanInfoMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		
		private function get view():JibanInfoView {
			if(_view == null)
				_view = getViewComponent() as JibanInfoView;
			return _view;
		}
		
		override public function onRegister():void {
			super.onRegister();
		
		}
		
	}
}