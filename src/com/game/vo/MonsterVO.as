package com.game.vo
{
	import net.consts.StaticConfig;

	/**
	 * 怪物NPC类 
	 * @author RyanCao
	 * 
	 */
	public class MonsterVO
	{
        public var id:int;
        public var name:String;
		public function MonsterVO()
		{
			super();
		}
		public var level:uint = 0;
		/**属性编号*/
		public var propId:uint = 0;
		/**技能编号*/
		public var skillId:uint = 0;
		/**称号*/
		public var title:String = "";
		/**头像编号*/
		public var imgID:uint =0 ;
		/**模型编号*/
		public var roleID:String = "";
		/**默认对话*/
		public var info:String = "";
		/**功能行为id*/
		public var functionId:uint = 0;
		/**区别一般怪 与Boss怪物*/
		public var type:int ;
		public var footHoldId:uint ;
		public function get roleString():String{
			return StaticConfig.httpServer+"fightldk/avatars/"+roleID + ".swf";
		}
		
		public function get imgString():String{
			return StaticConfig.httpServer + 'avatars/npc/' + toMixString(imgID, 4) + ".jpg";
		}
		
		private function toMixString(i:int,len:int):String
		{
			var s:String = i.toString();
			var return_s:String = "";
			for(var j:int = s.length;j<len ; j++){
				return_s += "0";
			}
			return_s += s;
			return return_s;
		}
	}
}