package com.game.module.jiban.view.cell
{
	import com.game.module.jiban.vo.JibanVO;
	import com.signal.SignalDispatcher;
	
	import laya.ui.Box;
	import laya.ui.Image;
	
	import ui.jiban.JibanItemUI;
	
	
	public class JibanItemCell extends Box
	{
		private var _ui:JibanItemUI = null;
		public function JibanItemCell()
		{
			super();
		}
		
		override protected function createChildren():void {
			super.createChildren();
			_ui = new JibanItemUI();
			//_ui.btnOk.clickHandler = Handler.create(this, onClick, null, false)
			addChild(_ui);
		}
		
		
		
		public function init(vo:JibanVO, ind:int, actSignal:SignalDispatcher):void
		{
			setvo(vo);
		}
		/**
		 *星级 
		 * @param value
		 * 
		 */		
		private function setstarLevel(value:int):void
		{
			var img:Image = null;
			for(var i:int = 0; i < 5; i ++)
			{
				img = _ui["icon" + i.toString()] as Image;
				if(i < value)
				{
					img.visible = true;
				}
				else
					img.visible = false;
				
			}
		}
	
		
		private var _vo:JibanVO = null;
		private function setvo(value:JibanVO):void
		{
			_vo = value;
			_ui.levelTxt.text = value.level.toString();
			_ui.countTxt.text = value.count.toString();
			//setstarLevel(value.starLevel);
		}
		
		public function get vo():JibanVO
		{
			return _vo;
		}
		
		
		
	}
}