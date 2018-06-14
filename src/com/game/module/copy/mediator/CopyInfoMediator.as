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
    }

    private function onFiveClick():void {

    }

    private function onOnceClick():void {

    }

    private function onStartClick():void {
        dispatch(new Notification(BattleEvent.BATTLE_ENTER, [101]));
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