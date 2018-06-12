/**
 * Created by dingcj on 2018/6/1.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.battle.mediator.BattleStrengthMediator;
import com.signal.SignalDispatcher;

import ui.battle.BattleStrengthViewUI;

public class BattleStrengthView extends BaseView {
    private var ui:BattleStrengthViewUI;
    public var finishSignal:SignalDispatcher;
    private var delayTime:int = 1000;

    public function BattleStrengthView() {
        super([]);

        finishSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new BattleStrengthMediator(this);
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
        ui = new BattleStrengthViewUI();
        addChild(ui);
        init();
    }

    private function init():void {
        timerOnce(delayTime, this, delay);
    }

    private function delay():void {
        if (finishSignal)finishSignal.dispatch(null);
    }

    override public function dispose():void {
        super.dispose();
        finishSignal.dispose();
        clearTimer(this, delay);
    }
}
}