/**
 * Created by dingcj on 2018/6/22.
 */
package com.game.module.roll.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.events.NotiEvent;
import com.game.module.roll.view.RollScreenView;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class RollScreenMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "RollScreenMediator";

    private function get view():RollScreenView {
        return getViewComponent() as RollScreenView;
    };
    public function RollScreenMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [
            NotiEvent.ROLL_SCREEN,
            NotiEvent.ROLL_ALERT,
            NotiEvent.ROLL_MIDDLE_SCREEN
        ];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case NotiEvent.ROLL_SCREEN:
                //普通信息滚屏
                if (body is Array) {
                    var arr:Array = body as Array
                    view.rollText(arr[0], arr[1]);
                } else {
                    view.rollText(body as String);
                }
                break;
            case NotiEvent.ROLL_ALERT:
                //提示信息滚屏
                view.rollAlert(body as String);
                break;
            case NotiEvent.ROLL_MIDDLE_SCREEN:
                view.rollMiddleText(body as String)
                break

        }
    }
}
}