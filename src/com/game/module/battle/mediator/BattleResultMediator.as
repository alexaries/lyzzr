/**
 * Created by dingcj on 2018/6/13.
 */
package com.game.module.battle.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.module.battle.view.BattleResultView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class BattleResultMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "BattleResultMediator";

    private function get view():BattleResultView {
        return getViewComponent() as BattleResultView;
    };
    public function BattleResultMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
        view.finishSignal.getSignal(this).listen(onFinishClick);
    }

    private function onFinishClick():void {
        //战斗结束
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