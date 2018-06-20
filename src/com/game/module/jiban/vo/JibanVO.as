package com.game.module.jiban.vo
{
	/**
	 *羁绊 
	 * @author svn
	 * 
	 */	
	public class JibanVO
	{
		/**
		 *ID 
		 */		
		public var id:int = 0;
		/**
		 *等级 
		 */		
		public var level:int = 0;
		/**
		 *星级 
		 */		
		public var startLevel:int = 0;
		/**
		 *经验 
		 */		
		public var exp:Number = 0;
		/**
		 *数量 
		 */		
		public var count:int = 0;
		/**
		 *进化登录 
		 */		
		public var queLevel:int = 0;
		
		/**
		 *羁绊配置表 
		 */		
		public var data:Object = null;
		
		
		public function JibanVO()
		{
		}
	}
}