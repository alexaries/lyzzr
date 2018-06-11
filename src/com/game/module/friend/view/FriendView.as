package com.game.module.friend.view
{
	import com.game.common.mvc.BaseMediator;
	import com.game.common.view.BaseWindow;
	import com.game.consts.BaseLayer;
	import com.game.module.friend.mediator.FriendMediator;
	import com.signal.SignalDispatcher;
	
	
	import ui.myfriend.FriendUI;
	
	public class FriendView extends BaseWindow
	{
		public var closeSignal:SignalDispatcher;
		private var _ui:FriendUI = null;
		
		private var _myfriendView:MyFriendView = null;
		private var _findfriendView:FindFriendView = null;
		
		  
		public function FriendView(resArray:Array=null)
		{
			super(resArray);
			closeSignal = new SignalDispatcher();
			layer = BaseLayer.SPECIAL;
		}
		
		override public function getMediator():BaseMediator {
			return new FriendMediator(this);
		}
		
		override public function onComplete():void {
			__onComplete();
			super.onComplete();
		}
		
		
		private function __onComplete():void {
			_ui = new FriendUI();
			addChild(_ui);
			init();
		}
		
		
		/**
		 *显示查找好友 
		 * 
		 */		
		public function showFindFriend():void
		{
			if(_myfriendView != null)
			{
				_myfriendView.removeSelf();
			}
			if(_findfriendView == null)
			{
				_findfriendView = new FindFriendView();
			}
			
			this.addChild(_findfriendView);
			
		}
		
		
		/**
		 *显示我的好友 
		 * 
		 */		
		public function showMyfriend():void
		{
			if(_findfriendView != null)
			{
				_findfriendView.removeSelf();
			}
			if(_myfriendView == null)
			{
				_myfriendView= new MyFriendView();
			}
			
			this.addChild(_myfriendView);
		}
		
		private function init():void
		{
			showMyfriend();
		}
	}
}