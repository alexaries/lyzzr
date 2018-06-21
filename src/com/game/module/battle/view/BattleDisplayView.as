/**
 * Created by dingcj on 2018/6/20.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.operation.Oper;
import com.game.common.operation.TweenOper;
import com.game.common.view.BaseView;
import com.game.module.battle.mediator.BattleDisplayMediator;

import ui.battle.BattleDisplayViewUI;

public class BattleDisplayView extends BaseView {

    private var ui:BattleDisplayViewUI;

    public function BattleDisplayView() {
        super([]);
    }

    override public function getMediator():BaseMediator {
        return new BattleDisplayMediator(this);
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

    private var oper:Oper;

    function __onComplete():void {
        ui = new BattleDisplayViewUI();
        this.addChild(ui);

    }

    public function tweenInfo():void {
        if (oper) {
            oper.halt();
            oper = null;
        }

        oper = new Oper();
        oper.add(new TweenOper(this.ui.bgIcon, 800, {scaleX: 0.8, scaleY: 0.8}));

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