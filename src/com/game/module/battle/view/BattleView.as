/**
 * Created by dingcj on 2018/6/1.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseWindow;
import com.game.consts.BaseLayer;
import com.game.module.battle.mediator.BattleMediator;
import com.signal.SignalDispatcher;

import laya.display.Sprite;

import laya.events.Event;

import ui.battle.BattleViewUI;

public class BattleView extends BaseWindow {
    private var ui:BattleViewUI;
    public var closeSignal:SignalDispatcher;

    public var progressView:BattleProgressView;//节目得分
    public var strengthView:BattleStrengthView;//公司实力

    public function BattleView() {
        super([]);
        closeSignal = new SignalDispatcher();
        layer = BaseLayer.DISPLAY;
    }

    override public function getMediator():BaseMediator {
        return new BattleMediator(this);
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
        ui = new BattleViewUI();
        addChild(ui);
        adapt();
        init();
    }

    private function init():void {
        addProgressView();
        addStrengthView();
        ui.closeBtn.on(Event.CLICK, this, onClickCloseBtn);
    }

    private function onClickCloseBtn(e:Event):void {
        closeSignal.dispatch(null);
    }

    private function adapt():void {
        ui.x = (Laya.stage.width - ui.width) / 2;
    }

    private function addProgressView():void {
        if (!progressView)progressView = new BattleProgressView();
        addChildView(progressView);
        progressView.pos(120, 0);
    }

    private function addStrengthView():void {
        if (!strengthView)strengthView = new BattleStrengthView();
        addChildView(strengthView);
        strengthView.pos(0, 550);
    }

    public function addChildView(view:Sprite):void {
        if (view && !ui.container.contains(view)) {
            ui.container.addChild(view);
        }
    }

    public function clear():void {
        if (progressView) {
            progressView.tryDispose();
            progressView = null;
        }
    }

    override public function dispose():void {
        super.dispose();
        closeSignal.dispose();
        clear();
        ui.closeBtn.off(Event.CLICK, this, onClickCloseBtn);
    }
}
}