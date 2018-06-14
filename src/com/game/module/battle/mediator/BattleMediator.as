/**
 * Created by dingcj on 2018/6/1.
 */
package com.game.module.battle.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.common.view.Alert;
import com.game.module.battle.events.BattleEvent;
import com.game.module.battle.proxy.BattleModel;
import com.game.module.battle.proxy.BattleProxy;
import com.game.module.battle.view.BattleView;
import com.game.module.battle.vo.BaseBattleEventVo;
import com.game.module.battle.vo.BattleDialogVo;
import com.game.module.battle.vo.BattleExpertVo;
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

    private var proxy:BattleProxy;
    private var model:BattleModel;

    private var eventArr:Array = [];//对话事件&&特殊事件的列表

    private function get view():BattleView {
        return getViewComponent() as BattleView;
    };
    public function BattleMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();

        proxy = facade.retrieveProxy(BattleProxy.NAME) as BattleProxy;
        model = proxy.model;

        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
        view.closeSignal.getSignal(this).listen(onCloseClick);
    }

    private function instanceCompleteHander():void {
        model.copyId = view.data;
        rejectToEventData();
    }

    private function rejectToEventData():void {
        eventArr = [];
        if (isHasDialogEvent) {
            var vo:BattleDialogVo = BattleDialogVo.create(model.copyCfg.dialogEventIntroduce, model.copyCfg.dialogEventContent, model.copyCfg.dialogEventRule, model.copyCfg.dialogEventFeedback);
            eventArr.push(vo);
        }
        var arr:Array = model.copyCfg.expertEventKeyword.split('|');
        for (var i = 0; i < arr.length; i++) {
            var vo:BattleExpertVo = BattleExpertVo.create(model.copyCfg.expertEventIntroduce, parseInt(arr[i]), model.copyCfg.expertEventRule, model.copyCfg.expertEventFeedback);
            eventArr.push(vo);
        }
    }

    private function get isHasDialogEvent():Boolean {
        return model.copyCfg.dialogEventIntroduce != "";
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
                eventHandle();
                break;
            case BattleEvent.BATTLE_EVENT_FINISHED:
                eventHandle();
                break;
            case BattleEvent.BATTLE_RESULT:
                view.removeFetterView();
                view.removeProgressView();
                view.resetView();
                resultDisplay();
                break;
        }
    }

    private function eventHandle():void {
        view.removeEventView();
        if (eventArr == null || eventArr.length == 0) {
            //说明事件结束了 开始羁绊
            fetterDisplay();
            return;
        }
        var vo:BaseBattleEventVo = eventArr[0];
        view.addEventView(vo);
        eventArr.shift();
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