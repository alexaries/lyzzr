/**
 * Created by dingcj on 2018/6/1.
 */
package com.game.module.battle.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.module.battle.events.BattleEvent;
import com.game.module.battle.view.BattleView;
import com.game.module.menu.events.MenuEvent;
import com.game.vo.MenuWinType;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class BattleMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "BattleMediator";

    private function get view():BattleView {
        return getViewComponent() as BattleView;
    };
    public function BattleMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
        view.closeSignal.getSignal(this).listen(onCloseClick);
    }

    private function instanceCompleteHander():void {

    }

    private function onCloseClick():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.BATTLE_VIEW, MenuWindowVO.CLOSE)));
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [
            BattleEvent.BATTLE_STRENGTH_FINISHED,
            BattleEvent.BATTLE_EVENT_FINISHED
        ];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case BattleEvent.BATTLE_STRENGTH_FINISHED:
                view.removeStrengthView();
                eventDisplay();
                break;
            case BattleEvent.BATTLE_EVENT_FINISHED:
                view.removeEventView();
                fetterDisplay();
                break;
        }
    }

    //特殊事件
    public function eventDisplay():void {
        view.addEventView();
    }

    //召唤羁绊
    public function fetterDisplay():void {
        view.addFetterView();
    }
}
}