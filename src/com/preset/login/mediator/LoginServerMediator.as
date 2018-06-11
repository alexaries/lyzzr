/**
 * Created by dingcj on 2017/11/1.
 */
package com.preset.login.mediator {
import com.preset.login.events.LoginEvent;
import com.preset.login.view.LoginServerView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;
import org.puremvc.as3.patterns.observer.Notification;

public class LoginServerMediator extends Mediator implements IMediator {
    public static const NAME:String = "LoginServerMediator";

    private function get view():LoginServerView {
        return getViewComponent() as LoginServerView;
    }

    public function LoginServerMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.closeClick.getSignal(this).listen(onClickClose);
        view.selectClick.getSignal(this).listen(onClickSelect);
    }

    private function onClickClose():void {
        dispatch(new Notification(LoginEvent.CLOSE_SERVER));
    }

    private function onClickSelect():void {
        dispatch(new Notification(LoginEvent.UPDATE_SELECT));
        dispatch(new Notification(LoginEvent.CLOSE_SERVER));
    }

    private function dispatch(notification:Notification):void {
        facade.notifyObservers(notification);
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [LoginEvent.CLOSE_NOTICE];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case LoginEvent.CLOSE_NOTICE:
                view.clearNotice();
                break;
        }
    }
}
}