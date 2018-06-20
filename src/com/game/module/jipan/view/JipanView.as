package com.game.module.jipan.view
{
	import com.game.common.mvc.BaseMediator;
	import com.game.common.view.BaseWindow;
	import com.game.consts.BaseLayer;
	import com.game.module.jipan.mediator.JipanMediator;
	import com.signal.SignalDispatcher;
	
	import laya.events.Event;
	
	import ui.jipan.JipanUI;

	/**
	 *羁绊 
	 * @author svn
	 * 
	 */	
	public class JipanView extends BaseWindow
	{
		private var _ui:JipanUI = null;
		
		public var clickBackSignal:SignalDispatcher = null;
		public function JipanView(resArray:Array=null)
		{
			super(resArray);
			layer = BaseLayer.SPECIAL;
			clickBackSignal = new SignalDispatcher();
			
		}
		
		
		override public function getMediator():BaseMediator {
			return new JipanMediator(this);
		}
		
		override public function onComplete():void {
			__onComplete();
			super.onComplete();
		}
		
		
		private function __onComplete():void {
			_ui = new JipanUI();
			addChild(_ui);
			
			_ui.back.on(Event.CLICK, this, clickback);
			init();
		}
		
		private function clickback(e:Event):void
		{
			clickBackSignal.dispatch(null);
		}
		
		private function init():void
		{
			
		}
	}
}