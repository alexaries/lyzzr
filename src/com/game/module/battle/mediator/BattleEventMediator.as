/**
 * Created by dingcj on 2018/6/11.
 */
package com.game.module.battle.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.module.battle.events.BattleEvent;
import com.game.module.battle.view.BattleEventView;
import com.game.module.battle.view.items.BattleDialogItem;

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

    private function onDialogClick(item:BattleDialogItem):void {
        trace("选择了第[" + item.getIndex + "]个")

        //通过 item.getDataVo
        //计算出得分 传出去 然后关闭界面

        score = 0;

        view.updateState(0);
        view.updateEventResult(item.getDataVo.content);
    }

    private function onResultSureClick():void {
        dispatch(new Notification(BattleEvent.BATTLE_EVENT_FINISHED));
    }

    private function onSureClick():void {
        //专家事件 选定角色并确认
    }

    private function onMoreClick():void {

    }

    private function onSkipClick():void {

    }

    private function instanceCompleteHander():void {

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