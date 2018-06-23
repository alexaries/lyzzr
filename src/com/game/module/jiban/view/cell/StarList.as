package com.game.module.jiban.view.cell
{
	import laya.ui.Image;
	
	import ui.jiban.items.StarListUI;

	public class StarList
	{
		private static const MAX:int = 7;
		private var _ui:StarListUI = null;
		private var _maxStar:int = 0;
		public function StarList(ui:StarListUI)
		{
			_ui = ui;
		}
		
		public function setStar(starvalue:int, maxstarvalue:int):void
		{
			maxStar = maxstarvalue;
			nowStar = starvalue;
		}
		
		public function set nowStar(value:int):void
		{
			var img:Image = null;
			for(var i:int = 0; i < MAX; i ++)
			{
				img = (_ui.getChildByName("star" + i.toString()) as Image);
				if(i < value)
				{
					img.visible = true;
					//(_ui["star" + i.toString()] as Image).visible = true;
				}
				else
				{
					//(_ui["star" + i.toString()] as Image).visible = false;
					img.visible = false;
				}
			}
		}
		
		private function freshStar():void
		{
			var img:Image = null;
			for(var i:int = 0; i < MAX; i ++)
			{
				img = (_ui.getChildByName("bg" + i.toString()) as Image);
				if(i < maxStar)
				{
					//(_ui["bg" + i.toString()] as Image).visible = true;
					img.visible = true;
				}
				else
				{
					//(_ui["bg" + i.toString()] as Image).visible = false;
					img.visible = false;
				}
			}
		}
		
		public function set maxStar(value:int):void
		{
			_maxStar = value;
			freshStar();
		}
		public function get maxStar():int
		{
			return _maxStar;
		}
	}
}