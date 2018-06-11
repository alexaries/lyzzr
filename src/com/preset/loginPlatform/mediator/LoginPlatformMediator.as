/**
 * Created by dingcj on 2017/11/18.
 */
package com.preset.loginPlatform.mediator {
import com.preset.loginPlatform.view.LoginPlatformView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;

public class LoginPlatformMediator extends Mediator implements IMediator {
    public static const NAME:String = "LoginPlatformMediator";

    private function get view():LoginPlatformView {
        return getViewComponent() as LoginPlatformView;
    };
    public function LoginPlatformMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
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