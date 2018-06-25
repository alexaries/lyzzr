package com.game.consts
{
	public class ResPath
	{
		
		public static const DIALOG_HEAD:String = "ui/dialog/head/";
		
		public static const DIALOG_BG:String = "ui/dialog/bg/";
		public static const STROY_BG:String = "ui/bgImg/";
		public static const ROLE:String = "ui/role/";
		
		public static const BGSOUND:String = "sound/bg/";
		public static const STROYSOUND:String = "sound/story/";
		
		public static const ROLESOUND:String = "sound/role/";
		
		/**
		 *角色音乐 
		 * @param soundid
		 * @return 
		 * 
		 */		
		public static function getRoleSound(soundid:int):String
		{
			return ROLESOUND + soundid.toString() + ".mp3";
		}
		/**
		 *专长框
		 * @param quality
		 * @return 
		 * 
		 */		
		public static function getSpecialtyKuang(quality:int):String
		{
			return "ui/icon/kuang_specialty_" + quality.toString() + ".png";
		}
		/**
		 *品质ICON 
		 * @param quality
		 * @return 
		 * 
		 */		
		public static function getQualityIcon(quality:int):String
		{
			return "ui/icon/icon_quality_" + quality.toString() + ".png";
		}
		/**
		 *近回背景音乐 
		 * @param value
		 * @return 
		 * 
		 */		
		public static function getBGSound(value:Number):String
		{
			return BGSOUND + value.toString() + ".mp3";
		}
		
		/**
		 *故事背景英语有 
		 * @param value
		 * @return 
		 * 
		 */		
		public static function getStroySound(value:Number):String
		{
			return STROYSOUND + value.toString() + ".mp3";
		}
		/**
		 *返回人物路径 
		 * @param value
		 * @return 
		 * 
		 */		
		public static function getRole(value:Number):String
		{
			return ROLE + value.toString() + ".png";
		}
		
		
		
		/**
		 *获得剧情背景图 
		 * @param value
		 * @return 
		 * 
		 */		
		public static function getStroyBG(value:Number):String
		{
			return STROY_BG + value.toString() + ".png";
		}
		
		
		
		
		/**
		 *对话框目录 
		 * @param value
		 * @return 
		 * 
		 */		
		public static function getDialogBGByID(value:Number):String
		{
			if(value == 1)
				return DIALOG_BG + "bg01.png";
			return DIALOG_BG + "bg01.png";
		}
		
		/**
		 *对话框头像 
		 * @param value
		 * @return 
		 * 
		 */		
		public static function getDialogHead(value:Number):String
		{
			return DIALOG_HEAD + value.toString() + ".png";
		}
		public function ResPath()
		{
		}
	}
}