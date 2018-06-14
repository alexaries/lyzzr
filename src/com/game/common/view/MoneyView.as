/**
 * Created by dingcj on 2018/6/14.
 */
package com.game.common.view {
import com.game.common.mediator.MoneyMediator;
import com.game.common.mvc.BaseMediator;
import com.signal.SignalDispatcher;

import laya.events.Event;

import ui.main.MoneyViewUI;

public class MoneyView extends BaseView {
    private var ui:MoneyViewUI;

    public var tiSignal:SignalDispatcher;
    public var jinSignal:SignalDispatcher;
    public var zuanSignal:SignalDispatcher;

    public function MoneyView() {
        super([]);

        tiSignal = new SignalDispatcher();
        jinSignal = new SignalDispatcher();
        zuanSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new MoneyMediator(this);
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
        ui = new MoneyViewUI();
        addChild(ui);
        init();
    }

    private function init():void {
        ui.tiBtn.on(Event.CLICK, this, onClickTiBtn);
        ui.jinBtn.on(Event.CLICK, this, onClickJinBtn);
        ui.zuanBtn.on(Event.CLICK, this, onClickZuanBtn);
    }

    private function onClickZuanBtn():void {
        if (zuanSignal)zuanSignal.dispatch(null);
    }

    private function onClickJinBtn():void {
        if (jinSignal)jinSignal.dispatch(null);
    }

    private function onClickTiBtn():void {
        if (tiSignal)tiSignal.dispatch(null);
    }

    public function updateTiLi(value:int, maxValue:int):void {
        ui.tiLabel.text = value + "/" + maxValue;
    }

    public function updateJinBi(value:int):void {
        ui.jinLabel.text = value + "";
    }

    public function updateZuanShi(value:int):void {
        ui.zuanLabel.text = value + "";
    }

    override public function dispose():void {
        super.dispose();

        if (tiSignal)tiSignal.dispose();
        if (jinSignal)jinSignal.dispose();
        if (zuanSignal)zuanSignal.dispose();
    }
}
}