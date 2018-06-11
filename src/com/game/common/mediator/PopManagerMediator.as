/**
 * Created by dingcj on 2018/5/23.
 */
package com.game.common.mediator {
import com.game.common.mvc.BaseMediator;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class PopManagerMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "PopManagerMediator";

    private function get view() {
        return getViewComponent();
    };
    public function PopManagerMediator(__viewComponent:Object = null) {
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