/**
 * Created by dingcj on 2018/6/12.
 */
package com.game.module.battle.view.items {
import laya.ui.Box;

import ui.battle.BattlePlayerItemUI;

public class BattlePlayerItem extends Box {

    private var ui:BattlePlayerItemUI;

    public function BattlePlayerItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new BattlePlayerItemUI();
        this.addChild(ui);

        ui.empty.visible = true;
        ui.info.visible = false;
    }

    public function updateInfo():void {

    }
}
}
