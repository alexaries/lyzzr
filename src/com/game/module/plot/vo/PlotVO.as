package com.game.module.plot.vo
{
	public class PlotVO
	{
		
		/**
		 *当前场景ID 
		 */		
		public var id:int = 0;
		/**
		 *剧情 背景 
		 */		
		public var bg:String = null;
		/**
		 *剧情人物 
		 */		
		public var role:String = null;
		/**
		 *对话筐背景
		 *  
		 */		
		public var dialogBG:int = 0;
		/**
		 *对话筐内容  
		 */		
		public var dialogDec:String = null;
		/**
		 *对话筐头像，没有交不会出现头像
		 */		
		public var dialogHead:String = null;
		/**
		 *对话筐名字，如果没有名字，对话筐将没有有名字 
		 */		
		public var dialogRoleName:String = null;
		/**
		 *振动对像 
		 */		
		public var shock:String = null;
		
		/**
		 *对话配音 
		 */		
		public var sound:String = null;
		
		/**
		 *下一步 
		 */		
		public var nextid:int = 0;
		
		/**
		 *缓冲动画 
		 */		
		
		
		public var aniTarget:String = null;
		public var aniTargetAtt:String = null;
		public var aniTargetAttValue:String = null;
		public var aniTime:String = null;
		
		public function PlotVO()
		{
		}
	}
}