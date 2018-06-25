package com.game.module.jiban.view
{
	import com.game.common.mvc.BaseMediator;
	import com.game.common.view.BaseFrame;
	import com.game.module.jiban.mediator.JibanInfoMediator;
	
	import laya.ui.Button;
	import laya.utils.Handler;
	
	import ui.jiban.JibanInfoViewUI;
	
	public class JibanInfoView extends BaseFrame
	{
		private var _ui:JibanInfoViewUI = null;
		public function JibanInfoView(resArray:Array=null)
		{
			super(resArray);
		}
		
		override public function getMediator():BaseMediator {
			return new JibanInfoMediator(this);
		}
		
		override public function onComplete():void {
			__onComplete();
			super.onComplete();
		}
		
		private function __onComplete():void {
			_ui = new JibanInfoViewUI();
			this.addChild(_ui);
			
			addback();
			
			_ui.tab.selectHandler = Handler.create(this, onSelectTab, null, false);
			_ui.tab.selectedIndex = 0;
			
			
		}
		
		private function onSelectTab(index:int):void
		{
			var len:int = _ui.tab.items.length;
			for(var i:int = 0; i < len; i ++)
			{
				if(i == index)
				{
					(_ui.tab.items[i] as Button).y = -8;
				}
				else
				{
					(_ui.tab.items[i] as Button).y = 0;
				}
			}
		}
	}
}