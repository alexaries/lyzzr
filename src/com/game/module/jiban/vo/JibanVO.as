package com.game.module.jiban.vo
{
	import com.game.utils.JibanUtil;
	
	import config.memoryadvance.ImemoryAdvanceCfg;
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
		 *通过ID获得属性 
		 * @param value
		 * @return 
		 * 
		 */		
		public function getattackByID(value:int):int
		{
			var atk1:int = base["attack" + value.toString()] + upCfg["attack" + value.toString()];
			atk1 = (1 + awakenCfg["attack" + value.toString() + "Percent"] * 0.01) * atk1;
			atk1 = (1 + starCfg["attack" + value.toString() + "Percent"] * 0.01) * atk1;
			return atk1;
		}
		/**
		 *觉醒等级 
		 */	
		private var _awakenLevel:int = 0;
		
		public function get awakenLevel():int
		{
			return _awakenLevel;
		}
		public function set awakenLevel(value:int):void
		{
			_awakenLevel = value;
			awakenCfg = JibanUtil.instance.getMemoryAdvance(id, JibanUtil.DISTINGUISHTYPE_2, value);
		}
	
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
		
		public var starCfg:ImemoryAdvanceCfg = null;
		public var awakenCfg:ImemoryAdvanceCfg = null;
		
		
	
		
		/**
		 *星级 
		 */		
		private var _starLevel:int = 0;
		public function set starLevel(value:int):void
		{
			_starLevel = value;
			
			starCfg = JibanUtil.instance.getMemoryAdvance(id, JibanUtil.DISTINGUISHTYPE_1, value);
		}
		public function get starLevel():int
		{
			return _starLevel;
		}
		
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