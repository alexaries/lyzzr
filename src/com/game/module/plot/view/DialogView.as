package com.game.module.plot.view
{
	
	
	import com.game.consts.ResPath;
	import com.tween.KTJob;
	import com.tween.KTween;
	import com.tween.easing.Linear;
	
	import config.story.IstoryCfg;
	
	import laya.media.SoundChannel;
	import laya.media.SoundManager;
	import laya.utils.Handler;
	
	import ui.plot.DialogViewUI;
	
	
	public class DialogView extends DialogViewUI
	{
		
		public function DialogView()
		{
			super();
			
			
			
		}
		
		public function dispose():void
		{
			this.removeSelf();
			_vo = null;
			_bgimgtween = null;
			_decKtJob = null;
		}
		
		private var _vo:IstoryCfg = null;
		private var _bgimgtween:KTJob = null;
		public function showDialog(vo:IstoryCfg):void
		{
			_isFinish = false;
			_vo = vo;
			init();
			bgImg.scaleY = 0;
			
			_bgimgtween = KTween.to(bgImg, 0.2, {scaleY:1}, Linear.easeIn, Handler.create(this, endBgimgtween));
		}
		
		public function get isFinish():Boolean
		{
			return _isFinish;
		}
		
		
		private var _isFinish:Boolean = false;
		
		public function finish():void
		{
			
			stopSoundChannel();
			
			if(_bgimgtween.finished == false)
			{
				_bgimgtween.close();
				_bgimgtween = null;
			}
			endshowbgimg();
			if(_decKtJob != null)
			{
				if(_decKtJob.finished == false)
				{
					_decKtJob.close();
					_decKtJob = null;
				}
			}
			
			decTxt.text = _vo.dialogContent;
			_isFinish = true;
		}
		
		private function stopSoundChannel():void
		{
			if(_soundchannel != null)
			{
				SoundManager.removeChannel(_soundchannel);
				_soundchannel = null;
			}
			
		}
		
		private var _decKtJob:KTJob = null;
		private var _decCount:int = 0;
		private var _decLen:int = 0;
		private var _soundchannel:SoundChannel = null;
		private function showDec():void
		{
			stopSoundChannel();
			if(_vo.sound > 0)
			{
				_soundchannel = SoundManager.playSound(ResPath.getStroySound(_vo.sound));
			}
			
			
			_decLen = _vo.dialogContent.length;
			_decKtJob = KTween.to(this, 1, {decCount:_decLen}, Linear.easeIn);
		}
		
		public function set decCount(value:int):void
		{
			_decCount = value;
			decTxt.text = _vo.dialogContent.slice(0, value);
			
			if(value ==  _decLen)
			{
				_isFinish = true;
			}
		}
		
		public function get decCount():int
		{
			return _decCount;
		}
		
		private function endBgimgtween():void
		{
			endshowbgimg();
			showDec();
		}
		
		private function endshowbgimg():void
		{
			if(_vo.dialogHead > 0)
			{
				headImg.visible = true;
				headImg.skin = ResPath.getDialogHead(_vo.dialogHead);
			}
			
			if(_vo.dialogName != "")
			{
				nameBgImg.visible = true;
				nameTxt.visible = true;
				nameTxt.text = _vo.dialogName;
			}
			
			decTxt.visible = true;
			decTxt.text = "";
			
			
			
			
		}
		
		private function init():void
		{
			headImg.visible = false;
			nameBgImg.visible = false;
			nameTxt.visible = false;
			decTxt.visible = false;
			decTxt.wordWrap = true;
		}
		
		
	}
}