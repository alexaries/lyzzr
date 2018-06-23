package com.game.module.jiban.view
{
	import com.game.common.mvc.BaseMediator;
	import com.game.common.view.BaseFrame;
	import com.game.module.jiban.mediator.JibanInfoMediator;
	
	public class JibanInfoView extends BaseFrame
	{
		private var ui:JibanInfoView = null;
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
			ui = new JibanInfoView();
			this.addChild(ui);
			
			addback();
			
			
		}
	}
}