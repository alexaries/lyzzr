package net.data.structs.fight {
public class ActionStruct {
    /**行动方
     * 0 - A方
     * 1 - B方
     * */
    public var actSide:Number = 0;
    /**动作类型
     * 0 - 攻击
     * 1 - 连锁攻击
     * 2 - 武将技/主动技
     * 3 - 阵型技
     * 4 - 使用物品
     * 0x20 - 连击flag，仅用于主动技
     * 0x40 - 破击flag
     * 0x80 - 暴击flag
     * */
    public var actType:Number = 0;
    /** 连击，仅用于主动技 */
    public var multiAt:uint = 0;
    /** 破击 */
    public var prcAt:uint = 0;
    /** 暴击 */
    public var critAt:uint = 0;
    /**附加动作属性,
     * 动作为攻击/连锁攻击时
     * 为保留空,当动作为武将技/主动技时
     * 表示技能id,当动作为阵型技时
     * 此为阵型技能id(如果每个阵型可以有多个阵型技)或者为保留空,当动作为使用物品时
     * 表示物品id
     * */
    public var additionProperty:uint = 0;
    /**动作结果
     * 0 - 无变化
     * 1 - 被攻击方溃阵
     * 2 - 攻击方溃阵
     * 3 - 双方均溃阵
     * 4 - 攻击方复阵
     * */
    public var actResult:Number = 0;
    /**攻击点的格子位 (0-24表示被攻击方，25-49表示攻击方)*/
    public var atGrid:Number = 0;
    /**行动玩家数量p*/
    public var actPlayerNums:Number = 0;
    /**行动玩家列表，详细见attacker结构 AttackerStruct*/
    public var actPlayerList:Array = [];
    /**受作用玩家数量q*/
    public var defPlayerNums:Number = 0;
    /**作用结果列表，详细见effect结构 EffectStruct*/
    public var defPlayerList:Array = [];
    /**状态改变的玩家数量*/
    public var stateChangeNums:Number = 0;
    /**状态改变结果列表，详细见status结构 StatusStruct*/
    public var stateChangeList:Array = [];
    //回合数
    public var round:Number;


    public function ActionStruct() {
    }

}
}
