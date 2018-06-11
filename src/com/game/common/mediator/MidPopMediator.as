package com.game.common.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.events.NotiEvent;
import com.game.module.menu.events.MenuEvent;
import com.game.common.view.MidPopView;
import com.game.vo.MenuWinType;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

import com.game.common.mvc.BaseMediator;

public class MidPopMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "MidPopMediator";

    private function get view():MidPopView {
        return getViewComponent() as MidPopView;
    };
    public function MidPopMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [NotiEvent.SHOW_RECHARGE, NotiEvent.SHOW_SHORTCUT, NotiEvent.SHOW_SHORTCUT_NEW, NotiEvent.SHOW_GOLD_AD, NotiEvent.SHOW_CDKEY, NotiEvent.SHOW_CHARGEPOPUP,NotiEvent.SHOW_SHORTCUT_USE];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case NotiEvent.SHOW_RECHARGE:
                var isShow:Boolean = false;
                if (body) {
                    isShow = true;
                }
                if (isShow) {
                    facade.notifyObservers(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.RECHARGE_WIN, MenuWindowVO.OPEN)));
//                    openWindow(MenuWinType.RECHARGE_WIN, null);
                } else {
                    facade.notifyObservers(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.RECHARGE_WIN, MenuWindowVO.CLOSE)));
//                    closeWindow(MenuWinType.RECHARGE_WIN);
                }
//                view.showRechargeView(body as Boolean);
                break;
            case NotiEvent.SHOW_SHORTCUT:
                view.showShortcutBuyView(body as Array);
                break;
            case NotiEvent.SHOW_SHORTCUT_NEW:
              //  view.showShortcutBuyNewView(body as Array);
                break;
            case NotiEvent.SHOW_GOLD_AD:
                view.showGoldAd(body as Boolean);
                break;
            case NotiEvent.SHOW_CDKEY:
                view.showCdKeyView(body as Boolean);
                break;
            case NotiEvent.SHOW_CHARGEPOPUP:
                var arr:Array = body as Array
                view.showChargeSucessView(arr[0],arr[1]);
                break;
            case NotiEvent.SHOW_SHORTCUT_USE:
                view.showShortcutUseView(body as Array);
                break;
        }
    }
}
}