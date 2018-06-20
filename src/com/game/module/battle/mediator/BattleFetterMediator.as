/**
 * Created by dingcj on 2018/6/12.
 */
package com.game.module.battle.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.module.battle.events.BattleEvent;
import com.game.module.battle.proxy.BattleProxy;
import com.game.module.battle.view.BattleFetterView;
import com.game.module.battle.view.items.BattlePlayerSelectItem;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

import utils.ArrayUtil;

public class BattleFetterMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "BattleFetterMediator";

    private var proxy:BattleProxy;
    private var score:int;

    private var maxCount:int = 3;//最大可选角色数量
    private var selectList:Array = [];//已经选中的列表

    private function get view():BattleFetterView {
        return getViewComponent() as BattleFetterView;
    };

    public function BattleFetterMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        selectList = [];

        proxy = facade.retrieveProxy(BattleProxy.NAME) as BattleProxy;

        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
        view.playerSelectSignal.getSignal(this).listen(onPlayerSelectItemClick);
        view.sureSignal.getSignal(this).listen(onSureClick);
    }

    private function onSureClick():void {
        //计算羁绊所得分数
        score = 100;
        dispatch(new Notification(BattleEvent.BATTLE_PROGRESS_UPDATE, [score]));

        dispatch(new Notification(BattleEvent.BATTLE_RESULT));
    }

    private function instanceCompleteHander():void {

    }

    private function onPlayerSelectItemClick(item:BattlePlayerSelectItem):void {
        if (isInSelection(item)) {
            item.updateCheck(false);
            ArrayUtil.remove(selectList, item);
            return;
        }
        if (isSelectionFull)return;
        selectList.push(item);
        item.updateCheck(true);
    }

    private function isInSelection(item:BattlePlayerSelectItem):Boolean {
        return ArrayUtil.find(selectList, function (cell:BattlePlayerSelectItem) {
                    return cell == item;
                }) != null;
    }

    private function get isSelectionFull():Boolean {
        return selectList.length >= maxCount;
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