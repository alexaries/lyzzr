/**
 * Created by dingcj on 2018/6/22.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.battle.mediator.ExpertSelectionMediator;
import com.game.module.copy.view.items.PropertyItem;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.utils.Handler;

import ui.battle.ExpertSelectionViewUI;

public class ExpertSelectionView extends BaseView {

    private var ui:ExpertSelectionViewUI;
    public var sureSignal:SignalDispatcher;
    public var itemListSignal:SignalDispatcher;
    public var itemSelectedSignal:SignalDispatcher;

    private var selectArr:Array = [];

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

        ui.selectedList.itemRender = PropertyItem;
        ui.selectedList.renderHandler = Handler.create(this, onRenderSelectedItem, null, false);
        ui.selectedList.array = [];

        ui.list.itemRender = PropertyItem;
        ui.list.renderHandler = Handler.create(this, onRenderListItem, null, false);
        ui.list.array = [];
    }

    private function onRenderListItem(cell:PropertyItem, index:int):void {


    }

    private function onRenderSelectedItem(cell:PropertyItem, index:int):void {

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

        if (ui.selectedList.renderHandler)ui.selectedList.renderHandler.clear();
        if (ui.list.renderHandler)ui.list.renderHandler.clear();
    }
}
}