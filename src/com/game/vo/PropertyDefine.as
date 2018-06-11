/*******************************************************************************
 * Class name:	PropertyDefine.as
 * Description:	属性定义
 * Author:		caoqingshan
 * Create:		Jun 13, 2013 11:03:42 AM
 * Update:		Jun 13, 2013 11:03:42 AM
 ******************************************************************************/
package com.game.vo
{
import com.game.module.battledisposition.vo.RankPropVo;


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
		public static function addProperty(prop1:Array,prop2:Array):Array{
			if(!prop1)
				prop1 = CreateZeroProperty();
			if(!prop2)
				prop2 = CreateZeroProperty();
			var maxlen:uint = Math.max(prop1.length,prop2.length);
			var returnArr : Array = [];
			for (var i : int = 0;i < maxlen;i++ ) {
				if(!returnArr[i])
					returnArr[i] = 0;
				if(!prop1[i])
					prop1[i] = 0;
				returnArr[i] += prop1[i];
				if(!prop2[i])
					prop2[i] = 0;
				returnArr[i] += prop2[i];
			}
			return returnArr;
		}
		/**
		 *每条属性 * num
		 * @param prop
		 * @param num
		 * @return
		 *
		 */
		public static function pursueProperty(prop:Array,num:Number):Array{
			if(!prop){
				prop = CreateZeroProperty();
			}
			var returnArr : Array = [];
			var len:int = prop.length;
			for (var i:int = 0; i < len; i++)
			{
				returnArr[i] = Math.floor(prop[i]*num);
			}
			return returnArr;
		}
		public static function goodsPropsToArray(tempPropsVO:GoodsPropsVO):Array{
			var propertyArray:Array = CreateZeroProperty();
			if(!tempPropsVO)
				return propertyArray ;
			propertyArray[AP_VALUE] += tempPropsVO.apValue ;
			propertyArray[AP_MAGIC_VALUE] += tempPropsVO.ap_magicValue ;
			propertyArray[DEF_VALUE] += tempPropsVO.defValue ;
			propertyArray[DEF_MAGIC_VALUE] += tempPropsVO.def_magicValue ;
			propertyArray[POWER_VALUE] += tempPropsVO.powerValue ;
			propertyArray[INELLIGENCE_VALUE] += tempPropsVO.inelligenceValue ;
			propertyArray[STRENGTH_VALUE] += tempPropsVO.strengthValue ;
			propertyArray[AGILITY_VALUE] += tempPropsVO.agilityValue ;
			propertyArray[WILL_VALUE] += tempPropsVO.willValue ;
			propertyArray[HP_VALUE] += tempPropsVO.hpValue ;
			propertyArray[ACT_VALUE] += tempPropsVO.actValue ;
			propertyArray[SOUL_VALUE] += tempPropsVO.soulValue ;
			propertyArray[AURA_VALUE] += tempPropsVO.auro_baseValue ;
			propertyArray[AURA_MAX_VALUE] += tempPropsVO.aura_maxValue ;
			
//            propertyArray[CRITE_REDUCE_DEMAGE] += Number(tempPropsVO.CRIT_REDUCE_DEMAGE);  //这个算重复了，先注释了
            propertyArray[AP_STAB] += Number(tempPropsVO.AP_STAB);
			if (tempPropsVO.hit.indexOf('%') != -1)
				propertyArray[HIT] += tempPropsVO.hitValue ;
			else
				propertyArray[HIT_VALUE] += tempPropsVO.hitValue ;

			if (tempPropsVO.dodge.indexOf('%') != -1)
				propertyArray[DODGE] += tempPropsVO.dodgeValue ;
			else
				propertyArray[DODGE_VALUE] += tempPropsVO.dodgeValue ;

			if (tempPropsVO.dodge_magic.indexOf('%') != -1)
				propertyArray[DODGE_MAGIC] += tempPropsVO.dodge_magicValue ;
			else
				propertyArray[DODGE_MAGIC_VALUE] += tempPropsVO.dodge_magicValue ;

			if (tempPropsVO.crit.indexOf('%') != -1)
				propertyArray[CRIT] += tempPropsVO.critValue ;
			else
				propertyArray[CRIT_VALUE] += tempPropsVO.critValue ;

			if (tempPropsVO.tough.indexOf('%') != -1)
				propertyArray[TOUGH] += tempPropsVO.toughValue ;
			else
				propertyArray[TOUGH_VALUE] += tempPropsVO.toughValue ;

			if (tempPropsVO.pierce.indexOf('%') != -1)
				propertyArray[PIERCE] += tempPropsVO.pierceValue ;
			else
				propertyArray[PIERCE_VALUE] += tempPropsVO.pierceValue ;

			if (tempPropsVO.repel.indexOf('%') != -1)
				propertyArray[REPEL] += tempPropsVO.repelValue ;
			else
				propertyArray[REPEL_VALUE] += tempPropsVO.repelValue ;

			if (tempPropsVO.crit_damage.indexOf('%') != -1)
				propertyArray[PropertyDefine.CRIT_DAMAGE_VALUE] += tempPropsVO.crit_damageValue ;
			else
				propertyArray[PropertyDefine.CRIT_DAMAGE_VALUE] += tempPropsVO.crit_damageValue ;
            if(tempPropsVO.PIERCE_DEMAEG.toString().indexOf('%') != -1){
                propertyArray[PropertyDefine.PIERCE_DEMAEG]   +=  tempPropsVO.pierce_damageValue;
            }else{
                propertyArray[PropertyDefine.PIERCE_DEMAEG]   +=  tempPropsVO.pierce_damageValue;
            }
            if(tempPropsVO.PIERCE_REDUCE_DEMAEG.toString().indexOf('%') != -1){
                propertyArray[PropertyDefine.PIERCE_REDUCE_DEMAEG]   +=  tempPropsVO.pierceDamage_reduceValue
            }else{
                propertyArray[PropertyDefine.PIERCE_REDUCE_DEMAEG]   +=  tempPropsVO.pierceDamage_reduceValue
            }
            if(tempPropsVO.CRIT_REDUCE_DEMAGE.toString().indexOf('%') != -1){
                propertyArray[PropertyDefine.CRITE_REDUCE_DEMAGE]   +=  tempPropsVO.crit_reduceValue
            }else{
                propertyArray[PropertyDefine.CRITE_REDUCE_DEMAGE]   +=  tempPropsVO.crit_reduceValue
            }
            if(tempPropsVO.DEMAGE_TAKEIN.toString().indexOf('%') != -1){
                propertyArray[PropertyDefine.DEMAGE_TAKEIN]   +=  tempPropsVO.demage_takeInValue
            }else{
                propertyArray[PropertyDefine.DEMAGE_TAKEIN]   +=  tempPropsVO.demage_takeInValue
            }
            if(tempPropsVO.IGNOR_CRITE_REDUCE_CEMAGE.toString().indexOf('%') != -1){
                propertyArray[PropertyDefine.IGNOR_CRITE_REDUCE_CEMAGE]   +=  tempPropsVO.ignore_crit_reduce_demage
            }else{
                propertyArray[PropertyDefine.IGNOR_CRITE_REDUCE_CEMAGE]   +=  tempPropsVO.ignore_crit_reduce_demage
            }
			return propertyArray ;
		}

        public static function rankPropsToArray(rankPropvo:RankPropVo):Array{
            var propertyArray:Array = CreateZeroProperty();
            if (rankPropvo.ap.indexOf('%') != -1)
                propertyArray[PropertyDefine.AP_PERCENT] += rankPropvo.apValue ;
            else
                propertyArray[PropertyDefine.AP_VALUE] += rankPropvo.apValue ;

            if (rankPropvo.ap_magic.indexOf('%') != -1)
                propertyArray[PropertyDefine.AP_MAGIC_PERCENT] += rankPropvo.ap_magicValue ;
            else
                propertyArray[PropertyDefine.AP_MAGIC_VALUE] += rankPropvo.ap_magicValue ;

            if (rankPropvo.def.indexOf('%') != -1)
                propertyArray[PropertyDefine.DEF_PERCENT] += rankPropvo.defValue ;
            else
                propertyArray[PropertyDefine.DEF_VALUE] += rankPropvo.defValue ;

            if (rankPropvo.def_magic.indexOf('%') != -1)
                propertyArray[PropertyDefine.DEF_MAGIC_PERCENT] += rankPropvo.def_magicValue ;
            else
                propertyArray[PropertyDefine.DEF_MAGIC_VALUE] += rankPropvo.def_magicValue ;

            if (rankPropvo.power.indexOf('%') != -1)
                propertyArray[PropertyDefine.POWER_PERCENT] += rankPropvo.powerValue ;
            else
                propertyArray[PropertyDefine.POWER_VALUE] += rankPropvo.powerValue ;

            if (rankPropvo.inelligence.indexOf('%') != -1)
                propertyArray[PropertyDefine.INELLIGENCE_PERCENT] += rankPropvo.inelligenceValue ;
            else
                propertyArray[PropertyDefine.INELLIGENCE_VALUE] += rankPropvo.inelligenceValue ;

            if (rankPropvo.strength.indexOf('%') != -1)
                propertyArray[PropertyDefine.STRENGTH_PERCENT] += rankPropvo.strengthValue ;
            else
                propertyArray[PropertyDefine.STRENGTH_VALUE] += rankPropvo.strengthValue ;

            if (rankPropvo.agility.indexOf('%') != -1)
                propertyArray[PropertyDefine.AGILITY_PERCENT] += rankPropvo.agilityValue ;
            else
                propertyArray[PropertyDefine.AGILITY_VALUE] += rankPropvo.agilityValue ;

            if (rankPropvo.will.indexOf('%') != -1)
                propertyArray[PropertyDefine.WILL_PERCENT] += rankPropvo.willValue ;
            else
                propertyArray[PropertyDefine.WILL_VALUE] += rankPropvo.willValue ;

            if (rankPropvo.hp.indexOf('%') != -1)
                propertyArray[PropertyDefine.HP_PERCENT] += rankPropvo.hpValue ;
            else
                propertyArray[PropertyDefine.HP_VALUE] += rankPropvo.hpValue ;

            if (rankPropvo.act.indexOf('%') != -1)
                propertyArray[PropertyDefine.ACT_PERCENT] += rankPropvo.actValue ;
            else
                propertyArray[PropertyDefine.ACT_VALUE] += rankPropvo.actValue ;

            if (rankPropvo.soul.indexOf('%') != -1)
                propertyArray[PropertyDefine.SOUL_PERCENT] += rankPropvo.soulValue ;
            else
                propertyArray[PropertyDefine.SOUL_VALUE] += rankPropvo.soulValue ;

            if (rankPropvo.hit.indexOf('%') != -1)
                propertyArray[PropertyDefine.HIT] += rankPropvo.hitValue ;
            else
                propertyArray[PropertyDefine.HIT_VALUE] += rankPropvo.hitValue ;

            if (rankPropvo.dodge.indexOf('%') != -1)
                propertyArray[PropertyDefine.DODGE] += rankPropvo.dodgeValue ;
            else
                propertyArray[PropertyDefine.DODGE_VALUE] += rankPropvo.dodgeValue ;

            if (rankPropvo.dodge_magic.indexOf('%') != -1)
                propertyArray[PropertyDefine.DODGE_MAGIC] += rankPropvo.dodge_magicValue ;
            else
                propertyArray[PropertyDefine.DODGE_MAGIC_VALUE] += rankPropvo.dodge_magicValue ;

            if (rankPropvo.crit.indexOf('%') != -1)
                propertyArray[PropertyDefine.CRIT] += rankPropvo.critValue ;
            else
                propertyArray[PropertyDefine.CRIT_VALUE] += rankPropvo.critValue ;

            if (rankPropvo.tough.indexOf('%') != -1)
                propertyArray[PropertyDefine.TOUGH] += rankPropvo.toughValue ;
            else
                propertyArray[PropertyDefine.TOUGH_VALUE] += rankPropvo.toughValue ;

            if (rankPropvo.pierce.indexOf('%') != -1)
                propertyArray[PropertyDefine.PIERCE] += rankPropvo.pierceValue ;
            else
                propertyArray[PropertyDefine.PIERCE_VALUE] += rankPropvo.pierceValue ;

            if (rankPropvo.repel.indexOf('%') != -1)
                propertyArray[PropertyDefine.REPEL] += rankPropvo.repelValue ;
            else
                propertyArray[PropertyDefine.REPEL_VALUE] += rankPropvo.repelValue ;

            if (rankPropvo.crit_damage.indexOf('%') != -1)
                propertyArray[PropertyDefine.CRIT_DAMAGE_VALUE] += rankPropvo.crit_damageValue ;
            else
                propertyArray[PropertyDefine.CRIT_DAMAGE_VALUE] += rankPropvo.crit_damageValue ;

            return propertyArray ;
        }

	}
}