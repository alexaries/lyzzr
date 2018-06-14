/**
 * Created by dingcj on 2018/6/14.
 */
package com.game.module.battle.vo {
public class BattleExpertVo extends BaseBattleEventVo {
    public var expertEventIntroduce:String;//专家事件介绍
    public var propertyId:int;//专家事件关键词
    public var expertEventRule:String;//专家事件选择规则
    public var expertEventFeedback:String;//专家事件选择反馈

    public static function create(_expertEventIntroduce:String, _propertyId:int, _expertEventRule:String, _expertEventFeedback:String):BattleExpertVo {
        var expertVo:BattleExpertVo = new BattleExpertVo();
        expertVo.type = 2;
        expertVo.expertEventIntroduce = _expertEventIntroduce;
        expertVo.propertyId = _propertyId;
        expertVo.expertEventRule = _expertEventRule;
        expertVo.expertEventFeedback = _expertEventFeedback;
        return expertVo;
    }
}
}
