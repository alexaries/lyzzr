/**
 * Created by dingcj on 2018/6/12.
 */
package com.game.module.battle.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.battle.mediator.BattleFetterMediator;

import ui.battle.BattleFetterViewUI;

public class BattleFetterView extends BaseView {

    private var ui:BattleFetterViewUI;

    public function BattleFetterView() {
        super([]);
    }

    override public function getMediator():BaseMediator {
        return new BattleFetterMediator(this);
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
        ui = new BattleFetterViewUI();
        addChild(ui);

        init();
    }

    private function init():void {
        updateState(0);
    }

    public function updateState(state:int = 0):void {
        ui.pre.visible = state == 0;
        ui.info.visible = state == 1;
    }

    override public function dispose():void {
        super.dispose();
    }
}
}