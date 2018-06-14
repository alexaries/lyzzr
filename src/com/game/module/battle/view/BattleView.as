/**
 * Created by dingcj on 2018/6/1.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseWindow;
import com.game.consts.BaseLayer;
import com.game.module.battle.mediator.BattleMediator;
import com.game.module.battle.vo.BaseBattleEventVo;
import com.signal.SignalDispatcher;

import laya.display.Sprite;
import laya.events.Event;

import ui.battle.BattleViewUI;

public class BattleView extends BaseWindow {
    private var ui:BattleViewUI;
    public var closeSignal:SignalDispatcher;

    public var progressView:BattleProgressView;//节目得分
    public var strengthView:BattleStrengthView;//公司实力
    public var eventView:BattleEventView;//特殊事件以及事件结果
    public var fetterView:BattleFetterView;//召唤羁绊
    public var resultView:BattleResultView;//结果

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

    public function get data():int {
        return _data as int;
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

    public function addProgressView():void {
        if (!progressView)progressView = new BattleProgressView();
        addChildView(progressView);
        progressView.pos(120, 0);
    }

    public function addStrengthView():void {
        if (!strengthView)strengthView = new BattleStrengthView();
        addChildView(strengthView);
        strengthView.pos(0, 550);
    }

    public function addEventView(vo:BaseBattleEventVo):void {
        if (!eventView)eventView = new BattleEventView(vo);
        addChildView(eventView);
        eventView.pos(0, 400);
    }

    public function addFetterView():void {
        if (!fetterView)fetterView = new BattleFetterView();
        addChildView(fetterView);
        fetterView.pos(0, 200);
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