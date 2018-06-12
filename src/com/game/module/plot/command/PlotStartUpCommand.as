package com.game.module.plot.command
{
	import com.game.common.mvc.BaseCommand;
	import com.game.module.plot.proxy.PlotProxy;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	
	public class PlotStartUpCommand extends BaseCommand implements ICommand
	{
		public function PlotStartUpCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void {
			facade.registerProxy(new PlotProxy());
		}
	}
}