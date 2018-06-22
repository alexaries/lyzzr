/**
 * Created by dingcj on 2018/6/22.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.Alert;
import com.game.common.view.BaseView;
import com.game.module.battle.mediator.ExpertSelectionMediator;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.utils.Handler;

import ui.battle.ExpertSelectionViewUI;

import utils.ArrayUtil;

public class ExpertSelectionView extends BaseView {

    private var ui:ExpertSelectionViewUI;
    public var sureSignal:SignalDispatcher;
    public var itemListSignal:SignalDispatcher;
    public var itemSelectedSignal:SignalDispatcher;

    private var selectArr:Array = [];//存储propertyId
    private var listArr:Array = [];//存储propertyId

    private var selectMaxCount:int = 10;

    public function ExpertSelectionView() {
        super([]);

        sureSignal = new SignalDispatcher();
        itemListSignal = new SignalDispatcher();
        itemSelectedSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new ExpertSelectionMediator(this);
    }

    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
    }

    public function refresh():void {

    }

    override public function onComplete():void {
        __onComplete();
        super.onComplete();
    }

    function __onComplete():void {
        ui = new ExpertSelectionViewUI();
        this.addChild(ui);

        init();
    }

    private function init():void {

        ui.bg.on(Event.CLICK, this, onClickBg);
        ui.cancelBtn.on(Event.CLICK, this, onClickCancelBtn);
        ui.sureBtn.on(Event.CLICK, this, onClickSureBtn);

        ui.selectedList.itemRender = ExpertPropertyItem;
        ui.selectedList.renderHandler = Handler.create(this, onRenderSelectedItem, null, false);
        ui.selectedList.array = [];

        ui.selectedList.repeatX = 5;
        ui.selectedList.repeatY = 2;
        ui.selectedList.spaceX = 20;
        ui.selectedList.spaceY = 10;

        ui.list.itemRender = ExpertPropertyItem;
        ui.list.renderHandler = Handler.create(this, onRenderListItem, null, false);
//        ui.list.array = [];
        ui.list.repeatX = 6;
        ui.list.repeatY = 5;
        ui.list.spaceX = 20;
        ui.list.spaceY = 10;

        itemListSignal.getSignal(this).listen(onItemListClick);
        itemSelectedSignal.getSignal(this).listen(onItemSelectedClick);

        initList();
    }

    private function initList():void {
        listArr = [];
        for (var i = 0; i < 30; i++) {
            listArr.push(i);
        }
        ui.list.array = listArr;
    }

    private function onItemSelectedClick(id:int):void {
        ArrayUtil.remove(selectArr, id);
        ui.selectedList.array = selectArr;
        listArr.push(id);
        ui.list.array = listArr;
    }

    private function onItemListClick(id:int):void {
        if (selectArr.length >= selectMaxCount) {
            Alert.roll("无法选中更多的属性");
            return;
        }
        selectArr.push(id);
        ui.selectedList.array = selectArr;
        ArrayUtil.remove(listArr, id);
        ui.list.array = listArr;
    }

    private function onRenderListItem(cell:ExpertPropertyItem, index:int):void {
        cell.initInfo(itemListSignal, ui.list.array[index]);
    }

    private function onRenderSelectedItem(cell:ExpertPropertyItem, index:int):void {
        cell.initInfo(itemSelectedSignal, ui.selectedList.array[index]);
    }

    private function onClickSureBtn():void {
        if (sureSignal)sureSignal.dispatch(null);
    }

    private function onClickCancelBtn():void {
        this.hide();
    }

    private function onClickBg():void {
        this.hide();
    }

    override public function dispose():void {
        super.dispose();

        ui.bg.off(Event.CLICK, this, onClickBg);
        ui.cancelBtn.off(Event.CLICK, this, onClickCancelBtn);
        ui.sureBtn.off(Event.CLICK, this, onClickSureBtn);

        if (sureSignal)sureSignal.dispose();
        if (itemListSignal)itemListSignal.dispose();
        if (itemSelectedSignal)itemSelectedSignal.dispose();

        selectArr = [];
        listArr = [];

        if (ui.selectedList.renderHandler)ui.selectedList.renderHandler.clear();
        if (ui.list.renderHandler)ui.list.renderHandler.clear();
    }
}
}