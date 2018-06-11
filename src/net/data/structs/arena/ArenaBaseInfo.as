package net.data.structs.arena {
/**
 * @author hokenny
 */
public class ArenaBaseInfo {
    public var currRank:int;
    public var maxRank:int;
    /**当前斗剑次数*/
    public var fightTimes:int;
    /**连胜*/
    public var winStreak:int;
    public var time:int;
    /**当前声望奖励*/
    public var prestige:uint = 0;
    /**当前银币奖励*/
    public var silver:uint = 0;
    /**历练冷却时间*/
    public var exsTime:uint = 0;
}
}
