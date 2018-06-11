package com.game.module.friend.mediator
{
	import com.game.common.mvc.BaseMediator;
	import com.game.events.NotiEvent;
	import com.game.module.friend.view.FriendView;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	
	public class FriendMediator extends BaseMediator implements IMediator
	{
		public static const NAME:String = "FriendMediator";
		public function FriendMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		override public function listNotificationInterests():Array {
			
			return [NotiEvent.FRIEND_FINDFRIEND];
				
				
		}
		private function get view():FriendView {
			return getViewComponent() as FriendView;
		}
		
		override public function onRegister():void {
			super.onRegister();

		}
		override public function handleNotification(notification:INotification):void {
			
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			
			switch(name)
			{
				case NotiEvent.FRIEND_FINDFRIEND:
					view.showFindFriend();
					break;
			}
		}
		
		
		
		
	}
}