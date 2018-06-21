/**
 * Created by dingcj on 2018/6/20.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.operation.Oper;
import com.game.common.operation.TweenOper;
import com.game.common.view.BaseView;
import com.game.module.battle.mediator.BattleDisplayMediator;
import com.signal.SignalDispatcher;

import laya.events.Event;

import ui.battle.BattleDisplayViewUI;

public class BattleDisplayView extends BaseView {

    private var ui:BattleDisplayViewUI;
    private var oper:Oper;

    public var finishSignal:SignalDispatcher;
    public var clickSignal:SignalDispatcher;

    private var fromscaleX:Number = 5;
    private var fromscaleY:Number = 5;

    private var toscaleX:Number = 1;
    private var toscaleY:Number = 1;

    private var intervalTime:int = 800;
    private var isFinished:Boolean = false;

    public function BattleDisplayView() {
        super([]);
        finishSignal = new SignalDispatcher();
        clickSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new BattleDisplayMediator(this);
    }

    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
        handleTween();
    }

    public function refresh(fighter:Object):void {
        //这个地方第一次生成&&每次打开 都会重新刷新一次
        isFinished = false;
    }

    override public function onComplete():void {
        __onComplete();
        super.onComplete();
    }

    function __onComplete():void {
        ui = new BattleDisplayViewUI();
        this.addChild(ui);
        init();
        handleTween();
    }

    private function init():void {
        this.ui.on(Event.CLICK, this, onClick);
    }

    private function onClick():void {
        if (!isFinished)return;
        clickSignal.dispatch(null);
    }

    public function handleTween():void {
        ui.bgIcon.scale(fromscaleX, fromscaleY);

        if (oper) {
            oper.halt();
            oper = null;
        }

        oper = new TweenOper(this.ui.bgIcon, intervalTime, {scaleX: toscaleX, scaleY: toscaleY});
        oper.onCompleteSignal.getSignal(this).listen(onFinish);
        oper.do_execute();
    }

    private function onFinish():void {
        isFinished = true;
        finishSignal.dispatch(null);
    }

    override public function dispose():void {
        super.dispose();

        if (oper) {
            oper.halt();
            oper = null;
        }

        this.ui.off(Event.CLICK, this, onClick);
        finishSignal.dispose();
        clickSignal.dispose();
    }
}
}