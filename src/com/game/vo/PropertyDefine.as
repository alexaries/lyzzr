/*******************************************************************************
 * Class name:	PropertyDefine.as
 * Description:	属性定义
 * Author:		caoqingshan
 * Create:		Jun 13, 2013 11:03:42 AM
 * Update:		Jun 13, 2013 11:03:42 AM
 ******************************************************************************/
package com.game.vo
{



//-----------------------------------------------------------------------------
	// import_declaration
	//-----------------------------------------------------------------------------

	public class PropertyDefine
	{
		//-----------------------------------------------------------------------------
		// Var
		//-----------------------------------------------------------------------------
		public static const LENGTH:uint = 51;
		
		public static const AP_VALUE                :uint = 0;  //物理攻击
		public static const AP_MAGIC_VALUE			:uint = 1;  //法术攻击
		public static const DEF_VALUE             	:uint = 2;  //物理防御
		public static const DEF_MAGIC_VALUE         :uint = 3;  //法术防御
		public static const POWER_VALUE             :uint = 4;  //力
		public static const INELLIGENCE_VALUE       :uint = 5;  //智
		public static const STRENGTH_VALUE          :uint = 6;  //体
		public static const AGILITY_VALUE           :uint = 7;  //敏
		public static const WILL_VALUE				:uint = 8;	//意
		public static const HP_VALUE                :uint = 9;  //体力
		public static const ACT_VALUE             	:uint = 10;  //身法
		public static const SOUL_VALUE              :uint = 11;  //灵力
		public static const HIT             		:uint = 12;  //命中|
		public static const HIT_VALUE             	:uint = 13;  //命中值|
		public static const DODGE 		           	:uint = 14;  //闪躲|
		public static const DODGE_VALUE            	:uint = 15;  //闪躲值|
		public static const DODGE_MAGIC             :uint = 16;  //法术抗性|
		public static const DODGE_MAGIC_VALUE       :uint = 17;  //法术抗性值|
		public static const CRIT             		:uint = 18;  //暴击|
		public static const CRIT_VALUE             	:uint = 19;  //暴击值|
		public static const TOUGH             		:uint = 20;  //暴击抗性|
		public static const TOUGH_VALUE             :uint = 21;  //暴击抗性值| 坚韧
		public static const PIERCE            		:uint = 22;  //破击|
		public static const PIERCE_VALUE            :uint = 23;  //破击值|
		public static const REPEL             		:uint = 24;  //反击|
		public static const REPEL_VALUE             :uint = 25;  //反击值|
		public static const AURA_VALUE           	:uint = 26;  //入场灵气|
		public static const AURA_MAX_VALUE          :uint = 27;  //灵气上限|
		public static const CRIT_DAMAGE_VALUE       :uint = 28;  //暴击伤害%|
		public static const AP_PERCENT       		:uint = 29;  //物攻%|
		public static const AP_MAGIC_PERCENT        :uint = 30;  //法术攻击%|
		public static const DEF_PERCENT       		:uint = 31;  //物理防御%|
		public static const DEF_MAGIC_PERCENT       :uint = 32;  //法术防御%|
		public static const POWER_PERCENT       	:uint = 33;  //力%|
		public static const INELLIGENCE_PERCENT     :uint = 34;  //智%|
		public static const STRENGTH_PERCENT       	:uint = 35;  //体%|
		public static const AGILITY_PERCENT       	:uint = 36;  //敏%|
		public static const WILL_PERCENT       		:uint = 37;  //意%|
		public static const HP_PERCENT       		:uint = 38;  //体力%|
		public static const ACT_PERCENT       		:uint = 39;  //身法%|
		public static const SOUL_PERCENT       		:uint = 40;  //灵力%|
        public static const XIAN_AP                 :uint = 41;  //仙术攻击
        public static const XIAN_DEF                :uint = 42;  //仙术防御
		public static const CRIT_DEF                :uint = 43;    // 暴击抗性
		public static const PIERCE_DEF              :uint = 44;   //破击抗性
		public static const REPEL_DEF               :uint = 45;    //反击抗性
		public static const AP_STAB                 :uint = 46;   //攻击穿透
		public static const CRIT_DEF_RATE				:uint = 47;//暴击抗性%
		public static const PIERCE_DEF_RATE			:uint = 48;//破击抗性%
		public static const REPEL_DEF_RATE			:uint = 49;//反击抗性%
		public static const AP_STAB_RATE				:uint = 50;//攻击穿透%
        public static const CRITE_REDUCE_DEMAGE        :uint = 51;//暴伤减免%(心法单独开辟  之前的暴伤保持不变)
        public static const PIERCE_DEMAEG               :uint = 52;//破击伤害
        public static const PIERCE_REDUCE_DEMAEG        :uint = 53;//破击伤害减免
        public static const DEMAGE_TAKEIN               :uint = 54;//伤害吸收
        public static const IGNOR_CRITE_REDUCE_CEMAGE   :uint = 55;//无视爆伤减免
        /*仙攻or仙防 转化为 物攻or法攻的百分比*/
        public static const xianTocommonFactor      :Number = 0.5;
		public static const PROPERTY_NAME:Vector.<String> = Vector.<String>(["物理攻击","法术攻击","物理防御","法术防御","力量","智力","体力","敏捷","意志","生命","身法","灵力",
		"命中","命中","躲避","躲避","法术抵抗","法术抵抗","暴击","暴击","坚韧","坚韧","破击","破击","反击","反击","入场灵气","灵气上限","暴击伤害%",
		"物攻%","法术攻击%","物理防御%","法术防御%","力%","智%","体%","敏%","意%","体力%","身法%","灵力%","仙术攻击","仙术防御","暴击抗性","破击抗性","反击抗性","攻击穿透","暴击抗性%","破击抗性%","反击抗性%","攻击穿透%",
        "暴伤减免","破击伤害","破击伤害减免","伤害吸收","无视爆伤减免"
		])
		//-----------------------------------------------------------------------------
		// ConstructorF
		//-----------------------------------------------------------------------------
		public function PropertyDefine()
		{
		}

		//-----------------------------------------------------------------------------
		// Methods
		//-----------------------------------------------------------------------------
		public static function CreateZeroProperty():Array{
			return [0, 0, 0, 0, 0,
					0, 0, 0, 0, 0,
					0, 0, 0, 0, 0,
					0, 0, 0, 0, 0,
					0, 0, 0, 0, 0,
					0, 0, 0, 0, 0,
					0, 0, 0, 0, 0,
					0, 0, 0, 0, 0,
					0, 0, 0, 0, 0,
                    0, 0, 0, 0, 0,
                    0, 0, 0, 0, 0,
                    0, 0, 0, 0, 0
				];
		}
	}
}