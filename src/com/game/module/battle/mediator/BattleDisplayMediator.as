/**
 * Created by dingcj on 2018/6/20.
 */
package com.game.module.battle.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.module.battle.view.BattleDisplayView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class BattleDisplayMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "BattleDisplayMediator";

    private function get view():BattleDisplayView {
        return getViewComponent() as BattleDisplayView;
    };
    public function BattleDisplayMediator(__viewComponent:Object = null) {
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