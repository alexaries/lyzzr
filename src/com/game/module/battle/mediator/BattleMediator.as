/**
 * Created by dingcj on 2018/6/1.
 */
package com.game.module.battle.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.common.view.Alert;
import com.game.module.battle.events.BattleEvent;
import com.game.module.battle.view.BattleView;
import com.game.module.menu.events.MenuEvent;
import com.game.vo.MenuWinType;

import lang.SystemInfo;

import laya.utils.Handler;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class BattleMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "BattleMediator";
    private var maxCount = 2;//特殊事件触发最大次数
    private var curCount = 0;//当前特殊事件触发次数

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
        trace( "...:" + view.data);
    }

    private function onCloseClick():void {
        Alert.show("体力已经扣除，退出将不保存副本进度，确定要退出?", "退出提示", [SystemInfo.OK, SystemInfo.CANCEL], Handler.create(this, function (type:String) {
            if (type == "ok") {
                dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.BATTLE_VIEW, MenuWindowVO.CLOSE)));
            }
            else if (type == "cancel") {
                return;
            }
        }, null, true));
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [
            BattleEvent.BATTLE_STRENGTH_FINISHED,
            BattleEvent.BATTLE_EVENT_FINISHED,
            BattleEvent.BATTLE_RESULT
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
                if (curCount >= maxCount) fetterDisplay();
                else eventDisplay();
                break;
            case BattleEvent.BATTLE_RESULT:
                view.removeFetterView();
                view.removeProgressView();
                view.resetView();
                resultDisplay();
                break;
        }
    }

    //特殊事件
    public function eventDisplay(state:int = 0):void {
        curCount++;
        view.addEventView();
    }

    //召唤羁绊
    public function fetterDisplay():void {
        view.addFetterView();
    }

    //战斗结果
    public function resultDisplay():void {
        view.addResultView();
    }
}
}