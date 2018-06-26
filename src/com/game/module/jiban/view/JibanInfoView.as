package com.game.module.jiban.view
{
	import com.game.common.mvc.BaseMediator;
	import com.game.common.view.BaseFrame;
	import com.game.consts.ResPath;
	import com.game.module.jiban.mediator.JibanInfoMediator;
	import com.game.module.jiban.vo.JibanVO;
	import com.signal.SignalDispatcher;
	
	import laya.events.Event;
	import laya.ui.Button;
	import laya.utils.Handler;
	
	import ui.jiban.JibanInfoViewUI;
	
	public class JibanInfoView extends BaseFrame
	{
		private var _ui:JibanInfoViewUI = null;
		
		public var clickJibanSignal:SignalDispatcher = null;
		public var clickGiftSignal:SignalDispatcher = null;
		public function JibanInfoView(resArray:Array=null)
		{
			super(resArray);
			
			clickJibanSignal = new SignalDispatcher();
			clickGiftSignal = new SignalDispatcher();
		}
		
		override public function dispose():void
		{
			clickBackSignal.clear();
			clickGiftSignal.clear();
			clickJibanSignal = null;
			clickGiftSignal = null;
			super.dispose();
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
			_ui.jibanBtn.visible = false;
			_ui.roleGift.visible = false;
			_ui.roleShow.visible = true;
			
			_ui.jibanBtn.on(Event.CLICK, this, onClickJiban);
			_ui.giftBtn.on(Event.CLICK, this, onClickGift);
		}
		
		private function onClickGift():void
		{
			clickGiftSignal.dispatch(null);
		}
		
		private function onClickJiban():void
		{
			clickJibanSignal.dispatch(null);
		}
		
		
		private var _vo:JibanVO = null;
		public function setVO(value:JibanVO):void
		{
			_vo = value;
			_ui.nameTxt.text = _vo.stringName;
			freshLevel();
			
			_ui.sssImg.skin = ResPath.getQualityIcon(_vo.base.quality);
			
		}
		
		private function freshLevel():void
		{
			expchange();
			_ui.levelTxt.text = "Lv." + _vo.level + "/" + _vo.base.topLevel;
			freshValue();
		}
		
		/**
		 *刷新属性 
		 * 
		 */		
		private function freshValue():void
		{
			_ui.attack1Txt.text = _vo.getattackByID(1).toString();
			_ui.attack2Txt.text = _vo.getattackByID(2).toString();
			_ui.attack3Txt.text = _vo.getattackByID(3).toString();
			_ui.attack4Txt.text = _vo.getattackByID(4).toString();
		}
		
		private function expchange():void
		{
			_ui.expTxt.text = _vo.exp.toString() + "/" + _vo.maxExp.toString();
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