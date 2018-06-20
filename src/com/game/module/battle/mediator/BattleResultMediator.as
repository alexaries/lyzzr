/**
 * Created by dingcj on 2018/6/13.
 */
package com.game.module.battle.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.module.battle.events.BattleEvent;
import com.game.module.battle.view.BattleResultView;
import com.game.module.menu.events.MenuEvent;
import com.game.vo.MenuWinType;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class BattleResultMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "BattleResultMediator";

    private function get view():BattleResultView {
        return getViewComponent() as BattleResultView;
    };
    public function BattleResultMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
        view.finishSignal.getSignal(this).listen(onFinishClick);
        view.moreSignal.getSignal(this).listen(onMoreClick);
    }

    private function onMoreClick():void {
        dispatch(new Notification(BattleEvent.BATTLE_ENTER, [102]));
    }

    private function onFinishClick():void {
        //战斗结束
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.BATTLE_VIEW, MenuWindowVO.CLOSE)));
    }

    private function instanceCompleteHander():void {

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