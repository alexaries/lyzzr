package com.game.module.plot.proxy
{
	import com.game.common.mvc.BaseProxy;
	import com.game.events.NotiEvent;
	import com.game.module.plot.event.PlotEvent;
	import com.game.module.plot.vo.PlotVO;
	
	import org.puremvc.as3.interfaces.IProxy;
	
	public class PlotProxy extends BaseProxy implements IProxy
	{
		public static const NAME:String = "PlotProxy";
		
		private var _plotVOS:Vector.<PlotVO> = null;
		public function PlotProxy(data:Object=null)
		{
			super(NAME, data);
			
			_plotVOS = data as Vector.<PlotVO>;
		}
		
		/*public function get plotvos():Vector.<PlotVO>
		{
			return _plotVOS;
		}*/
		
		//dispatch(new NotiEvent(NotiEvent.TASK_RESPONSE_DIALOG, []));
		
		public function doPlayPlot():void
		{
			dispatch(new NotiEvent(PlotEvent.PLOT_PLAY, _plotVOS));
		}
	}
}