package com.game.common.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.GameMain;
import com.game.module.user.proxy.UserProxy;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class ScreenMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "ScreenMediator";

    private var userProxy:UserProxy;

    private function get view():GameMain {
        return getViewComponent() as GameMain;
    };
    public function ScreenMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
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

        switch(name){
            default:
                break;
        }
    }
}
}