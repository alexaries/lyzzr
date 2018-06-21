package com.game.module.jiban.view.cell
{
	import com.game.module.jiban.vo.JibanVO;
	
	import laya.ui.Image;
	
	import ui.jiban.JibanItemUI;
	
	public class JibanItemCell extends JibanItemUI
	{
		public function JibanItemCell()
		{
			super();
		}
		/**
		 *星级 
		 * @param value
		 * 
		 */		
		private function set starLevel(value:int):void
		{
			var img:Image = null;
			for(var i:int = 0; i < 5; i ++)
			{
				img = this["icon" + i.toString()] as Image;
				if(i < value)
				{
					img.visible = true;
				}
				else
					img.visible = false;
				
			}
		}
		private function get starLevel():int
		{
			return _vo.starLevel;
		}
		
		private var _vo:JibanVO = null;
		public function set vo(value:JibanVO):void
		{
			_vo = value;
			levelTxt.text = value.level.toString();
			countTxt.text = value.count.toString();
			starLevel = value.starLevel;
		}
		
		public function get vo():JibanVO
		{
			return _vo;
		}
		
		
		
	}
}