/**
 * Created by dingcj on 2018/6/12.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.battle.mediator.BattleFetterMediator;
import com.game.module.battle.view.items.BattlePlayerItem;
import com.game.module.battle.view.items.BattlePlayerSelectItem;
import com.game.module.copy.view.items.PropertyItem;
import com.game.module.copy.view.items.PropertyValueItem;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.utils.Handler;

import ui.battle.BattleFetterViewUI;

public class BattleFetterView extends BaseView {

    private var ui:BattleFetterViewUI;

    public var playerSelectSignal:SignalDispatcher;
    public var sureSignal:SignalDispatcher;

    public function BattleFetterView() {
        super([]);

        playerSelectSignal = new SignalDispatcher();
        sureSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new BattleFetterMediator(this);
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
        ui = new BattleFetterViewUI();
        addChild(ui);

        init();
    }

    private function init():void {
        updateState(0);

        //pre
        ui.prefetterBtn.on(Event.CLICK, this, onPrefetterClick);

        //info
        ui.lastBtn.on(Event.CLICK, this, onLastClick);
        ui.sureBtn.on(Event.CLICK, this, onSureClick);

        ui.needList.itemRender = PropertyItem;
        ui.needList.renderHandler = Handler.create(this, onRenderNeedItem, null, false);
        ui.needList.spaceX = 20;

        ui.selectedList.itemRender = BattlePlayerItem;
        ui.selectedList.renderHandler = Handler.create(this, onRenderPlayerItem, null, false);
        ui.selectedList.spaceX = 80;

        ui.propertyList.itemRender = PropertyValueItem;
        ui.propertyList.renderHandler = Handler.create(this, onRenderPropertyItem, null, false);
        ui.propertyList.repeatX = 2;
        ui.propertyList.spaceX = 60;
        ui.propertyList.spaceY = 20;

        ui.tab.selectHandler = Handler.create(this, onSelectTab, null, false);
        ui.tab.selectedIndex = 0;

        ui.playerList.vScrollBarSkin = "";
        ui.playerList.itemRender = BattlePlayerSelectItem;
        ui.playerList.renderHandler = Handler.create(this, onRenderPlayerSelectItem, null, false);
        ui.playerList.repeatX = 4;
        ui.playerList.repeatY = 100;

        ui.playerList.spaceX = 20;
        ui.playerList.spaceY = 20;
    }

    private function onSureClick(e:Event):void {
        if (sureSignal)sureSignal.dispatch(null);
    }

    private function onRenderPlayerSelectItem(cell:BattlePlayerSelectItem, index:int):void {
        cell.initInfo(playerSelectSignal, index);
    }

    private function onSelectTab(index:int):void {
        trace("....你选择了第:" + index + "个选项");
        onSortList(index);
    }

    private function onSortList(index:int):void {
        trace("按照类型分类");

        var arr:Array = [];
        for (var i = 0; i < 20; i++) {
            arr.push("" + i);
        }
        ui.playerList.array = arr;
    }

    private function onRenderPlayerItem(cell:BattlePlayerItem, index:int):void {

    }

    private function onRenderPropertyItem(cell:PropertyValueItem, index:int):void {

    }

    private function onRenderNeedItem(cell:PropertyItem, index:int):void {

    }

    private function onLastClick(e:Event):void {

    }

    private function onPrefetterClick(e:Event):void {
        updateState(1);
    }

    public function updateState(state:int = 0):void {
        ui.pre.visible = state == 0;
        ui.info.visible = state == 1;
    }

    override public function dispose():void {
        super.dispose();
        ui.prefetterBtn.off(Event.CLICK, this, onPrefetterClick);
        ui.lastBtn.off(Event.CLICK, this, onLastClick);

        if (ui.needList.renderHandler)ui.needList.renderHandler.clear();
        if (ui.selectedList.renderHandler)ui.selectedList.renderHandler.clear();
        if (ui.propertyList.renderHandler)ui.propertyList.renderHandler.clear();
        if (ui.tab.selectHandler)ui.tab.selectHandler.clear();
        if (ui.playerList.renderHandler)ui.playerList.renderHandler.clear();

        if (playerSelectSignal)playerSelectSignal.dispose();
        if (sureSignal)sureSignal.dispose();
    }
}
}