/**
 * Created by dingcj on 2018/6/1.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseFrame;
import com.game.consts.BaseLayer;
import com.game.module.battle.mediator.BattleMediator;
import com.game.module.battle.proxy.BattleModel;
import com.game.module.battle.vo.BaseBattleEventVo;
import com.signal.SignalDispatcher;

import laya.display.Sprite;
import laya.events.Event;

import ui.battle.BattleViewUI;

public class BattleView extends BaseFrame {
    private var ui:BattleViewUI;
    public var closeSignal:SignalDispatcher;

    public var progressView:BattleProgressView;//节目得分
    public var strengthView:BattleStrengthView;//公司实力
    public var eventView:BattleEventView;//特殊事件以及事件结果
    public var fetterView:BattleFetterView;//召唤羁绊
    public var displayView:BattleDisplayView;//展示界面
    public var resultView:BattleResultView;//结果

    private var model:BattleModel;

    public function BattleView() {
        super([]);
        closeSignal = new SignalDispatcher();
        layer = BaseLayer.POP_FRAME;
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

    public function get data():int {
        return _data as int;
    }

    private function init():void {
        ui.closeBtn.on(Event.CLICK, this, onClickCloseBtn);
    }

    private function onClickCloseBtn(e:Event):void {
        closeSignal.dispatch(null);
    }

    private function adapt():void {
        setContent(ui);
    }

    public function initInfo(model:BattleModel):void {
        this.model = model;

//        addProgressView(model.copyCfg.star3Score);
        addProgressView(1000);
        addStrengthView();
    }

    public function addProgressView(maxValue:int = 1):void {
        if (!progressView)progressView = new BattleProgressView();
        addChildView(progressView);
        progressView.refresh(maxValue);
        progressView.pos(120, 0);
    }

    public function addStrengthView():void {
        if (!strengthView)strengthView = new BattleStrengthView();
        addChildView(strengthView);
        strengthView.pos(0, 550);
    }

    public function addEventView(vo:BaseBattleEventVo):void {
        if (!eventView) {
            eventView = new BattleEventView();
            addChildView(eventView);
            eventView.refresh(vo);
            eventView.pos(0, 400);
        }
        else {
            eventView.refresh(vo);
            eventView.show();
        }
    }

    public function addFetterView():void {
        if (!fetterView)fetterView = new BattleFetterView();
        addChildView(fetterView);
        fetterView.pos(0, 200);
    }

    public function addDisplayView(fighter:Object):void {
        if (!displayView) {
            displayView = new BattleDisplayView();
            addChildView(displayView);
            displayView.refresh(fighter);
        }
        else {
            displayView.refresh(fighter);
            displayView.show();
        }
    }

    public function addResultView():void {
        if (!resultView)resultView = new BattleResultView();
        addChildView(resultView);
        resultView.pos(0, 0);
    }

    private function addChildView(view:Sprite):void {
        if (view && !ui.container.contains(view)) {
            ui.container.addChild(view);
        }
    }

    public function removeProgressView():void {
        if (progressView) {
            progressView.tryDispose();
            progressView = null;
        }
    }

    public function removeStrengthView():void {
        if (strengthView) {
            strengthView.tryDispose();
            strengthView = null;
        }
    }

    public function hideEventView():void {
        if (eventView) {
            eventView.hide();
        }
    }

    public function removeEventView():void {
        if (eventView) {
            eventView.tryDispose();
            eventView = null;
        }
    }

    public function removeFetterView():void {
        if (fetterView) {
            fetterView.tryDispose();
            fetterView = null;
        }
    }

    public function hideDisplayView():void {
        if (displayView) {
            displayView.hide();
        }
    }

    public function removeDisplayView():void {
        if (displayView) {
            displayView.tryDispose();
            displayView = null;
        }
    }

    public function removeResultView():void {
        if (resultView) {
            resultView.tryDispose();
            resultView = null;
        }
    }

    public function clear():void {
        removeProgressView();
        removeStrengthView();
        removeEventView();
        removeFetterView();
        removeDisplayView();
        removeResultView();
    }

    public function resetView():void {
        ui.closeBtn.visible = false;
    }

    override public function dispose():void {
        super.dispose();
        closeSignal.dispose();
        clear();
        ui.closeBtn.off(Event.CLICK, this, onClickCloseBtn);
    }
}
}