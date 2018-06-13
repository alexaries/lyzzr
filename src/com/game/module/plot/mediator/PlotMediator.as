package com.game.module.plot.mediator
{
	import com.game.common.events.MenuWindowVO;
	import com.game.common.mvc.BaseMediator;
	import com.game.consts.ResPath;
	import com.game.module.menu.events.MenuEvent;
	import com.game.module.plot.view.PlotView;
	import com.game.vo.MenuWinType;
	
	import config.ConfigManager;
	import config.story.Istory;
	import config.story.IstoryCfg;
	
	import laya.media.SoundManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	
	public class PlotMediator extends BaseMediator implements IMediator
	{
		private var _plots:Vector.<IstoryCfg> = null;
		private var _v:PlotView = null;
		private var _nowPlotvo:IstoryCfg = null;
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
			
			_bgmusic = 0;
			
			initStroyCFG();
			
			start();
		}
		private var _stroyID:int = 0;
		private var _stroyLen:int = 0;
		private function initStroyCFG():void
		{
			//trace("_vdata:", _v.data);
			_stroyID = _v.data as int;
			_plots = new Vector.<IstoryCfg>;
			
			var ist:IstoryCfg = null;
			var stroy:Istory = ConfigManager.instance.story_story;
			var len:int = stroy.storyCfg.length;
			for(var i:int = 0; i < len; i ++)
			{
				ist = stroy.storyCfg[i];
				if(ist.ID == _stroyID)
				{
					_plots.push(ist);
				}
			}
			
			_stroyLen = _plots.length;
		}
		
		
		private function getStroyByID(id:int):IstoryCfg
		{
			var ist:IstoryCfg = null;
			for(var i:int = 0; i < _stroyLen; i ++)
			{
				ist =_plots[i];
				if(ist.port == id)
					return ist;
			}
			return null;
		}
		
		private var _bgmusic:Number = 0;
		private function start():void
		{
			_nowPlotvo = getStroyByID(1);
			_bgmusic = _nowPlotvo.bgMusic
			doPlotVO(_nowPlotvo);
		}
		
		
		private function checkPlayBGMusic():void
		{
			if(_nowPlotvo.bgMusic > 0)
			{
				if(_nowPlotvo.bgMusic != _bgmusic)
				{
					_bgmusic = _nowPlotvo.bgMusic;
					SoundManager.playMusic(ResPath.getBGSound(_nowPlotvo.bgMusic));
						return;
						
				}
				else
					return;
			}
			if(_bgmusic > 0)
			{
				_bgmusic = 0;
				SoundManager.stopMusic();
			}
		}
		
		private function doPlotVO(value:IstoryCfg):void
		{
			checkPlayBGMusic();
			_v.play(value);
		}
		
/*		private function getPlotVoByID(id:int):IstoryCfg
		{
			var vo:IstoryCfg = null;
			var len:int = _plots.length;
			for(var i:int = 0; i < len ;i ++)
			{
				vo = _plots[i];
				if(vo.ID == id)
					return vo;
			}
			return null;
		}*/
		
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
			if(_nowPlotvo.nextPort == 0)
			{
				//end
				removeMenu();
			}
			else
			{
				_nowPlotvo = getStroyByID(_nowPlotvo.nextPort);
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