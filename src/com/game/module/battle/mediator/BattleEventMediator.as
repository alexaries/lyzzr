/**
 * Created by dingcj on 2018/6/11.
 */
package com.game.module.battle.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.module.battle.view.BattleEventView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class BattleEventMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "BattleEventMediator";

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
    }

    private function onSureClick():void {

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