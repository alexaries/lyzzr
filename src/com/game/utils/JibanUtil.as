package com.game.utils
{
	import config.ConfigManager;
	import config.memoryadvance.ImemoryAdvance;
	import config.memoryadvance.ImemoryAdvanceCfg;
	import config.memorybase.ImemoryBase;
	import config.memorybase.ImemoryBaseCfg;
	import config.memoryexp.ImemoryExp;
	import config.memoryexp.ImemoryExpCfg;
	import config.memoryup.ImemoryUp;
	import config.memoryup.ImemoryUpCfg;

	public class JibanUtil
	{
		public function JibanUtil()
		{
		}
		
		
		
		private var _memoryUp:ImemoryUp = null;
		private var _memoryUpLen:int = 0;
		private function get memoryUp():ImemoryUp
		{
			if(_memoryUp == null)
			{
				_memoryUp = ConfigManager.instance.memoryUp_memoryUp;
				_memoryUpLen  = _memoryUp.memoryupCfg.length;
			}
			return _memoryUp;
		}
		
		
		private var _memoryadvance:ImemoryAdvance = null;
		private var _memoryadvanceLen:int = 0;
		public function get memoryadvance():ImemoryAdvance
		{
			if(_memoryadvance == null)
			{
				_memoryadvance = ConfigManager.instance.memoryAdvance_memoryAdvance;
				_memoryadvanceLen = _memoryadvance.memoryadvanceCfg.length;
			}
			return _memoryadvance;
		}
		
		/**
		 *星级类型 
		 */		
		public static const DISTINGUISHTYPE_1:int = 1;//distinguishType
		/**
		 *进化类型 
		 */		
		public static const DISTINGUISHTYPE_2:int = 2;
		/**
		 *获取memoadvance觉醒和星级等级 
		 * @param id
		 * @param distinguishType
		 * @param starOrAwaken
		 * @return 
		 * 
		 */		
		public function getMemoryAdvance(id:int, distinguishType:int, starOrAwaken:int):ImemoryAdvanceCfg
		{
			memoryadvance;
			var cfg:ImemoryAdvanceCfg = null;
			for(var i:int = 0; i < _memoryadvanceLen; i ++)
			{
				cfg = memoryadvance.memoryadvanceCfg[i];
				if(cfg.ID == id && cfg.distinguishType == distinguishType && cfg.starOrAwaken)
				{
					return cfg;
				}
			}
			
			return null;
		}
		
		/**
		 *羁绊等级属性 
		 * @param id
		 * @param level
		 * @return 
		 * 
		 */		
		public function getMemoryUpCfg(id:int, level:int):ImemoryUpCfg
		{
			memoryUp;
			var cfg:ImemoryUpCfg = null;
			for(var i:int = 0; i < _memoryUpLen; i ++)
			{
				cfg = memoryUp.memoryupCfg[i];
				if(cfg.ID == id && cfg.level == level)
				{
					return cfg;
				}
			}
			
			trace("getMemoryUpCfg当前ID和等级没记羁绊id：" + id.toString() + ",level:" + level.toString());
			return null;
		}
		
		
		private var _memoryExp:ImemoryExp = null;
		private var _memoryExpLen:int = 0;
		/**
		 *羁绊品质等级经验表 
		 * @return 
		 * 
		 */		
		private function get memoryExp():ImemoryExp
		{
			if(_memoryExp == null)
			{
				_memoryExp = ConfigManager.instance.memoryExp_memoryExp;
				_memoryExpLen  = _memoryExp.memoryexpCfg.length;
			}
			return _memoryExp;
		}
		
		
		/**
		 *获取当前羁绊升级所需经验 
		 * @param level
		 * @param type
		 * @return 
		 * 
		 */		
		public function getmemoryUpNeedExp(level:int, quality:int):int
		{
			memoryExp;
			var cfg:ImemoryExpCfg = null;
			for(var i:int = 0; i < _memoryExpLen; i ++)
			{
				cfg = memoryExp.memoryexpCfg[i];
				if(cfg.level == level && cfg.quality == quality)
				{
					return cfg.exp;
				}
			}
			
			trace("getmemoryUpNeedExp当前等级和类型不存在经验数值:level，" + level.toString() + "quality," + quality.toString());
			return 0;
		}
		
		
		private var _memorybase:ImemoryBase = null;
		private var _memorybaseLen:int = 0;
		private function get memoryBase():ImemoryBase
		{
			if(_memorybase == null)
			{
				_memorybase = ConfigManager.instance.memoryBase_memoryBase;
				_memorybaseLen = _memorybase.memorybaseCfg.length;
			}
			return _memorybase;
		}
		/**
		 *通过ID获取羁绊基本数据 
		 * @param id
		 * @return 
		 * 
		 */		
		public function getMemoryBaseCfg(id:int):ImemoryBaseCfg
		{
			memoryBase;
			var cfg:ImemoryBaseCfg = null;
			for(var i:int = 0; i < _memorybaseLen; i ++)
			{
				cfg = memoryBase.memorybaseCfg[i];
				if(cfg.id == id)
					return cfg;
			}
			trace("getMemoryBaseCfg没有此ID：" + id.toString());
			return null;
		}
		
		
		private static var __instance:JibanUtil = null;
		public static function get instance():JibanUtil
		{
			if(__instance == null)
				__instance = new JibanUtil();
			return __instance;
		}
	}
}