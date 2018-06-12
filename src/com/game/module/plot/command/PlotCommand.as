package com.game.module.plot.command
{
	import com.game.common.mvc.BaseCommand;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	
	public class PlotCommand extends BaseCommand implements ICommand
	{
		public function PlotCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void {
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			
			switch (name) {
				
			}
		}
	}
}