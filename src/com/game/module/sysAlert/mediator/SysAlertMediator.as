/**
 * Created by dingcj on 2018/1/9.
 */
package com.game.module.sysAlert.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.module.menu.events.MenuEvent;
import com.game.module.sysAlert.view.SysAlertView;
import com.game.module.sysAlert.vo.SysAlertRequest;
import com.game.vo.MenuWinType;

import laya.utils.Handler;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class SysAlertMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "SysAlertMediator";

    private function get view():SysAlertView {
        return getViewComponent() as SysAlertView;
    };
    public function SysAlertMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.closeSignal.getSignal(this).listen(onCloseClick);
        SysAlertRequest.getInstance().onComplete.completes(Handler.create(this, onAlerComplete));
    }

    private function onAlerComplete(data:*):void {
        view.onAlertComplete(data);
    }

    private function onCloseClick():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.SYS_ALERT_VIEW, MenuWindowVO.CLOSE)));
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