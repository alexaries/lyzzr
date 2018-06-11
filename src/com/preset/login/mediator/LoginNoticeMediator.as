/**
 * Created by dingcj on 2017/11/2.
 */
package com.preset.login.mediator {
import com.preset.login.events.LoginEvent;
import com.preset.login.view.LoginNoticeView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;
import org.puremvc.as3.patterns.observer.Notification;

public class LoginNoticeMediator extends Mediator implements IMediator {
    public static const NAME:String = "LoginNoticeMediator";

    private function get view():LoginNoticeView {
        return getViewComponent() as LoginNoticeView;
    };
    public function LoginNoticeMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.closeClick.getSignal(this).listen(onClickClose);
    }

    private function onClickClose():void {
        dispatch(new Notification(LoginEvent.CLOSE_NOTICE));
    }

    private function dispatch(notification:Notification):void {
        facade.notifyObservers(notification);
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