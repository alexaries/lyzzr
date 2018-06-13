package com.game.consts
{
	public class ResPath
	{
		
		public static const DIALOG_HEAD:String = "ui/dialog/head/";
		
		public static const DIALOG_BG:String = "ui/dialog/bg/";
		public static const STROY_BG:String = "ui/bgImg/";
		public static const ROLE:String = "ui/role/";
		
		
		public static const STROYSOUND:String = "";
		
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