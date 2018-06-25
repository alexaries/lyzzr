/**
 * Created by dingcj on 2018/5/23.
 */
package com.game.module.copy.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.module.battle.events.BattleEvent;
import com.game.module.copy.view.CopyInfoView;
import com.game.module.menu.events.MenuEvent;
import com.game.vo.MenuWinType;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class CopyInfoMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "CopyInfoMediator";

    private function get view():CopyInfoView {
        return getViewComponent() as CopyInfoView;
    };
    public function CopyInfoMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();

        view.closeSignal.getSignal(this).listen(onCloseClick);
        view.startSignal.getSignal(this).listen(onStartClick);
        view.onceSignal.getSignal(this).listen(onOnceClick);
        view.fiveSignal.getSignal(this).listen(onFiveClick);
        view.onCompleteSignal.getSignal(this).listen(onInstanceComplete);
    }

    private function onInstanceComplete():void {

    }

    private function onFiveClick():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.COPY_MOP_VIEW, MenuWindowVO.OPEN, [5, view.cfg.ID])));
    }

    private function onOnceClick():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.COPY_MOP_VIEW, MenuWindowVO.OPEN, [1, view.cfg.ID])));
    }

    private function onStartClick():void {
        dispatch(new Notification(BattleEvent.BATTLE_ENTER, [view.cfg.ID]));
        trace("查看一下  copyId:" + view.cfg.ID);
    }

    private function onCloseClick():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.COPY_INFO_VIEW, MenuWindowVO.CLOSE)));
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