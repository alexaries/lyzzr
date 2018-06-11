/**
 * Created by dingcj on 2018/5/17.
 */
package com.game.module.tavern.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseWindow;
import com.game.consts.BaseLayer;
import com.game.module.tavern.mediator.TavernHireMediator;
import com.signal.SignalDispatcher;

import laya.events.Event;

import ui.tavern.TavernHireViewUI;

public class TavernHireView extends BaseWindow {
    private var ui:TavernHireViewUI;
    public var getSignal:SignalDispatcher;

    public function TavernHireView() {
        super();
        getSignal = new SignalDispatcher();
        layer = BaseLayer.SPECIAL;
    }

    override public function getMediator():BaseMediator {
        return new TavernHireMediator(this);
    }

    override public function onComplete():void {
        super.onComplete();
        __onComplete();
    }

    private function __onComplete():void {
        ui = new TavernHireViewUI();
        addChild(ui);
        adapt();
        init();
    }

    private function adapt():void {
        ui.x = (Laya.stage.width - ui.width) / 2;
    }

    private function init():void {
        ui.getBtn.on(Event.CLICK, this, onClickGetBtn);
    }

    private function onClickGetBtn(e:Event):void {
        getSignal.dispatch(null);
    }

    override public function dispose():void {
        super.dispose();

        getSignal.dispose();
    }
}
}