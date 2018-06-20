/**
 * Created by dingcj on 2018/6/15.
 */
package com.game.module.company.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseFrame;
import com.game.common.view.MoneyView;
import com.game.module.company.mediator.CompanyMediator;
import com.game.module.company.view.items.CompanyDepartItem;
import com.game.module.company.view.items.CompanyExpertItem;
import com.game.module.copy.view.items.PropertyValueItem;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.utils.Handler;

import ui.company.CompanyViewUI;

public class CompanyView extends BaseFrame {
    public var closeSignal:SignalDispatcher;
    public var ruleSignal:SignalDispatcher;
    public var moreSignal:SignalDispatcher;

    private var ui:CompanyViewUI;
    private var money:MoneyView;
    private var editorView:CompanyEditorView;

    public function CompanyView() {
        super([]);

        closeSignal = new SignalDispatcher();
        ruleSignal = new SignalDispatcher();
        moreSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new CompanyMediator(this);
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
        ui = new CompanyViewUI();
        this.addChild(ui);

        if (!money) {
            money = new MoneyView();
            ui.moneyBox.addChild(money);
        }

        init();
        adapt();
    }

    private function adapt():void {
        setContent(ui);
    }

    private function init():void {
        ui.closeBtn.on(Event.CLICK, this, onClickCloseBtn);
        ui.ruleBtn.on(Event.CLICK, this, onClickRuleBtn);
        ui.trainBtn.on(Event.CLICK, this, onClickTrainBtn);
        ui.changeBtn.on(Event.CLICK, this, onClickChangeBtn);
        ui.moreBtn.on(Event.CLICK, this, onClickMoreBtn);

        ui.propertyList.itemRender = PropertyValueItem;
        ui.propertyList.renderHandler = Handler.create(this, onRenderPropertyValueItem, null, false);
        ui.propertyList.repeatX = 4;
        ui.propertyList.repeatY = 1;
        ui.propertyList.spaceX = 10;

        ui.departList.itemRender = CompanyDepartItem;
        ui.departList.renderHandler = Handler.create(this, onRenderCompanyDepartItem, null, false);
        ui.departList.repeatX = 4;
        ui.departList.repeatY = 1;
        ui.departList.spaceX = 10;

        ui.expertList.itemRender = CompanyExpertItem;
        ui.expertList.renderHandler = Handler.create(this, onRenderCompanyExpertItem, null, false);
        ui.expertList.spaceX = 10;
        ui.expertList.repeatY = 1;
        ui.expertList.hScrollBarSkin = "";

        updateExpert();
    }

    private function updateExpert():void {
        var arr:Array = [];
        for (var i = 0; i < 10; i++) {
            arr.push("");
        }
        ui.expertList.array = arr;
    }

    private function onRenderCompanyExpertItem(cell:CompanyExpertItem, index:int):void {

    }

    private function onRenderCompanyDepartItem(cell:CompanyDepartItem, index:int):void {

    }

    private function onRenderPropertyValueItem(cell:PropertyValueItem, index:int):void {

    }

    private function onClickMoreBtn():void {
        if (moreSignal)moreSignal.dispatch(null);
    }

    private function onClickChangeBtn():void {
        openEditor();
    }

    private function onClickTrainBtn():void {

    }

    private function onClickRuleBtn():void {
        if (ruleSignal)ruleSignal.dispatch(null);
    }

    private function onClickCloseBtn():void {
        if (closeSignal)closeSignal.dispatch(null);
    }

    private function openEditor():void {
        if (!editorView)editorView = new CompanyEditorView();
        if (!ui.container.contains(editorView))ui.container.addChild(editorView);
        editorView.show();
        editorView.refresh();
    }

    private function removeEditor():void {
        if (ui.container.contains(editorView))ui.container.removeChild(editorView);
        if (editorView) {
            editorView.tryDispose();
            editorView = null;
        }
    }

    override public function dispose():void {
        super.dispose();
        if (money) {
            money.tryDispose();
            money = null;
        }
        if (closeSignal)closeSignal.dispose();
        if (ruleSignal)ruleSignal.dispose();
        if (moreSignal)moreSignal.dispose();

        ui.closeBtn.off(Event.CLICK, this, onClickCloseBtn);
        ui.ruleBtn.off(Event.CLICK, this, onClickRuleBtn);
        ui.trainBtn.off(Event.CLICK, this, onClickTrainBtn);
        ui.changeBtn.off(Event.CLICK, this, onClickChangeBtn);
        ui.moreBtn.off(Event.CLICK, this, onClickMoreBtn);

        if (ui.propertyList.renderHandler)ui.propertyList.renderHandler.clear();
        if (ui.departList.renderHandler)ui.departList.renderHandler.clear();
        if (ui.expertList.renderHandler)ui.expertList.renderHandler.clear();

        removeEditor();
    }
}
}