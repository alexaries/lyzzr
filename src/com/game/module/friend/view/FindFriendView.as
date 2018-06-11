package com.game.module.friend.view
{
	import com.game.common.mvc.BaseMediator;
	import com.game.common.view.BaseWindow;
	import com.game.module.friend.mediator.FindFriendMediator;
	
	import ui.myfriend.FindFriendUI;
	
	public class FindFriendView extends BaseWindow
	{
		private var _ui:FindFriendUI = null;
		public function FindFriendView(resArray:Array=null)
		{
			super(resArray);
		}
		
		override public function getMediator():BaseMediator {
			return new FindFriendMediator(this);
		}
		
		override public function onComplete():void {
			__onComplete();
			super.onComplete();
		}
		
		
		private function __onComplete():void {
			_ui = new FindFriendUI();
			addChild(_ui);
			
			init();
			
		}
		
		private function init():void
		{
			
		}
	}
}