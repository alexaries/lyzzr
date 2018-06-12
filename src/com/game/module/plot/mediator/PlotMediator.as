package com.game.module.plot.mediator
{
	import com.game.common.events.MenuWindowVO;
	import com.game.common.mvc.BaseMediator;
	import com.game.events.NotiEvent;
	import com.game.module.menu.events.MenuEvent;
	import com.game.module.plot.view.PlotView;
	import com.game.module.plot.vo.PlotVO;
	import com.game.vo.MenuWinType;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	
	public class PlotMediator extends BaseMediator implements IMediator
	{
		private var _plots:Vector.<PlotVO> = null;
		private var _v:PlotView = null;
		private var _nowPlotvo:PlotVO = null;
		public function PlotMediator(viewComponent:Object=null)
		{
			super("PlotMediator", viewComponent);
			
			//_plotProxy = facade.retrieveProxy(PlotProxy.NAME) as PlotProxy;
		}
	
		private function get view():PlotView {
			return getViewComponent() as PlotView;
		}
		
		override public function onRegister():void {
			super.onRegister();
			view.nextSigle.getSignal(this).listen(doNextNode);
			
			_v = view;
			_plots = _v.data as Vector.<PlotVO>;
			
			
			start();
		}
		
		private function start():void
		{
			_nowPlotvo = _plots[0];
			doPlotVO(_nowPlotvo);
		}
		
		
		private function doPlotVO(value:PlotVO):void
		{
			_v.play(value);
		}
		
		private function getPlotVoByID(id:int):PlotVO
		{
			var vo:PlotVO = null;
			var len:int = _plots.length;
			for(var i:int = 0; i < len ;i ++)
			{
				vo = _plots[i];
				if(vo.id == id)
					return vo;
			}
			return null;
		}
		
		private function removeMenu():void
		{
			dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.PLOT_VIEW, MenuWindowVO.CLOSE)));
		}
		
		/**
		 *进入下一断内容  
		 * 
		 */		
		private function doNextNode():void
		{
			if(_nowPlotvo.nextid == 0)
			{
				//end
				removeMenu();
			}
			else
			{
				_nowPlotvo = getPlotVoByID(_nowPlotvo.id);
				doPlotVO(_nowPlotvo);
			}
		}
		
		
		/*override public function listNotificationInterests():Array {
			return [NotiEvent.PLOT_PLAY];
		}
		
		override public function handleNotification(notification:INotification):void {
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			
			switch (name) {
				case NotiEvent.PLOT_PLAY:
					_plots = body as Vector.<PlotVO>;
					break;
			}
		}*/
		
	}
}