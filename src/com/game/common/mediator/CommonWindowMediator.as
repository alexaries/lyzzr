/**
 * Created by dingcj on 2017/8/22.
 */
package com.game.common.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.view.CommonWindowView;
import com.game.module.menu.events.MenuEvent;
import com.game.vo.MenuWinType;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseMediator;
import org.puremvc.as3.patterns.observer.Notification;

public class CommonWindowMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "CommonWindowMediator";

    private var uiView:CommonWindowView;

    private function get view():CommonWindowView {
        return getViewComponent() as CommonWindowView;
    };
    public function CommonWindowMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        uiView = view;

        uiView.cancelClick.getSignal(this).listen(onClick);
        uiView.sureClick.getSignal(this).listen(onClick);
    }

    private function onClick():void {
        facade.notifyObservers(new MenuEvent(MenuEvent.MENU_CLIK,  new MenuWindowVO(MenuWinType.COMMONWINDOW, MenuWindowVO.CLOSE)));
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