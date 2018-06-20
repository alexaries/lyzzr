/**
 * Created by dingcj on 2018/6/11.
 */
package com.game.module.battle.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.common.view.Alert;
import com.game.module.battle.events.BattleEvent;
import com.game.module.battle.view.BattleEventView;
import com.game.module.battle.view.items.BattleDialogItem;
import com.game.module.battle.vo.BattleExpertVo;
import com.game.module.menu.events.MenuEvent;
import com.game.vo.MenuWinType;

import lang.SystemInfo;

import laya.utils.Handler;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class BattleEventMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "BattleEventMediator";

    private var score:int = 0;

    private function get view():BattleEventView {
        return getViewComponent() as BattleEventView;
    };

    public function BattleEventMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
        view.skipSignal.getSignal(this).listen(onSkipClick);
        view.moreSignal.getSignal(this).listen(onMoreClick);
        view.sureSignal.getSignal(this).listen(onSureClick);
        view.dialogSignal.getSignal(this).listen(onDialogClick);

        view.resultSureSignal.getSignal(this).listen(onResultSureClick);
    }

    private function instanceCompleteHander():void {

    }

    private function onDialogClick(item:BattleDialogItem):void {
        trace("选择了第[" + item.getIndex + "]个")

        //通过 item.getDataVo
        //计算出得分 传出去 然后关闭界面

        score = 100;
        dispatch(new Notification(BattleEvent.BATTLE_PROGRESS_UPDATE, [score]));

        view.updateState(0);
        view.updateEventResult(item.getDataVo.feedBack);
    }

    private function onSureClick(expertVo:BattleExpertVo):void {
        //专家事件 选定角色并确认
        view.updateState(0);

        //计算出 当前的fail?normal?perfect
        view.updateEventResult(expertVo.expertEventFeedback);

        score = 100;
        dispatch(new Notification(BattleEvent.BATTLE_PROGRESS_UPDATE, [score]));
    }

    private function onMoreClick():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.EXPERT_VIEW, MenuWindowVO.OPEN, true)));
    }

    private function onSkipClick():void {
        Alert.show("是否放弃?放弃的话直接得分为0", "提示", [SystemInfo.OK, SystemInfo.CANCEL], Handler.create(this, function (type:String) {
            if (type == "ok") {
                score = 0;//放弃的话
                view.updateState(0);
                view.updateEventResult("本轮放弃了");
            }
            else if (type == "cancel") {

            }
        }, null, false));
    }

    private function onResultSureClick():void {
        dispatch(new Notification(BattleEvent.BATTLE_EVENT_FINISHED));
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case "":
                break;
        }
    }
}
}