package com.game.module.plot.event
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.observer.Notification;
	/**
	 * 
	 * @author svn
	 * 
	 */	
	public class PlotEvent extends Notification implements INotification
	{
		/**
		 *剧情播放 
		 */		
		public static const PLOT_PLAY:String = "plot_play";
		
		
		public function PlotEvent(name:String, body:Object=null, type:String=null)
		{
			super(name, body, type);
		}
	}
}