/**
 * Created by dingcj on 2018/6/12.
 */
package com.game.module.battle.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.module.battle.view.BattleFetterView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class BattleFetterMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "BattleFetterMediator";

    private function get view():BattleFetterView {
        return getViewComponent() as BattleFetterView;
    };

    public function BattleFetterMediator(__viewComponent:Object = null) {
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