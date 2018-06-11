package com.game.module.friend.mediator
{
	import com.game.common.events.MenuWindowVO;
	import com.game.common.mvc.BaseMediator;
	import com.game.events.NotiEvent;
	import com.game.module.friend.view.MyFriendView;
	import com.game.module.menu.events.MenuEvent;
	import com.game.vo.MenuWinType;
	
	import org.puremvc.as3.interfaces.IMediator;
	
	public class MyFriendMediator extends BaseMediator implements IMediator
	{
		
		public function MyFriendMediator(viewComponent:Object=null)
		{
			super("MyFriendMediator", viewComponent);
		}   
		
		
		
		
		private function get view():MyFriendView {
			return getViewComponent() as MyFriendView;
		}
		
		override public function onRegister():void {
			super.onRegister();
			
			view.closeSignal.getSignal(this).listen(closeClick);
			view.findSignal.getSignal(this).listen(onFindFriend);
		}
		
		private function onFindFriend():void
		{
			trace("MyFriendMediator:onFindFriend");
			dispatch(new NotiEvent(NotiEvent.FRIEND_FINDFRIEND));
		}
		
		private function closeClick():void
		{
			dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.SWORDFIGHT_JOIN, MenuWindowVO.CLOSE)));
			//	dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.ACHIEVEMENT_VIEW, MenuWindowVO.CLOSE)));
		}
	}
}