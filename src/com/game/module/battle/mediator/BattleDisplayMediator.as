/**
 * Created by dingcj on 2018/6/20.
 */
package com.game.module.battle.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.module.battle.events.BattleEvent;
import com.game.module.battle.view.BattleDisplayView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class BattleDisplayMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "BattleDisplayMediator";

    private var score:int = 0;

    private function get view():BattleDisplayView {
        return getViewComponent() as BattleDisplayView;
    };
    public function BattleDisplayMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
        view.finishSignal.getSignal(this).listen(onFinish);
        view.clickSignal.getSignal(this).listen(onClick);
    }

    private function onFinish():void {
        score = 100;
        dispatch(new Notification(BattleEvent.BATTLE_PROGRESS_UPDATE, [score]));
    }

    private function instanceCompleteHander():void {

    }

    private function onClick():void {
        dispatch(new Notification(BattleEvent.BATTLE_DISPLAY));
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