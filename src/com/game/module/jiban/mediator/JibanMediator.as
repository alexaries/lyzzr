package com.game.module.jiban.mediator
{
	import com.game.common.events.MenuWindowVO;
	import com.game.common.mvc.BaseMediator;
	import com.game.module.jiban.view.JibanView;
	import com.game.module.menu.events.MenuEvent;
	import com.game.vo.MenuWinType;
	
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
			
			_view.clickBackSignal.getSignal(this).listen(doClose)
			
		}
		
		private function doClose():void
		{
			dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.JIBAN_VIEW, MenuWindowVO.CLOSE)));
		}
	}
}