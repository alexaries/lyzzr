package com.game.module.jiban.view
{
	import com.game.common.mvc.BaseMediator;
	import com.game.common.view.BaseFrame;
	import com.game.common.view.BaseWindow;
	import com.game.consts.BaseLayer;
	import com.game.module.jiban.mediator.JibanMediator;
	import com.game.module.jiban.view.cell.JibanItemCell;
	import com.signal.SignalDispatcher;
	
	import laya.events.Event;
	
	import ui.jiban.JibanUI;
	

	/**
	 *羁绊 
	 * @author svn
	 * 
	 */	
	public class JibanView extends BaseFrame
	{
		private var _ui:JibanUI = null;
		
		public var clickBackSignal:SignalDispatcher = null;
		public function JibanView(resArray:Array=null)
		{
			super(resArray);
			clickBackSignal = new SignalDispatcher();
			
		}
		
		
		override public function getMediator():BaseMediator {
			return new JibanMediator(this);
		}
		
		override public function onComplete():void {
			__onComplete();
			super.onComplete();
		}
		
		
		private function __onComplete():void {
			_ui = new JibanUI();
			addChild(_ui);
			
			_ui.back.on(Event.CLICK, this, clickback);
			
			_ui.list.itemRender = JibanItemCell;
			//_ui.list.
			init();
		}
		
		
		public function showMyJiban(arr:Array):void
		{
			_ui.liushibtn.visible = true;
			_ui.list.visible = true;
			
		}
		
		
		public function showJibansuipian(arr:Array):void
		{
			
		}
		
		public function showLiushi(arr:Array):void
		{
			
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