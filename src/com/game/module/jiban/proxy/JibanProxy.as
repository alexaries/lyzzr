package com.game.module.jiban.proxy
{
	import com.game.common.mvc.BaseProxy;
	import com.game.module.jiban.vo.JibanVO;
	
	import org.puremvc.as3.interfaces.IProxy;
	
	public class JibanProxy extends BaseProxy implements IProxy
	{
		public static const NAME:String = "JibanProxy"
		public function JibanProxy()
		{
			super(NAME);
		}
		
		private var _jibanlen:int = 0;
		private var _jibanvos:Array = null;
		
		public function get jibanvos():Array
		{
			return _jibanvos;
		}
		
		public function set jibanvos(value:Array):void
		{
			_jibanvos = value;
			freshJibanLen();
		}
		
		public function getJibanVOSByRoleType(roletype:int):Array
		{
			var arr:Array = [];
			var vo:JibanVO = null;
			for(var i:int = 0; i < _jibanlen; i ++)
			{
				vo = jibanvos[i] as JibanVO;
				if(vo.base.roleType == roletype)
				{
					arr.push(vo);
				}
			}
			return arr;
		}
		/**
		 *获取羁绊ByID
		 * @param id
		 * @return 
		 * 
		 */		
		public function getJibanvoByID(id:int):JibanVO
		{
			var vo:JibanVO = null;
			for(var i:int = 0; i < _jibanlen; i  ++)
			{
				vo = _jibanvos[i] as JibanVO;
				if(vo.id == id)
					return vo;
			}
			return null;
		}
		
		private function freshJibanLen():void
		{
			_jibanlen = _jibanvos.length;
		}
		
		
	}
}