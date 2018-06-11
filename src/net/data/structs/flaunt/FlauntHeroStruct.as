package net.data.structs.flaunt {
/**
 * 炫耀武将的消息结构
 */
public class FlauntHeroStruct {
    /**武将编号*/
    public var id:uint = 0;
    /**姓名*/
    public var name:String = "";
    /**职业*/
    public var clss:uint = 0;
    /**性别*/
    public var sex:uint = 0;
    /**肖像*/
    public var portrait:uint = 0;
    /**等级*/
    public var level:uint = 0;
    /**潜力*/
    public var potential:Number = 0;
    /**技能*/
    public var skill:uint = 0;
    /**力量*/
    public var power:uint = 0;
    /**敏捷*/
    public var agility:uint = 0;
    /**智力*/
    public var intelligence:uint = 0;
    /**体质*/
    public var strength:uint = 0;
    /**攻击*/
    public var attack:uint = 0;
    /**防御*/
    public var defend:uint = 0;
    /**hp*/
    public var hp:uint = 0;
    /**命中*/
    public var hitrate:Number = 0;
    /**闪避*/
    public var evade:Number = 0;
    /**暴击*/
    public var critical:Number = 0;
    /**破击*/
    public var pierce:Number = 0;
    /**反击*/
    public var counter:Number = 0;

    /** 意志*/
    public var will:uint;
    /** 法攻*/
    public var magic_ap:uint;
    /** 法防*/
    public var magic_def:uint;
    /** 法抗*/
    public var magic_dodge:Number;
    /** 抗暴*/
    public var touch:Number;
    /**身法*/
    public var act:Number;

    public function FlauntHeroStruct() {
    }
}
}