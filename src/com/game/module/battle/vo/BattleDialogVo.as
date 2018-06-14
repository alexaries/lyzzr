/**
 * Created by dingcj on 2018/6/14.
 */
package com.game.module.battle.vo {
public class BattleDialogVo extends BaseBattleEventVo {
    public var dialogEventIntroduce:String;//对话事件介绍
    public var dialogEventContent:String;//对话事件内容
    public var dialogEventRule:String;//对话事件选择规则
    public var dialogEventFeedback:String;//对话事件选择反馈

    public static function create(_dialogEventIntroduce:String, _dialogEventContent:String, _dialogEventRule:String, _dialogEventFeedback:String):BattleDialogVo {
        var dialogVo:BattleDialogVo = new BattleDialogVo();
        dialogVo.type = 1;
        dialogVo.dialogEventIntroduce = _dialogEventIntroduce;
        dialogVo.dialogEventContent = _dialogEventContent;
        dialogVo.dialogEventRule = _dialogEventRule;
        dialogVo.dialogEventFeedback = _dialogEventFeedback;
        return dialogVo;
    }
}
}
