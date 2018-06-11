package net.data.structs.fight {
public class EffectStruct {
    /**作用玩家的id*/
    public var playerId:Number = 0;
    /**
     * 受作用类型
     * 0 - 被伤害
     * 1 - 上前援护被伤害
     * 2 - 闪避
     * 3 - 被加血
     * 4 - 复活
     * 0x10 - 反击被闪避，仅和0x80月一起出现，且不和0x20,0x40同时出现
     * 0x20 - 反击带有破击，仅和0x80一起出现
     * 0x40 - 反击带有暴击，仅和0x80一起出现
     * 0x80 - 反击flag
     */
    public var effectType:uint = 0;
    public var effectType1:uint = 0;
    /**作用数值(复活时表示复活后恢复到的hp)*/
    public var effectValue:uint = 0;
    /**作用后hp数值(0表示死亡，复活时同作用数值)*/
    public var effectedValue:uint = 0;
    /**被攻击后武将技槽点数*/
    public var cdValue:Number = 0;
    /**反击*/
    public var repel:uint = 0;
    /**反击暴击*/
    public var repelCrit:uint = 0;
    /**反击破击*/
    public var repelPrc:uint = 0;
    /**反击闪避*/
    public var repelDodge:uint = 0;
    /**反击造成hp伤害*/
    public var repelDamage:uint = 0;
    /**反击后攻击方剩余的hp*/
    public var remainHp:uint = 0;
    /**/
    public var rhp:uint = 0;
    public var hpLeft:uint = 0;

    public var mhp:uint = 0;
    public var playerName:String;
    public var damageType:uint;

    public var f_name:String = "";

    public function EffectStruct() {
    }


}
}