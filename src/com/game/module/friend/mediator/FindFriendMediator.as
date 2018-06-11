package com.game.module.friend.mediator
{
	import com.game.common.mvc.BaseMediator;
	
	import org.puremvc.as3.interfaces.IMediator;
	
	public class FindFriendMediator extends BaseMediator implements IMediator
	{
		public function FindFriendMediator(viewComponent:Object=null)
		{
			super("FindFriendMediator", viewComponent);
		}
	}
}