/**
 * Created by dingcj on 2018/6/1.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.operation.Oper;
import com.game.common.operation.TweenOper;
import com.game.common.view.BaseView;
import com.game.module.battle.mediator.BattleProgressMediator;

import ui.battle.BattleProgressUI;

public class BattleProgressView extends BaseView {
    private var ui:BattleProgressUI;
    private var curValue:int = 0;
    private var maxLength:int = 0;
    private var delayTime:int = 400;
    private var oper:Oper;

    public function BattleProgressView() {
        super([]);
    }

    override public function getMediator():BaseMediator {
        return new BattleProgressMediator(this);
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
        ui = new BattleProgressUI();
        addChild(ui);
        init();
    }

    private function init():void {
        maxLength = ui.progress.bg.width;
    }

    public function updateProgress(value):void {
        curValue += value;
        var progress:Number = (Number)(curValue) / (Number)(maxLength);
        progress = progress >= 1 ? 1 : progress;
        if (oper) {
            oper.halt();
            oper = null;
        }
        oper = new Oper();
        oper.add(new TweenOper(ui.progress, delayTime, {value: progress}));
        oper.list.forEach(function (item:Oper) {
            item.do_execute();
        });
    }

    override public function dispose():void {
        super.dispose();
        if (oper) {
            oper.halt();
            oper = null;
        }
    }
}
}