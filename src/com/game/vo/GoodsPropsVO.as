/**
 * Created by huangcb on 2017/8/25.
 */
package com.game.vo {
public class GoodsPropsVO {
    /**属性id*/
    public var id:String = "";
    /**技能Id*/
    public var skills:String = "";
    /**力量*/
    public var power:String = "";
    /**耐力*/
    public var strength:String = "";
    /**智力*/
    public var inelligence:String = "";
    /**敏捷*/
    public var agility:String = "";
    /**意志*/
    public var will:String = "";
    /**体力*/
    public var hp:String = "";
    /**攻击力*/
    public var ap:String = "";
    public var ap_magic:String = "";//法术攻击
    /**防御力*/
    public var def:String = "";
    public var def_magic:String = "";//法术防御
    /**行动力*/
    public var act:String = "";
    /**元神力*/
    public var soul:String = "";
    /**命中*/
    public var hit:String = "";
    /**闪躲*/
    public var dodge:String = "";
    public var dodge_magic:String = "";//法术抵抗
    /**暴击*/
    public var crit:String = "";
    public var crit_damage:String = "";//暴击伤害
    /**破击*/
    public var pierce:String = "";
    /**反击*/
    public var repel:String = "";
    /**坚韧*/
    public var tough:String = "";
    public var aura_base:String = "";//基础灵气
    public var aura_max:String = "";//最大灵气
    public var CRIT_REDUCE_DEMAGE:String = "";//暴伤减免
    public var PIERCE_DEMAEG:int = 0;//破击伤害
    public var PIERCE_REDUCE_DEMAEG:String = "";//破击免伤

    public var AP_STAB:String = "";//攻击穿透
    public var DEMAGE_TAKEIN:String = "";//伤害吸收
    public var IGNOR_CRITE_REDUCE_CEMAGE:String = "";//无视爆伤减免
    public function GoodsPropsVO() {
    }

    /**力量*/
    public function get powerValue():Number {
        return getValue(power);
    }

    /**耐力*/
    public function get strengthValue():Number {
        return getValue(strength);
    }

    /**智力*/
    public function get inelligenceValue():Number {
        return getValue(inelligence);
    }

    /**敏捷*/
    public function get agilityValue():Number {
        return getValue(agility);
    }

    /**意志*/
    public function get willValue():Number {
        return getValue(will);
    }

    /**体力*/
    public function get hpValue():Number {
        return Math.round(getValue(hp));
    }

    /**攻击力*/
    public function get apValue():Number {
        return Math.round(getValue(ap));
    }

    /**法术攻击力*/
    public function get ap_magicValue():Number {
        return Math.round(getValue(ap_magic));
    }

    /**防御力*/
    public function get defValue():Number {
        return Math.round(getValue(def));
    }

    /**法术防御力*/
    public function get def_magicValue():Number {
        return Math.round(getValue(def_magic));
    }

    /**行动力*/
    public function get actValue():Number {
        return Math.round(getValue(act));
    }

    /**命中*/
    public function get hitValue():Number {
        return Math.floor(getValue(hit) * 100) / 100;
    }

    /**闪躲*/
    public function get dodgeValue():Number {
        return Math.floor(getValue(dodge) * 100) / 100;
    }

    /**法术抵抗*/
    public function get dodge_magicValue():Number {
        return Math.floor(getValue(dodge_magic) * 100) / 100;
    }

    /**暴击*/
    public function get critValue():Number {
        return Math.floor(getValue(crit) * 100) / 100;
    }

    /**暴击伤害*/
    public function get crit_damageValue():Number {
        return Math.floor(getValue(crit_damage) * 100) / 100;
    }

    /**破伤减免*/
    public function get pierceDamage_reduceValue():Number {
        return Math.floor(getValue(PIERCE_REDUCE_DEMAEG) * 100) / 100;
    }

    public function get demage_takeInValue():Number {
        return Math.floor(getValue(DEMAGE_TAKEIN) * 100) / 100;
    }

    public function get ignore_crit_reduce_demage():Number {
        return Math.floor(getValue(IGNOR_CRITE_REDUCE_CEMAGE) * 100) / 100;
    }

    /**破击伤害*/
    public function get pierce_damageValue():Number {
        return Math.floor(getValue(PIERCE_DEMAEG) * 100) / 100;
    }

    /**爆伤减免*/
    public function get  crit_reduceValue():Number {
        return Math.floor(getValue(CRIT_REDUCE_DEMAGE) * 100) / 100;
    }

    /**破击*/
    public function get pierceValue():Number {
        return Math.floor(getValue(pierce) * 100) / 100;
    }

    /**反击*/
    public function get repelValue():Number {
        return Math.floor(getValue(repel) * 100) / 100;
    }

    /**坚韧*/
    public function get toughValue():Number {
        return Math.floor(getValue(tough) * 100) / 100;
    }

    /**元神力*/
    public function get soulValue():Number {
        return Math.round(getValue(soul));
    }

    /**基础灵气*/
    public function get auro_baseValue():Number {
        return Math.round(getValue(aura_base));
    }

    /**最大灵气*/
    public function get aura_maxValue():Number {
        return Math.round(getValue(aura_max));
    }

    private function getValue(str:*):Number {
        var value:Number = 0;
        if(str is int)
            str = str.toString();
        if (str.substr(str.length - 1, str.length) == "%")
            value = Number(str.substr(0, str.length - 1));
        else
            value = Number(str);
        return value;
    }
}
}
