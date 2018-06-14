/**
 * Created by dingcj on 2018/6/1.
 */
package com.game.module.battle.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.module.battle.events.BattleEvent;
import com.game.module.battle.view.BattleStrengthView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class BattleStrengthMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "BattleStrengthMediator";
    private var score:int = 0;

    private function get view():BattleStrengthView {
        return getViewComponent() as BattleStrengthView;
    };
    public function BattleStrengthMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();

        score = 0;

        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
        view.finishSignal.getSignal(this).listen(onFinished);
    }

    private function instanceCompleteHander():void {
        calculateScore();
    }

    private function calculateScore():void {
        score = 100;
        dispatch(new Notification(BattleEvent.BATTLE_PROGRESS_UPDATE, [score]))
    }

    private function onFinished():void {
        dispatch(new Notification(BattleEvent.BATTLE_STRENGTH_FINISHED))
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