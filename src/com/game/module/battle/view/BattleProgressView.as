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
    private var curValue:Number = 0;
    private var maxValue:int = 0;
    private var intervalTime:int = 400;
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

    public function refresh(maxValue:int):void {
        this.maxValue = maxValue;
        this.curValue = 0;
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
//        maxValue = ui.progress.bg.width;
    }

    public function updateProgress(proValue:Number):void {
        curValue += proValue;
        var progress:Number = (Number)(curValue) / (Number)(maxValue);
        progress = progress >= 1 ? 1 : progress;
        if (oper) {
            oper.halt();
            oper = null;
        }

        oper = new TweenOper(ui.progress, intervalTime, {value: progress});
        oper.do_execute();
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