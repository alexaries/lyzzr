package com.game.module.jiban.mediator
{
	import com.game.common.events.MenuWindowVO;
	import com.game.common.mvc.BaseMediator;
	import com.game.module.jiban.proxy.JibanProxy;
	import com.game.module.jiban.view.JibanView;
	import com.game.module.jiban.vo.JibanVO;
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
		
		private var _jibanproxy:JibanProxy = null;
		private function get jibanproxy():JibanProxy
		{
			if(_jibanproxy == null)
				_jibanproxy = facade.retrieveProxy(JibanProxy.NAME) as JibanProxy;
			return _jibanproxy;
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
			if(_view == null)
				_view = getViewComponent() as JibanView;
			return _view;
		}
		
		override public function onRegister():void {
			super.onRegister();
			
			view.clickBackSignal.getSignal(this).listen(doClose)
			view.jibanitemsig.getSignal(this).listen(onClickjibanitem);
		}
		
		
		private function onClickjibanitem(vo:JibanVO):void
		{
			dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.JIBAN_INFOVIEW, MenuWindowVO.OPEN, vo)));
		}
		
		private function doClose():void
		{
			dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.JIBAN_VIEW, MenuWindowVO.CLOSE)));
		}
	}
}