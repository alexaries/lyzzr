/**
 * Created by dingcj on 2018/5/21.
 */
package com.game.module.copy.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.events.NotiEvent;
import com.game.module.copy.proxy.CopyProxy;
import com.game.module.copy.view.CopyView;
import com.game.module.menu.events.MenuEvent;
import com.game.vo.MenuWinType;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class CopyMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "CopyMediator";

    private var proxy:CopyProxy;

    private function get view():CopyView {
        return getViewComponent() as CopyView;
    };
    public function CopyMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();

        proxy = facade.retrieveProxy(CopyProxy.NAME) as CopyProxy;
        proxy.isInCopy = true;

        view.closeSignal.getSignal(this).listen(closeClick);
        view.itemSignal.getSignal(this).listen(itemClick);
    }

    private function itemClick():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.COPY_INFO_VIEW, MenuWindowVO.OPEN)));
    }

    private function closeClick():void {
        dispatch(new Notification(NotiEvent.CLOSE_COPY));
    }

    override public function onRemove():void {
        super.onRemove();
        proxy.isInCopy = false;
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