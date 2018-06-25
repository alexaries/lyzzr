package com.game.module.jiban.vo
{
	import com.game.utils.JibanUtil;
	
	import config.memorybase.ImemoryBaseCfg;
	import config.memoryup.ImemoryUpCfg;

	/**
	 *羁绊 
	 * @author svn
	 * 
	 */	
	public class JibanVO
	{
		
		private var _stringName:String = null;
		public function get stringName():String
		{
			if(_stringName == null)
				_stringName = base.roleName + "." + base.memoryName;
			return _stringName;
		}
		/**
		 *ID 
		 */		
		public var id:int = 2101;
		
		
		/**
		 *觉醒等级 
		 */		
		public var awakenLevel:int = 0;
	
		/**
		 *等级 
		 */		
		private var _level:int = 0;
		public function get level():int
		{
			return _level;
		}
		public function set level(value:int):void
		{
			_level = value;
			upCfg = JibanUtil.instance.getMemoryUpCfg(id, value);
			maxExp = JibanUtil.instance.getmemoryUpNeedExp(value, base.quality);
		}
		/**
		 *星级 
		 */		
		public var starLevel:int = 0;
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
		
		public var maxExp:int = 0;
		
		/**
		 *羁绊配置表 
		 */		
		private var _base:ImemoryBaseCfg = null;
		public function get base():ImemoryBaseCfg
		{
			if(_base == null)
			{
				_base = JibanUtil.instance.getMemoryBaseCfg(id);
				if(_base == null)
				{
					trace("当前羁绊ID不存在:" + id);
				}
			}
			return _base;
		}
		
		public var upCfg:ImemoryUpCfg = null;
		
		
		public function JibanVO()
		{
			id = 2101;
			level = 2;
		}
	}
}