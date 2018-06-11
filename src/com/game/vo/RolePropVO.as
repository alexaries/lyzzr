package com.game.vo
{
	/**
	 * 名将的初始值 
	 * @author RyanCao
	 * 
	 */
	public class RolePropVO
	{
		public function RolePropVO()
		{
		}
		public var id:uint ;
		
		//基础力量
		public var strength:Number = 10; 		
		//基础敏捷
		public var quick:Number  = 10; 		
		//基础智力
		public var intelligence:Number =10 ;	
		//基础耐力
		public var endurance:Number  = 10; 	
		//基础意志
		public var willpower:Number  = 10; 	
		
		//基础元神力上限
		public var soul_max:Number 	= 20; 		
		//基础体力(血上限)
		public var p_s:Number 	= 20;
		 				
		//基础灵气(影响无双技能伤害)
		public var aura:Number 	= 100; 				
		//基础出场灵气(影响无双技能伤害)
		public var aura_start:Number 	= 0;
		 				
		//基础法术抵挡(影响无双技能伤害)
		public var dodge_magic:Number 	= 20; 		
				
		//基础物理攻击力
		public var ap:Number = 5; 				
		//基础物理防御力
		public var def:Number = 0; 				
		//基础法术攻击力
		public var ap_magic:Number = 20; 				
		//基础法术防御
		public var def_magic:Number 	= 20; 
						
		//基础命中
		public var hit:Number = 90; 				
		//基础躲避
		public var dodge:Number = 0; 			
		//基础暴击
		public var crit:Number = 0 ; 				
		//基础暴击伤害倍数
		public var crit_times:Number = 0 ; 				
		//基础坚韧
		public var tough:Number = 0 ; 				
		//基础反击
		public var repel:Number = 0 ; 				
		//基础破击
		public var broke:Number = 0;				
		//基础身法
		public var act:Number ;
		
		//基础修炼经验值
		public var p_exp:uint = 50000;				
		//基础可获得最大修炼经验值
		public var p_exp_max:uint = 50000;
		
	}
}