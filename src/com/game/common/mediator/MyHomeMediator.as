package com.game.common.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.common.view.MyHomeView;
import com.game.events.NotiEvent;
import com.game.module.menu.events.MenuEvent;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.ActivityVO;
import com.game.vo.MenuWinType;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

import ui.main.MyHomeUI;

public class MyHomeMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "MyHomeMediator";

    private function get view():MyHomeView {
        return getViewComponent() as MyHomeView;
    }

    public function MyHomeMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
        view.outSignal.getSignal(this).listen(outFight);
        view.build.gotoActivitySignal.getSignal(this).listen(gotoActivityHandler);
    }

    private function get main():MyHomeUI {
        return view.ui;
    }

    private function instanceCompleteHander():void {

    }

    private function gotoActivityHandler(acVo:ActivityVO):void {
//        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.TAVERN_VIEW, MenuWindowVO.OPEN)));
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.COMPANY_VIEW, MenuWindowVO.OPEN)));
    }

    private function closeWin(menuWinTypeName:String, data:Object = null):void {
        var vo:MenuWindowVO = new MenuWindowVO(menuWinTypeName, MenuWindowVO.CLOSE, data);
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, vo));
    }

    private function openWin(menuWinTypeName:String, data:Object):void {
        var vo:MenuWindowVO = new MenuWindowVO(menuWinTypeName, MenuWindowVO.OPEN, data);
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, vo));
    }

    public function outFight():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.COPY_VIEW, MenuWindowVO.OPEN, new Object())));
        dispatch(new Notification(NotiEvent.CLOSE_MONEY));
    }

    private function closeWindow(name:String, body:Object):void {
        view.closeWindow(name, body);
    }

    public function openWindow(menuWinTypeName:String, data:Object) {
        view.openWindow(menuWinTypeName, data);
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

        }
    }
}
}