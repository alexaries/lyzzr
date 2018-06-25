package com.game.module.jiban.view.cell
{
	import laya.ui.Image;
	
	import ui.jiban.items.StarListUI;

	public class StarList
	{
		private static const MAX:int = 7;
		private var _ui:StarListUI = null;
		private var _maxStar:int = 0;
		private var _bglist:Vector.<Image> = null;
		private var _starlist:Vector.<Image> = null;
		public function StarList(ui:StarListUI)
		{
			_ui = ui;
			_bglist = new Vector.<Image>();
			_starlist = new Vector.<Image>();
			
			_bglist.push(_ui.bg0);
			_bglist.push(_ui.bg1);
			_bglist.push(_ui.bg2);
			_bglist.push(_ui.bg3);
			_bglist.push(_ui.bg4);
			_bglist.push(_ui.bg5);
			_bglist.push(_ui.bg6);
			
			_starlist.push(_ui.star0);
			_starlist.push(_ui.star1);
			_starlist.push(_ui.star2);
			_starlist.push(_ui.star3);
			_starlist.push(_ui.star4);
			_starlist.push(_ui.star5);
			_starlist.push(_ui.star6);
			
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
				
				img = _ui["star" + i.toString()] as Image;
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
				img = _ui["bg" + i.toString()] as Image;
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