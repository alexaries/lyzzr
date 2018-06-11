package net.data.structs.fight {
public class CharacterStruct {
    /**所属玩家id (1-10=玩家id, 0-空, 255, 254, 253 - 障碍物 )*/
    public var belongPlayer:Number = 0;
    /**人物名字*/
    public var name:String = "";
    /**人物职业, 0 - 猛将男,1 - 猛将女,2 - 刺客男,3 - 刺客女,4 - 术士男,5 - 术士女,  10-符咒*/
    public var career:Number = 0;
    public var sex:uint = 0;
    //半身画像
    public var protait:uint = 0;
    /**等级*/
    public var level:uint = 0;
    /**武将颜色**/
    public var color:uint;
    /**所持武器id*/
    public var weaponId:uint = 0;
    /**当前hp*/
    public var hp:uint = 0;
    /**hp上限*/
    public var hpTotal:uint = 0;
    /**加成后的hp上限*/
    public var addedHpTotal:uint = 0;
    public var aura:uint = 0;
    public var auraMax:uint = 0;
    /**攻击*/
    public var ap:uint = 0;
    /** ushort  加成后的攻击*/
    public var addedAp:uint = 0;
    /*法术攻击*/
    public var magicAtk:uint = 0;
    /**ushort  防御*/
    public var def:uint = 0;
    /**ushort  加成后的防御*/
    public var addedDef:uint = 0;
    /*法术防御*/
    public var magicDef:uint = 0;
    /**障碍物hp*/
    public var obstacleHp:uint = 0;
    /**护盾**/
    public var hpFudun:uint = 0;

    /**
     * 1-25
     * */
    public var pos:Number = 0;
    public var buff:Number = 0;
    public var action:Number = 0;//身法
    public var hitrate:Number = 0;//命中
    public var evade:Number = 0;//闪避
    public var critical:Number = 0;//暴击
    public var pierce:Number = 0;//破甲
    public var counter:Number = 0;//反击
    public var tough:Number = 0;//坚韧
//		public var magres:Number = 0;
    public var criticaldmg:Number = 0;//暴击伤害
    public var crtdmg:Number = 0;//法术抵抗
    public var physicAvoidInjury:Number = 0;//物理免伤
    public var magicAvoidInjury:Number = 0;//法术免伤

    /**
     * position=0;
     * */
    public var type:Number;
    public var wpos:Number;
    public var whp:Number;

    public var skillID:uint;
    public var skillLevel:uint;

    /*无双*/
    public var s1:uint;
    /*主动*/
    public var s2:Array = [];
    /*被动*/
    public var s3:Array = [];
    /*符文*/
    public var insignias:Array = [];

    public function CharacterStruct() {
    }


}
}