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
		
		
		private var _jibanvos:Array = null;
		
		public function get jibanvos():Array
		{
			return _jibanvos;
		}
		
		
		
	}
}