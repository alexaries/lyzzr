/**
 * Created by dingcj on 2018/6/13.
 */
package com.game.module.battle.view.items {
import laya.ui.Box;

import ui.battle.BattleStarItemUI;

public class BattleStarItem extends Box {

    private var ui:BattleStarItemUI;

    public function BattleStarItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new BattleStarItemUI();
        this.addChild(ui);

        init();
    }

    private function init():void {
        ui.check.visible = false;
    }

    public function updateInfo(isCheck:Boolean):void {
        ui.check.visible = isCheck;
    }
}
}
