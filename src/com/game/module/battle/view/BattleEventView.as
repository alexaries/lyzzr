/**
 * Created by dingcj on 2018/6/11.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.battle.mediator.BattleEventMediator;
import com.game.module.battle.view.items.BattleSelectionItem;
import com.game.module.copy.view.items.PropertyItem;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.utils.Handler;

import ui.battle.BattleEventViewUI;

public class BattleEventView extends BaseView {
    private var ui:BattleEventViewUI;

    public var skipSignal:SignalDispatcher;
    public var moreSignal:SignalDispatcher;
    public var sureSignal:SignalDispatcher;

    public var itemSignal:SignalDispatcher;

    public function BattleEventView() {
        super([]);
        skipSignal = new SignalDispatcher();
        moreSignal = new SignalDispatcher();
        sureSignal = new SignalDispatcher();
        itemSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new BattleEventMediator(this);
    }

    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
    }

    override public function onComplete():void {
        __onComplete();
        super.onComplete();
    }

    function __onComplete():void {
        ui = new BattleEventViewUI();
        addChild(ui);
        init();
    }

    private function init():void {
        ui.skipBtn.on(Event.CLICK, this, onClickSkipBtn, null);
        ui.moreBtn.on(Event.CLICK, this, onClickMoreBtn, null);
        ui.sureBtn.on(Event.CLICK, this, onClickSureBtn, null);

        ui.list.itemRender = PropertyItem;
        ui.list.renderHandler = Handler.create(this, onRenderItem, null, false);

        ui.playerList.hScrollBarSkin = "";
        ui.playerList.itemRender = BattleSelectionItem;
        ui.playerList.renderHandler = Handler.create(this, onRenderPlayerItem, null, false);

        var arr:Array = [];
        for (var i = 0; i < 20; i++) {
            arr.push("");
        }
        ui.playerList.array = arr;

        itemSignal.getSignal(this).listen(onItemClick);
    }

    public function onItemClick(item:BattleSelectionItem, selectIndex:int) {
        ui.playerList.cells.forEach(function (cell:BattleSelectionItem) {
            cell.updateCheck(false);
        });
        item.updateCheck(true);
        updateInfo();
    }

    //选中新的角色后更新信息
    private function updateInfo() {

    }

    private function onRenderPlayerItem(cell:BattleSelectionItem, index:int):void {
        cell.initInfo(index, itemSignal);
    }

    private function onRenderItem(cell:PropertyItem, index:int):void {

    }

    private function onClickSureBtn(e:Event):void {
        if (sureSignal)sureSignal.dispatch(null);
    }

    private function onClickMoreBtn(e:Event):void {
        if (moreSignal)moreSignal.dispatch(null);
    }

    private function onClickSkipBtn(e:Event):void {
        if (skipSignal)skipSignal.dispatch(null);
    }

    override public function dispose():void {
        super.dispose();
        ui.skipBtn.off(Event.CLICK, this, onClickSkipBtn, null);
        ui.moreBtn.off(Event.CLICK, this, onClickMoreBtn, null);
        ui.sureBtn.off(Event.CLICK, this, onClickSureBtn, null);
        if (ui.list.renderHandler)ui.list.renderHandler.clear();

        skipSignal.dispose();
        moreSignal.dispose();
        sureSignal.dispose();
        itemSignal.dispose();
    }
}
}