package com.game.vo
{
	import lang.LangTxt;
	/**
	 * 职业成长
	 * @author RyanCao
	 * 
	 */	
	public class CareerGrowVO {
		
		public function CareerGrowVO()
		{
		}
		public var id:int = 1 ;
		public var name:String = LangTxt.FIGHTER ;
		
		/**
		 * 0 - 普通将领
		 * 1 - 蓝主将
		 * 2 - 紫主将
		 * 3 - 橙主将
		 */		
		public var status:int = 0 ;
		//力量成长
		public var strength_grow:Number = 2;
		//敏捷成长
		public var quick_grow:Number = 0.5;
		//智力成长
		public var intelligence_grow:Number = 0.5;
		//耐力成长
		public var endurance_grow:Number = 1.5 ;
		//意志成长
		public var willpower_grow:Number = 1.5 ;
		//身法成长
		public var act_grow : Number = 1;
		//命中成长
		public var hit_grow : Number = 2;
		
		//基础属性值   主要是名将可能有变化 
		//基础力量
		public var strength_base:Number = 10; 		
		//基础敏捷
		public var quick_base:Number  = 10; 		
		//基础智力
		public var intelligence_base:Number =10 ;	
		//基础耐力
		public var endurance_base:Number  = 10; 	
		//基础意志
		public var willpower_base:Number  = 10; 	
		
		
		//基础属性值   主要是名将可能有变化 
		
		//基础元神力上限
		public var soul_max_base:Number 	= 20; 		
		//基础体力(血上限)
		public var p_s_base:Number 	= 20;
		 				
		//基础灵气(影响无双技能伤害)
		public var aura_base:Number 	= 20;
		//基础出场灵气 				
		public var aura_start_base : int;
		//基础法术抵挡(影响无双技能伤害)
		public var dodge_magic_base:Number 	= 20; 		
				
		//基础物理攻击力
		public var attack_base:Number = 5; 				
		//基础物理防御力
		public var def_base:Number = 0; 				
		//基础法术攻击力
		public var attack_magic_base:Number = 20; 				
		//基础法术防御
		public var def_magic_base:Number 	= 20; 
						
		//基础命中
		public var hit_base:Number = 90; 				
		//基础躲避
		public var dodge_base:Number = 0; 			
		//基础暴击
		public var crit_base:Number = 0 ; 				
		//基础暴击伤害倍数
		public var crit_times_base:Number = 0 ; 				
		//基础坚韧
		public var tough_base:Number = 0 ; 				
		//基础反击
		public var repel_base:Number = 0 ; 				
		//基础破击
		public var broke_base:Number = 0;				
		//基础身法
		public var act_base:Number = 6000;
		
		//基础修炼经验值
		public var p_exp_base:uint = 50000;				
		//基础可获得最大修炼经验值
		public var p_exp_max_base:uint = 50000;
	}
}