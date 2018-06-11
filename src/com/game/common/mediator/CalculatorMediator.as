/**
 * Created by dingcj on 2017/8/21.
 */
package com.game.common.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.CalculatorView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class CalculatorMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "CalculatorMediator";

    private function get view():CalculatorView {
        return getViewComponent() as CalculatorView;
    };
    public function CalculatorMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
    }

    private function instanceCompleteHander():void {
        view.sureClick.getSignal(this).listen(onClickSureBtn);
    }

    private function onClickSureBtn(num:Number):void {
//        facade.notifyObservers(new Notification(CalculatorEvent.NOTIFY_NUM, {_num: num}));
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