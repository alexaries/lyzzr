package com.game.module.jiban.view
{
	import com.game.module.jiban.vo.JibanVO;
	
	import ui.jiban.JibanItemUI;
	
	public class JibanItem extends JibanItemUI
	{
		public function JibanItem()
		{
			super();
		}
		
		private var _vo:JibanVO = null;
		public function set vo(value:JibanVO):void
		{
			_vo = value;
			levelTxt.text = value.level.toString();
			countTxt.text = value.count.toString();
		}
		
		public function get vo():JibanVO
		{
			return _vo;
		}
		
		
		
	}
}