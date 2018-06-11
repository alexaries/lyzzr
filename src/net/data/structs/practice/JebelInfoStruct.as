package net.data.structs.practice {
/**
 * @author hokenny
 */
public class JebelInfoStruct {
    /**0:昆仑山,1:黄山,2:武当山,3:九华山,4:衡山,5:喜马拉雅山,6:无主之地*/
    public var type:uint = 0;
    /**修炼速度*/
    public var speed:uint = 0;
    /**修炼所需银币*/
    public var cost:uint = 0;
    /**所属帮派*/
    public var owner:String = "";
    /**修炼人数上限*/
    public var totalSpace:uint = 0;
    /**已被占领空间*/
    public var occupySpace:uint = 0;
    /**护法弟子*/
    public var protector:String = "";
    /**护法弟子等级*/
    public var protectLevel:uint = 0;
    /**护法弟子职业*/
    public var protectorCareer:uint = 0;
    /**护法弟子性别*/
    public var protectGender:uint = 0;
    /**来犯敌人总次数*/
    public var enemyCount:uint = 0;
    /**赢的次数*/
    public var winCount:uint = 0;
}
}
