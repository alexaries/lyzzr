/**
 * Created by dingcj on 2018/6/1.
 */
package com.game.module.battle.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.module.battle.events.BattleEvent;
import com.game.module.battle.view.BattleProgressView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class BattleProgressMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "BattleProgressMediator";

    private function get view():BattleProgressView {
        return getViewComponent() as BattleProgressView;
    };
    public function BattleProgressMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
    }

    private function instanceCompleteHander():void {

    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [
            BattleEvent.BATTLE_PROGRESS_UPDATE
        ];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case BattleEvent.BATTLE_PROGRESS_UPDATE:
                var value:int = body[0] as int;
                updateProgress(value);
                break;
        }
    }

    private function updateProgress(value:int):void {
        view.updateProgress(value);
    }
}
}