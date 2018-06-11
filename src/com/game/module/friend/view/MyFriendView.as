package com.game.module.friend.view
{
	import com.game.common.mvc.BaseMediator;
	import com.game.common.view.BaseWindow;
	import com.game.module.friend.mediator.MyFriendMediator;
	import com.signal.SignalDispatcher;
	
	import laya.events.Event;
	
	import ui.myfriend.MyFriendUI;
	
	public class MyFriendView extends BaseWindow
	{
		private var _ui:MyFriendUI = null;
		public var closeSignal:SignalDispatcher;
		public var findSignal:SignalDispatcher;
		
		public function MyFriendView(resArray:Array=null)
		{
			super(resArray);
			closeSignal = new SignalDispatcher();
			findSignal = new SignalDispatcher();
		}
		
		override public function getMediator():BaseMediator {
			return new MyFriendMediator(this);
		}
		
		override public function onComplete():void {
			__onComplete();
			super.onComplete();
		}
		
		
		private function __onComplete():void {
			_ui = new MyFriendUI();
			addChild(_ui);
			init();
		}
		
		private function init():void
		{
			_ui.backBtn.on(Event.CLICK, this, onClickBack);
			_ui.findFriend.on(Event.CLICK, this, onFindFriend);
		}
		
		private function onFindFriend(e:Event):void
		{
			findSignal.dispatch(null);
		}
		
		private function onClickBack(e:Event):void
		{
			closeSignal.dispatch(null);
		}
		override public function dispose():void {
			super.dispose();
			_ui.backBtn.off(Event.CLICK, this, onClickBack);
			_ui.findFriend.off(Event.CLICK, this, onFindFriend);
			closeSignal.dispose();
			closeSignal = null;
			
			findSignal.dispose();
			findSignal = null;
			
		}
		
		
	}
}