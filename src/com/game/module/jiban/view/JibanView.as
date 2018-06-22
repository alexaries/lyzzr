package com.game.module.jiban.view
{
	import com.game.common.mvc.BaseMediator;
	import com.game.common.view.BaseFrame;
	import com.game.module.jiban.mediator.JibanMediator;
	import com.game.module.jiban.view.cell.JibanItemCell;
	import com.game.module.jiban.vo.JibanVO;
	import com.signal.SignalDispatcher;
	
	import laya.events.Event;
	import laya.utils.Handler;
	
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
		
		private var listarr:Array = [];
		private function __onComplete():void {
			_ui = new JibanUI();
			addChild(_ui);
			
			_ui.tab.selectHandler = Handler.create(this, onSelectTab, null, false);
			_ui.tab.selectedIndex = 0;
			
			_ui.nameTab.selectHandler = Handler.create(this, onSelectTab, null, false);
			_ui.nameTab.selectedIndex = 0;
			
			_ui.back.on(Event.CLICK, this, clickback);
			
			
			_ui.list.vScrollBarSkin = "";
			_ui.list.itemRender = JibanItemCell;
			
			_ui.list.renderHandler = Handler.create(this, onJipanItemRender, null, false);
			_ui.list.array = [new JibanVO()];
			init();
			
			 listarr.push([new JibanVO(), new JibanVO(), new JibanVO()]);
				 listarr.push([new JibanVO(), new JibanVO()]);
					 listarr.push([new JibanVO()]);
						 listarr.push([new JibanVO(), new JibanVO(), new JibanVO()]);
							 listarr.push([new JibanVO(), new JibanVO(), new JibanVO()]);
		}
		
		private function onSelectTab(index:int):void
		{
			_ui.list.array = listarr[index];
		}
		
		
		private function onJipanItemRender(cell:JibanItemCell, index:int, actSignal:SignalDispatcher):void
		{
			cell.init(_ui.list.array[index], index, actSignal);
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