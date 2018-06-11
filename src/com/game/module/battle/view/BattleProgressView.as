/**
 * Created by dingcj on 2018/6/1.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.battle.mediator.BattleProgressMediator;

import ui.battle.BattleProgressUI;

public class BattleProgressView extends BaseView {
    private var ui:BattleProgressUI;

    public function BattleProgressView() {
        super([]);
    }

    override public function dispose():void {
        super.dispose();
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
    }

}
}