/**
 * Created by dingcj on 2018/5/17.
 */
package com.game.module.tavern.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseWindow;
import com.game.consts.BaseLayer;
import com.game.module.tavern.mediator.HeroDisplayMediator;
import com.signal.SignalDispatcher;

import laya.events.Event;

import ui.tavern.HeroDisplayUI;

public class HeroDisplayView extends BaseWindow {

    private var ui:HeroDisplayUI;
    public var closeSignal:SignalDispatcher;

    public function HeroDisplayView() {
        super();
        closeSignal = new SignalDispatcher();
        layer = BaseLayer.DISPLAY;
    }

    override public function getMediator():BaseMediator {
        return new HeroDisplayMediator(this);
    }

    override public function onComplete():void {
        super.onComplete();
        __onComplete();
        adapt();
        init();
    }

    private function adapt():void {
        ui.x = (Laya.stage.width - ui.width) / 2;
    }

    private function init():void {
        ui.on(Event.CLICK, this, onClick);
    }

    private function onClick(e:Event):void {
        closeSignal.dispatch(null);
    }

    private function __onComplete():void {
        ui = new HeroDisplayUI();
        addChild(ui);
    }

    override public function dispose():void {
        super.dispose();
    }
}
}