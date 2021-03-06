package com.game.module.jiban.view.cell
{
	import com.game.module.jiban.vo.JibanVO;
	import com.signal.SignalDispatcher;
	
	import laya.events.Event;
	import laya.ui.Box;
	import laya.ui.Image;
	
	import ui.jiban.JibanItemUI;
	
	
	public class JibanItemCell extends Box
	{
		private var _ui:JibanItemUI = null;
		private var _sig:SignalDispatcher = null;
		private var _starlist:StarList = null;
		public function JibanItemCell()
		{
			super();
		}
		
		override protected function createChildren():void {
			super.createChildren();
			_ui = new JibanItemUI();
			//_ui.btnOk.clickHandler = Handler.create(this, onClick, null, false)
			
		
			addChild(_ui);
			_ui.on(Event.CLICK, this, onClickthis);
			_starlist = new StarList(_ui.starlist);
		}
		
		private function onClickthis():void
		{
			trace("JibanItemCell, onClickthis");
			_sig.dispatch(vo);
		}
		
		override public function destroy(destroyChild:Boolean=true):void
		{
			super.destroy(destroyChild);
		}
		
		public function init(vo:JibanVO, ind:int, actSignal:SignalDispatcher):void
		{
			_sig = actSignal;
			_starlist.setStar(vo.starLevel, vo.base.topStart);
			setvo(vo);
			
		}
		/**
		 *星级 
		 * @param value
		 * 
		 */		
		private function setstarLevel(value:int):void
		{
			_starlist.setStar(value, _vo.base.topStart);
			/*var img:Image = null;
			for(var i:int = 0; i < 5; i ++)
			{
				img = _ui["icon" + i.toString()] as Image;
				if(i < value)
				{
					img.visible = true;
				}
				else
					img.visible = false;
				
			}*/
		}
	
		
		private var _vo:JibanVO = null;
		private function setvo(value:JibanVO):void
		{
			_vo = value;
			_ui.nameTxt.text = value.stringName;
			_ui.levelTxt.text = value.level.toString();
			_ui.countTxt.text = "已拥有:" + value.count.toString();
			setstarLevel(value.starLevel);
		}
		
		public function get vo():JibanVO
		{
			return _vo;
		}
		
		
		
	}
}