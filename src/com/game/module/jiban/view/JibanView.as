package com.game.module.jiban.view
{
	import com.game.common.mvc.BaseMediator;
	import com.game.common.view.BaseFrame;
	import com.game.module.jiban.mediator.JibanMediator;
	import com.game.module.jiban.view.cell.JibanItemCell;
	import com.game.module.jiban.vo.JibanVO;
	import com.signal.SignalDispatcher;
	
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
		public var jibanitemsig:SignalDispatcher = null;
		
		
		public function JibanView(resArray:Array=null)
		{
			super(resArray);
			jibanitemsig = new SignalDispatcher();
		}
		
		override public function dispose():void
		{
			
			if(_ui.tab.selectHandler) _ui.tab.selectHandler.clear();
			if(_ui.nameTab.selectHandler) _ui.nameTab.selectHandler.clear();
			if(_ui.list.renderHandler) _ui.list.renderHandler.clear();
			
			super.dispose();
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
			
			addback();
			
			_ui.tab.selectHandler = Handler.create(this, onSelectTab, null, false);
			_ui.tab.selectedIndex = 0;
			
			_ui.nameTab.selectHandler = Handler.create(this, onSelectTab, null, false);
			_ui.nameTab.selectedIndex = 0;
			
			
			
			_ui.list.vScrollBarSkin = "";
			_ui.list.itemRender = JibanItemCell;
			_ui.list.renderHandler = Handler.create(this, onJipanItemRender, null, false);
			
			
			listarr.push([new JibanVO(), new JibanVO(), new JibanVO(), new JibanVO(), new JibanVO(), new JibanVO(), new JibanVO()]);
			listarr.push([new JibanVO(), new JibanVO()]);
			listarr.push([new JibanVO()]);
			listarr.push([new JibanVO(), new JibanVO(), new JibanVO()]);
			listarr.push([new JibanVO(), new JibanVO(), new JibanVO()]);
							 
							 
			 _ui.list.array = listarr[0];
			 init();
			 
			 
		}
		
		private function onSelectTab(index:int):void
		{
			_ui.list.array = listarr[index];
		}
		
		
		private function onJipanItemRender(cell:JibanItemCell, index:int):void
		{
			cell.init(_ui.list.array[index], index, jibanitemsig);
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
	
		
		
		private function init():void
		{
			
		}
	}
}